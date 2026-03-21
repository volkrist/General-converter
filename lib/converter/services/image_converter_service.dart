import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_avif/flutter_avif.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:heif_converter/heif_converter.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_render/pdf_render.dart';

import '../../constants/app_strings.dart';
import '../conversion_matrix.dart';
import '../models/converted_file.dart';
import '../models/image_format.dart';
import '../output_file_validator.dart';
import 'image_pure_worker.dart';

/// [ui.Image.toByteData] кладёт данные в общий [ByteBuffer]: `buffer.asUint8List()`
/// без offset/length захватывает весь буфер → битый PNG и ошибка «файл повреждён».
Uint8List _copyByteDataRange(ByteData data) {
  return Uint8List.fromList(
    Uint8List.view(
      data.buffer,
      data.offsetInBytes,
      data.lengthInBytes,
    ),
  );
}

/// Конвертация изображений и простой PDF (MVP): отдельные пути decode / encode.
///
/// Промежуточное представление — **PNG bytes** (растр).
///
/// Тяжёлая работа пакета `image` выполняется в отдельном [Isolate] (кроме web),
/// чтобы не блокировать UI и избежать ANR на Android.
///
/// **PDF:** только **одна страница** при вводе и **одна картинка = одна страница**
/// при выводе; многостраничный экспорт не поддерживается.
class ImageConverterService {
  /// На телефонах файлы >50 MB почти гарантированно рвут лимит памяти при декоде.
  static const int maxFileSizeBytes = 50 * 1024 * 1024;

  /// Сначала гоняем через нативный ресайз, чтобы не читать 80 MB JPEG в Dart целиком.
  static const int _preShrinkMinBytes = 10 * 1024 * 1024;

  @visibleForTesting
  static bool preShrinkWouldApply(int fileLengthBytes, ImageFormat source) {
    if (kIsWeb) return false;
    if (fileLengthBytes < _preShrinkMinBytes) return false;
    if (source == ImageFormat.pdf || source == ImageFormat.avif) return false;
    return true;
  }

  Future<ConvertedFile> convert({
    required File inputFile,
    required ImageFormat targetFormat,
  }) async {
    final fileLength = await inputFile.length();
    if (fileLength > maxFileSizeBytes) {
      throw Exception(AppStrings.fileTooLarge);
    }

    final sourceFormat = ImageFormat.fromPath(inputFile.path);
    if (sourceFormat == null) {
      throw Exception(AppStrings.unsupportedInputFormat);
    }

    if (!ConversionMatrix.isAllowed(sourceFormat, targetFormat)) {
      throw Exception(AppStrings.formatPairNotSupported);
    }

    try {
      var workingPngBytes = await _decodeToPngBytes(
        inputFile: inputFile,
        sourceFormat: sourceFormat,
        fileLength: fileLength,
      );

      if (sourceFormat != ImageFormat.pdf) {
        workingPngBytes = await _normalizeWorkingPngForMemory(
          workingPngBytes: workingPngBytes,
          sourceFileLengthBytes: fileLength,
        );
      }

      // Пик памяти при PDF (HEIC → PDF часто рвёт процесс): заранее ужимаем растр.
      if (targetFormat == ImageFormat.pdf && sourceFormat != ImageFormat.pdf) {
        final maxSide = sourceFormat == ImageFormat.heic ? 2048 : 2560;
        workingPngBytes =
            await _runDownscalePngMaxSide(workingPngBytes, maxSide);
      }

      final outPath = _buildOutputPath(
        inputPath: inputFile.path,
        targetFormat: targetFormat,
      );

      switch (targetFormat) {
        case ImageFormat.heic:
          return _encodeHeic(
              workingPngBytes: workingPngBytes, outPath: outPath);

        case ImageFormat.avif:
          return _encodeAvif(
              workingPngBytes: workingPngBytes, outPath: outPath);

        case ImageFormat.webp:
          return _encodeWebp(
              workingPngBytes: workingPngBytes, outPath: outPath);

        case ImageFormat.pdf:
          return _encodePdf(
              workingPngBytes: workingPngBytes, outPath: outPath);

        case ImageFormat.jpg:
        case ImageFormat.png:
        case ImageFormat.gif:
        case ImageFormat.tiff:
        case ImageFormat.bmp:
          return _encodeBasic(
            workingPngBytes: workingPngBytes,
            targetFormat: targetFormat,
            outPath: outPath,
          );
      }
    } on OutOfMemoryError {
      throw Exception(AppStrings.notEnoughMemory);
    } catch (e) {
      if (e is Exception) rethrow;
      throw Exception(AppStrings.conversionFailed);
    }
  }

  Future<Uint8List> _runWorkerRasterToPng(Uint8List bytes) async {
    try {
      if (kIsWeb) {
        return workerRasterBytesToPng(bytes);
      }
      return await Isolate.run(() => workerRasterBytesToPng(bytes));
    } on FormatException catch (e) {
      throw _exceptionFromWorkerFormat(e);
    }
  }

  Future<Uint8List> _normalizeWorkingPngForMemory({
    required Uint8List workingPngBytes,
    required int sourceFileLengthBytes,
  }) async {
    try {
      if (kIsWeb) {
        return workerNormalizeWorkingPng(
            workingPngBytes, sourceFileLengthBytes);
      }
      return await Isolate.run(
        () => workerNormalizeWorkingPng(
            workingPngBytes, sourceFileLengthBytes),
      );
    } on FormatException catch (e) {
      throw _exceptionFromWorkerFormat(e);
    }
  }

  Exception _exceptionFromWorkerFormat(FormatException e) {
    final code = e.message;
    if (code.contains('dimension') || code.contains('pdf_')) {
      return Exception(AppStrings.invalidImageDimensions);
    }
    if (code.contains('shrink')) {
      return Exception(AppStrings.invalidOrCorruptImage);
    }
    return Exception(AppStrings.invalidOrCorruptImage);
  }

  /// Нативное уменьшение до ~4096 px по длинной стороне (меньше RAM, меньше копий в isolate).
  Future<File?> _nativePreShrinkToJpegTemp(File file) async {
    if (kIsWeb) return null;
    final tmpDir = await getTemporaryDirectory();
    final outPath =
        p.join(tmpDir.path, 'pre_${DateTime.now().microsecondsSinceEpoch}.jpg');
    try {
      final x = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        outPath,
        minWidth: 4096,
        minHeight: 4096,
        quality: 88,
        format: CompressFormat.jpeg,
      );
      if (x == null) return null;
      return File(x.path);
    } catch (_) {
      return null;
    }
  }

  Future<Uint8List> _readRasterWithPreShrink(File inputFile, int fileLength) async {
    File? tmp;
    try {
      if (!kIsWeb && fileLength >= _preShrinkMinBytes) {
        tmp = await _nativePreShrinkToJpegTemp(inputFile);
      }
      final toRead = tmp ?? inputFile;
      final bytes = await toRead.readAsBytes();
      return _runWorkerRasterToPng(bytes);
    } finally {
      if (tmp != null) {
        try {
          if (await tmp.exists()) await tmp.delete();
        } catch (_) {}
      }
    }
  }

  Future<Uint8List> _runDownscalePngMaxSide(Uint8List pngBytes, int maxSide) async {
    try {
      if (kIsWeb) {
        return workerDownscalePngMaxSide(pngBytes, maxSide);
      }
      return await Isolate.run(
        () => workerDownscalePngMaxSide(pngBytes, maxSide),
      );
    } on FormatException catch (e) {
      throw _exceptionFromWorkerFormat(e);
    }
  }

  /// Всегда возвращает PNG bytes растрового изображения (первый кадр для GIF/AVIF).
  Future<Uint8List> _decodeToPngBytes({
    required File inputFile,
    required ImageFormat sourceFormat,
    required int fileLength,
  }) async {
    switch (sourceFormat) {
      case ImageFormat.heic:
        return _decodeHeicFileToPngBytes(inputFile, fileLength);

      case ImageFormat.avif:
        return _decodeAvifFileToPngBytes(inputFile, fileLength);

      case ImageFormat.pdf:
        return _decodePdfToPngBytes(inputFile);

      case ImageFormat.jpg:
      case ImageFormat.png:
      case ImageFormat.webp:
      case ImageFormat.gif:
      case ImageFormat.tiff:
      case ImageFormat.bmp:
        return _readRasterWithPreShrink(inputFile, fileLength);
    }
  }

  /// На Android [HeifConverter] часто даёт нечитаемый PNG; сначала нативный ресайз
  /// (меньше OOM), затем [FlutterImageCompress], затем плагин HEIF.
  Future<Uint8List> _decodeHeicFileToPngBytes(File file, int fileLength) async {
    if (kIsWeb) {
      throw Exception(AppStrings.failedToDecodeHeic);
    }

    if (fileLength >= _preShrinkMinBytes) {
      final tmp = await _nativePreShrinkToJpegTemp(file);
      if (tmp != null) {
        try {
          final b = await tmp.readAsBytes();
          if (b.isNotEmpty) {
            return _runWorkerRasterToPng(b);
          }
        } catch (_) {
          // fall through to other strategies
        } finally {
          try {
            if (await tmp.exists()) await tmp.delete();
          } catch (_) {}
        }
      }
    }

    Future<Uint8List?> tryFlutterImageCompress() async {
      try {
        final jpeg = await FlutterImageCompress.compressWithFile(
          file.path,
          minWidth: 4096,
          minHeight: 4096,
          quality: 92,
          format: CompressFormat.jpeg,
          autoCorrectionAngle: true,
          keepExif: false,
        );
        if (jpeg == null || jpeg.isEmpty) return null;
        return _runWorkerRasterToPng(jpeg);
      } catch (_) {
        return null;
      }
    }

    Future<Uint8List?> tryHeifConverter(String format) async {
      try {
        final convertedPath = await HeifConverter.convert(
          file.path,
          format: format,
        );
        if (convertedPath == null || convertedPath.isEmpty) return null;
        try {
          final raw = await File(convertedPath).readAsBytes();
          if (raw.isEmpty) return null;
          return await _runWorkerRasterToPng(raw);
        } catch (_) {
          return null;
        } finally {
          try {
            await File(convertedPath).delete();
          } catch (_) {}
        }
      } catch (_) {
        return null;
      }
    }

    final fromFic = await tryFlutterImageCompress();
    if (fromFic != null) return fromFic;

    final fromPng = await tryHeifConverter('png');
    if (fromPng != null) return fromPng;

    final fromJpg = await tryHeifConverter('jpg');
    if (fromJpg != null) return fromJpg;

    throw Exception(AppStrings.heicDecodeFailed);
  }

  Future<Uint8List> _decodeAvifFileToPngBytes(File file, int fileLength) async {
    // Не гоняем AVIF через compress-to-JPEG «пре-шринк»: на части устройств даёт
    // мусор / пустой выход; decodeAvif + пиксели надёжнее.

    final bytes = await file.readAsBytes();
    if (bytes.isEmpty) {
      throw Exception(AppStrings.invalidOrCorruptImage);
    }

    final frames = await decodeAvif(bytes);
    if (frames.isEmpty) {
      throw Exception(AppStrings.invalidOrCorruptImage);
    }

    final ui.Image image = frames.first.image;
    try {
      if (image.width <= 0 || image.height <= 0) {
        throw Exception(AppStrings.invalidImageDimensions);
      }
      return await _uiImageToNormalizedPngBytes(image);
    } finally {
      image.dispose();
    }
  }

  /// Пиксели из [ui.Image] → нормализованный PNG в изоляте (без [_runWorkerRasterToPng]).
  Future<Uint8List> _uiImageToNormalizedPngBytes(ui.Image image) async {
    final pngBd = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes =
        pngBd != null && pngBd.lengthInBytes > 0 ? _copyByteDataRange(pngBd) : null;
    if (pngBytes != null && pngBytes.isNotEmpty) {
      try {
        if (kIsWeb) {
          return workerImportEncodedPng(pngBytes);
        }
        return await Isolate.run(() => workerImportEncodedPng(pngBytes));
      } catch (_) {
        // PNG с движка не разобрался в worker — идём в raw RGBA (часто спасает AVIF).
      }
    }

    final rgbaBd = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
    if (rgbaBd == null || rgbaBd.lengthInBytes < 1) {
      throw Exception(AppStrings.invalidOrCorruptImage);
    }
    final w = image.width;
    final h = image.height;
    var raw = _copyByteDataRange(rgbaBd);
    final expected = w * h * 4;
    if (raw.length < expected) {
      throw Exception(AppStrings.invalidOrCorruptImage);
    }
    if (raw.length > expected) {
      raw = Uint8List.fromList(raw.sublist(0, expected));
    }
    try {
      if (kIsWeb) {
        return workerPdfRgbaToPng(raw, w, h);
      }
      return await Isolate.run(() => workerPdfRgbaToPng(raw, w, h));
    } on FormatException catch (e) {
      throw _exceptionFromWorkerFormat(e);
    }
  }

  /// PDF → растр: только **первая страница** ([pdf_render]).
  Future<Uint8List> _decodePdfToPngBytes(File file) async {
    PdfDocument? doc;
    PdfPageImage? pageImage;
    try {
      doc = await PdfDocument.openFile(file.path);
      if (doc.pageCount < 1) {
        throw Exception(AppStrings.invalidOrCorruptImage);
      }
      final page = await doc.getPage(1);
      var w = page.width;
      var h = page.height;
      const maxSide = 2048.0;
      if (w > maxSide || h > maxSide) {
        final scale = maxSide / (w > h ? w : h);
        w *= scale;
        h *= scale;
      }
      final wi = w.ceil().clamp(1, 8192);
      final hi = h.ceil().clamp(1, 8192);

      pageImage = await page.render(
        width: wi,
        height: hi,
        fullWidth: page.width,
        fullHeight: page.height,
      );

      final pixels = Uint8List.fromList(pageImage.pixels);
      final pw = pageImage.width;
      final ph = pageImage.height;
      try {
        if (kIsWeb) {
          return workerPdfRgbaToPng(pixels, pw, ph);
        }
        return await Isolate.run(() => workerPdfRgbaToPng(pixels, pw, ph));
      } on FormatException catch (e) {
        throw _exceptionFromWorkerFormat(e);
      }
    } on MissingPluginException {
      throw Exception(AppStrings.pdfRenderUnavailable);
    } finally {
      pageImage?.dispose();
      if (doc != null) {
        await doc.dispose();
      }
    }
  }

  /// Растр (PNG bytes) → одностраничный PDF ([pdf]).
  Future<ConvertedFile> _encodePdf({
    required Uint8List workingPngBytes,
    required String outPath,
  }) async {
    // Меньшая встраиваемая картинка — меньше OOM при doc.save() на телефонах.
    final pdfPng = await _runDownscalePngMaxSide(workingPngBytes, 1920);

    final doc = pw.Document();
    final image = pw.MemoryImage(pdfPng);

    doc.addPage(
      pw.Page(
        build: (_) => pw.Center(
          child: pw.Image(image),
        ),
      ),
    );

    final bytes = await doc.save();
    if (bytes.isEmpty) {
      throw Exception(AppStrings.outputFileEmpty);
    }
    final outFile = File(outPath);
    await outFile.writeAsBytes(bytes);
    await OutputFileValidator.assertValid(outFile);
    return ConvertedFile(file: outFile, format: ImageFormat.pdf);
  }

  Future<ConvertedFile> _encodeBasic({
    required Uint8List workingPngBytes,
    required ImageFormat targetFormat,
    required String outPath,
  }) async {
    late Uint8List outputBytes;
    try {
      if (kIsWeb) {
        outputBytes =
            workerEncodeBasic(workingPngBytes, targetFormat.index);
      } else {
        outputBytes = await Isolate.run(
          () => workerEncodeBasic(workingPngBytes, targetFormat.index),
        );
      }
    } on FormatException catch (e) {
      throw _exceptionFromWorkerFormat(e);
    } on StateError {
      throw Exception(AppStrings.conversionFailed);
    }

    if (outputBytes.isEmpty) {
      throw Exception(AppStrings.outputFileEmpty);
    }

    final outFile = File(outPath);
    await outFile.writeAsBytes(outputBytes);
    await OutputFileValidator.assertValid(outFile);
    return ConvertedFile(file: outFile, format: targetFormat);
  }

  Future<ConvertedFile> _encodeHeic({
    required Uint8List workingPngBytes,
    required String outPath,
  }) async {
    if (kIsWeb) {
      throw Exception(AppStrings.conversionFailed);
    }

    final tmpDir = await getTemporaryDirectory();
    final tmpName = 'heic_src_${DateTime.now().millisecondsSinceEpoch}.png';
    final tmpInput = File(p.join(tmpDir.path, tmpName));
    await tmpInput.writeAsBytes(workingPngBytes);

    try {
      final result = await FlutterImageCompress.compressAndGetFile(
        tmpInput.absolute.path,
        outPath,
        format: CompressFormat.heic,
        quality: 95,
      );

      if (result == null) {
        throw Exception(AppStrings.failedToEncodeHeic);
      }

      final out = File(result.path);
      await OutputFileValidator.assertValid(out);
      return ConvertedFile(file: out, format: ImageFormat.heic);
    } finally {
      try {
        if (await tmpInput.exists()) await tmpInput.delete();
      } catch (_) {}
    }
  }

  Future<ConvertedFile> _encodeAvif({
    required Uint8List workingPngBytes,
    required String outPath,
  }) async {
    final outFile = File(outPath);
    try {
      final avifBytes = await encodeAvif(workingPngBytes);
      if (avifBytes.isEmpty) {
        throw Exception(AppStrings.failedToEncodeAvif);
      }
      await outFile.writeAsBytes(avifBytes);
      await OutputFileValidator.assertValid(outFile);
      return ConvertedFile(file: outFile, format: ImageFormat.avif);
    } catch (_) {
      final smaller = await _runDownscalePngMaxSide(workingPngBytes, 2048);
      try {
        final avifBytes = await encodeAvif(smaller);
        if (avifBytes.isEmpty) {
          throw Exception(AppStrings.failedToEncodeAvif);
        }
        await outFile.writeAsBytes(avifBytes);
        await OutputFileValidator.assertValid(outFile);
        return ConvertedFile(file: outFile, format: ImageFormat.avif);
      } catch (_) {
        throw Exception(AppStrings.failedToEncodeAvif);
      }
    }
  }

  /// Пакет `image` не даёт encoder для WebP — используем нативный путь плагина.
  Future<ConvertedFile> _encodeWebp({
    required Uint8List workingPngBytes,
    required String outPath,
  }) async {
    if (kIsWeb) {
      throw Exception(AppStrings.conversionFailed);
    }

    final tmpDir = await getTemporaryDirectory();
    final tmpName = 'webp_src_${DateTime.now().millisecondsSinceEpoch}.png';
    final tmpInput = File(p.join(tmpDir.path, tmpName));
    await tmpInput.writeAsBytes(workingPngBytes);

    try {
      final result = await FlutterImageCompress.compressAndGetFile(
        tmpInput.absolute.path,
        outPath,
        format: CompressFormat.webp,
        quality: 95,
      );

      if (result == null) {
        throw Exception(AppStrings.conversionFailed);
      }

      final out = File(result.path);
      await OutputFileValidator.assertValid(out);
      return ConvertedFile(file: out, format: ImageFormat.webp);
    } finally {
      try {
        if (await tmpInput.exists()) await tmpInput.delete();
      } catch (_) {}
    }
  }

  String _buildOutputPath({
    required String inputPath,
    required ImageFormat targetFormat,
  }) {
    final dir = p.dirname(inputPath);
    final base = p.basenameWithoutExtension(inputPath);
    final ts = DateTime.now().millisecondsSinceEpoch;
    return p.join(dir, '${base}_$ts.${targetFormat.extension}');
  }
}
