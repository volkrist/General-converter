import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_avif_platform_interface/flutter_avif_platform_interface.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;
import 'package:heif_converter/heif_converter.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdfx/pdfx.dart';

import 'package:general_converter/constants/app_strings.dart';
import 'package:general_converter/converter/models/converted_file.dart';
import 'package:general_converter/converter/models/image_format.dart';
import 'package:general_converter/converter/services/common/conversion_matrix.dart';
import 'package:general_converter/converter/services/common/conversion_policy.dart';
import 'package:general_converter/converter/services/common/image_pure_worker.dart';
import 'package:general_converter/converter/services/common/output_file_validator.dart';
import 'package:general_converter/converter/services/common/output_round_trip_validator.dart';

/// Нативный decode AVIF → плотный RGBA для [workerPdfRgbaToPng] (без Skia/`dart:ui`).
Uint8List _avifNativeFrameToRgba(Uint8List raw, int w, int h) {
  final expected4 = w * h * 4;
  final expected3 = w * h * 3;
  if (raw.length == expected4) {
    return raw;
  }
  if (raw.length == expected3) {
    final out = Uint8List(expected4);
    var o = 0;
    var i = 0;
    for (var p = 0; p < w * h; p++) {
      out[o++] = raw[i++];
      out[o++] = raw[i++];
      out[o++] = raw[i++];
      out[o++] = 255;
    }
    return out;
  }
  if (raw.length > expected4) {
    return Uint8List.fromList(raw.sublist(0, expected4));
  }
  throw const FormatException('avif_native_rgba_len');
}

/// AVIF encode: раньше high-level [encodeAvif] гнал PNG через `dart:ui` (Skia/GPU).
/// На части Adreno + аппаратный HEVC в libavif это даёт гонку и SIGSEGV в `libGLESv2_adreno.so`.
/// Здесь PNG → RGBA только через `package:image` (CPU), затем тот же нативный encode.
Future<Uint8List> _avifEncodeFromPngBytesCpu(Uint8List pngBytes) async {
  final decoded = img.decodeImage(pngBytes) ?? img.decodePng(pngBytes);
  if (decoded == null) {
    throw const FormatException('avif_cpu_png_decode');
  }
  final oriented = img.bakeOrientation(decoded);
  if (oriented.width <= 0 || oriented.height <= 0) {
    throw const FormatException('avif_cpu_png_dim');
  }
  final rgba = oriented.getBytes(order: img.ChannelOrder.rgba);
  final w = oriented.width;
  final h = oriented.height;
  final expected = w * h * 4;
  if (rgba.length != expected) {
    throw FormatException('avif_cpu_rgba_len ${rgba.length} != $expected');
  }

  final api = FlutterAvifPlatform.api;
  final frames = <EncodeFrame>[
    EncodeFrame(data: rgba, durationInTimescale: 1),
  ];

  return api.encodeAvif(
    width: w,
    height: h,
    maxThreads: 1,
    speed: 10,
    timescale: 1,
    maxQuantizer: 40,
    minQuantizer: 25,
    maxQuantizerAlpha: 40,
    minQuantizerAlpha: 25,
    imageSequence: frames,
    exifData: Uint8List(0),
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
  /// Синхронно с [ConversionPolicy.hardLimitBytes] для проверок во ViewModel.
  static int get maxFileSizeBytes => ConversionPolicy.hardLimitBytes;

  Future<ConvertedFile> convert({
    required File inputFile,
    required ImageFormat targetFormat,
  }) async {
    if (!kIsWeb) {
      await _bestEffortCleanupStalePolicyPreShrinkFiles();
    }

    final fileLength = await inputFile.length();
    if (ConversionPolicy.isTooLarge(fileLength)) {
      throw Exception(AppStrings.fileTooLarge);
    }

    final sourceFormat = ImageFormat.fromPath(inputFile.path);
    if (sourceFormat == null) {
      throw Exception(AppStrings.unsupportedInputFormat);
    }

    if (!ConversionMatrix.isAllowed(input: sourceFormat, target: targetFormat)) {
      throw Exception(AppStrings.formatPairNotSupported);
    }

    if (kDebugMode) {
      debugPrint('[GC] convert start: ${inputFile.path}');
      debugPrint(
        '[GC] sourceFormat=$sourceFormat targetFormat=$targetFormat size=$fileLength',
      );
    }

    File? policyTempFile;
    try {
      // Один служебный pre-shrink по политике, затем decode → один финальный encode.
      if (kDebugMode) debugPrint('[GC] preShrink start');
      final workingFile = await _policyPreShrinkIfNeeded(
        inputFile: inputFile,
        inputFormat: sourceFormat,
        targetFormat: targetFormat,
        inputBytes: fileLength,
      );
      if (kDebugMode) debugPrint('[GC] preShrink done: ${workingFile.path}');
      if (workingFile.path != inputFile.path) {
        policyTempFile = workingFile;
      }

      final effectiveFormat =
          ImageFormat.fromPath(workingFile.path) ?? sourceFormat;
      final effectiveLength = await workingFile.length();

      // Pre-shrink / политика — по исходному [fileLength]; normalize — по размеру рабочего файла.
      // Один буфер [stage]: decode → normalize → encode, без лишних одновременных копий в именовании.
      if (kDebugMode) debugPrint('[GC] decode start');
      Uint8List stage = await _decodeToPngBytes(
        inputFile: workingFile,
        sourceFormat: effectiveFormat,
        fileLength: effectiveLength,
      );
      if (kDebugMode) debugPrint('[GC] decode done: ${stage.length}');

      if (effectiveFormat != ImageFormat.pdf) {
        stage = await _normalizeWorkingPngForMemory(
          workingPngBytes: stage,
          sourceFileLengthBytes: effectiveLength,
        );
      }

      final outPath = _buildOutputPath(
        inputPath: inputFile.path,
        targetFormat: targetFormat,
      );

      if (kDebugMode) debugPrint('[GC] encode start: $targetFormat');
      late final ConvertedFile converted;
      switch (targetFormat) {
        case ImageFormat.heic:
          converted = await _encodeHeic(workingPngBytes: stage, outPath: outPath);
          break;

        case ImageFormat.avif:
          converted = await _encodeAvif(workingPngBytes: stage, outPath: outPath);
          break;

        case ImageFormat.webp:
          converted = await _encodeWebp(workingPngBytes: stage, outPath: outPath);
          break;

        case ImageFormat.pdf:
          converted = await _encodePdf(workingPngBytes: stage, outPath: outPath);
          break;

        case ImageFormat.jpg:
        case ImageFormat.png:
        case ImageFormat.gif:
        case ImageFormat.tiff:
        case ImageFormat.bmp:
          converted = await _encodeBasic(
            workingPngBytes: stage,
            targetFormat: targetFormat,
            outPath: outPath,
          );
          break;
      }
      if (kDebugMode) debugPrint('[GC] encode done: $outPath');
      return converted;
    } on OutOfMemoryError {
      throw Exception(AppStrings.notEnoughMemory);
    } catch (e) {
      if (e is Exception) rethrow;
      throw Exception(AppStrings.conversionFailed);
    } finally {
      if (policyTempFile != null) {
        try {
          if (await policyTempFile.exists()) await policyTempFile.delete();
        } catch (_) {}
      }
    }
  }

  /// Старые `_policy_pre_*.jpg` в app temp — на случай kill/краша до `finally`.
  Future<void> _bestEffortCleanupStalePolicyPreShrinkFiles() async {
    try {
      final tmp = await getTemporaryDirectory();
      await _bestEffortDeletePolicyPreJpegsInDir(Directory(tmp.path));
    } catch (_) {}
  }

  Future<void> _bestEffortDeletePolicyPreJpegsInDir(Directory dir) async {
    try {
      if (!await dir.exists()) return;
      await for (final entity in dir.list(followLinks: false)) {
        if (entity is! File) continue;
        final name = p.basename(entity.path);
        if (name.startsWith('_policy_pre_') && name.endsWith('.jpg')) {
          try {
            await entity.delete();
          } catch (_) {}
        }
      }
    } catch (_) {}
  }

  Future<bool> _isDirectoryWritableProbe(Directory dir) async {
    try {
      if (!await dir.exists()) {
        await dir.create(recursive: true);
      }
      final probe = File(
        p.join(dir.path, '.gc_w_probe_${DateTime.now().microsecondsSinceEpoch}'),
      );
      await probe.writeAsBytes(const [0x00], flush: true);
      await probe.delete();
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Сначала [getTemporaryDirectory], иначе каталог входного файла, иначе — контролируемая ошибка.
  Future<String> _resolvePolicyPreJpegFullPath(File inputFile) async {
    final name = '_policy_pre_${DateTime.now().microsecondsSinceEpoch}.jpg';

    try {
      final tmp = await getTemporaryDirectory();
      if (await _isDirectoryWritableProbe(Directory(tmp.path))) {
        return p.join(tmp.path, name);
      }
    } catch (_) {}

    try {
      final parent = inputFile.parent;
      if (await _isDirectoryWritableProbe(parent)) {
        return p.join(parent.path, name);
      }
    } catch (_) {}

    throw Exception(AppStrings.policyPreShrinkNoWritableDir);
  }

  /// Один раз облегчаем вход через нативный JPEG-path (не цепочка пользовательских форматов).
  Future<File> _policyPreShrinkIfNeeded({
    required File inputFile,
    required ImageFormat inputFormat,
    required ImageFormat targetFormat,
    required int inputBytes,
  }) async {
    if (kIsWeb) return inputFile;
    if (inputFormat == ImageFormat.pdf) return inputFile;

    if (!ConversionPolicy.shouldUsePreShrink(
      inputBytes: inputBytes,
      inputFormat: inputFormat,
      targetFormat: targetFormat,
    )) {
      return inputFile;
    }

    final longSide = ConversionPolicy.preShrinkLongSide(
      inputBytes: inputBytes,
      inputFormat: inputFormat,
      targetFormat: targetFormat,
    );

    final targetPath = await _resolvePolicyPreJpegFullPath(inputFile);

    try {
      final result = await FlutterImageCompress.compressAndGetFile(
        inputFile.absolute.path,
        targetPath,
        minWidth: longSide,
        minHeight: longSide,
        quality: 88,
        autoCorrectionAngle: true,
        format: CompressFormat.jpeg,
      );
      if (result == null) {
        try {
          final f = File(targetPath);
          if (await f.exists()) await f.delete();
        } catch (_) {}
        return inputFile;
      }
      return File(result.path);
    } catch (_) {
      try {
        final f = File(targetPath);
        if (await f.exists()) await f.delete();
      } catch (_) {}
      // Нет плагина / сбой натива (unit-тесты) — идём без pre-shrink.
      return inputFile;
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
    if (code.contains('shrink') || code.contains('avif_native')) {
      return Exception(AppStrings.invalidOrCorruptImage);
    }
    return Exception(AppStrings.invalidOrCorruptImage);
  }

  Future<Uint8List> _readRasterFileToPng(File inputFile) async {
    final bytes = await inputFile.readAsBytes();
    return _runWorkerRasterToPng(bytes);
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
        return _readRasterFileToPng(inputFile);
    }
  }

  /// На Android [HeifConverter] часто даёт нечитаемый PNG; сначала нативный ресайз
  /// (меньше OOM), затем [FlutterImageCompress], затем плагин HEIF.
  Future<Uint8List> _decodeHeicFileToPngBytes(File file, int fileLength) async {
    if (kIsWeb) {
      throw Exception(AppStrings.failedToDecodeHeic);
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
    final bytes = await file.readAsBytes();
    if (bytes.isEmpty) {
      throw Exception(AppStrings.invalidOrCorruptImage);
    }

    // Первый кадр через FFI (как и раньше по смыслу «frames.first»), без Skia/`ui.Image`.
    final frame =
        await FlutterAvifPlatform.api.decodeSingleFrameImage(avifBytes: bytes);
    final w = frame.width;
    final h = frame.height;
    if (w <= 0 || h <= 0) {
      throw Exception(AppStrings.invalidImageDimensions);
    }
    final raw = Uint8List.fromList(frame.data);
    try {
      final rgba = _avifNativeFrameToRgba(raw, w, h);
      if (kIsWeb) {
        return workerPdfRgbaToPng(rgba, w, h);
      }
      return await Isolate.run(() => workerPdfRgbaToPng(rgba, w, h));
    } on FormatException catch (e) {
      throw _exceptionFromWorkerFormat(e);
    }
  }

  /// PDF → растр: только **первая страница** ([pdfx]).
  Future<Uint8List> _decodePdfToPngBytes(File file) async {
    PdfDocument? doc;
    PdfPageImage? pageImage;
    try {
      doc = await PdfDocument.openFile(file.path);
      if (doc.pagesCount < 1) {
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
        width: wi.toDouble(),
        height: hi.toDouble(),
        format: PdfPageImageFormat.png,
        quality: 100,
      );
      
      if (pageImage == null) {
        throw Exception(AppStrings.invalidOrCorruptImage);
      }

      final pixels = pageImage.bytes;

      try {
        if (kIsWeb) {
          return workerImportEncodedPng(pixels);
        }
        return await Isolate.run(() => workerImportEncodedPng(pixels));
      } on FormatException catch (e) {
        throw _exceptionFromWorkerFormat(e);
      }
    } on MissingPluginException {
      throw Exception(AppStrings.pdfRenderUnavailable);
    } finally {
      if (doc != null) {
        await doc.close();
      }
    }
  }

  /// Растр (PNG bytes) → одностраничный PDF ([pdf]).
  ///
  /// Всегда отдельный даунскейл max 1920 (даже после policy pre-shrink) — PDF сильно жрёт RAM при save.
  Future<ConvertedFile> _encodePdf({
    required Uint8List workingPngBytes,
    required String outPath,
  }) async {
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
    // Round-trip только для TIFF; JPG/PNG/GIF/BMP не трогаем (скорость).
    if (targetFormat == ImageFormat.tiff) {
      await OutputRoundTripValidator.assertDecodesAfterWrite(
        outFile,
        ImageFormat.tiff,
      );
    }
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
      final avifBytes = await _avifEncodeFromPngBytesCpu(workingPngBytes);
      if (avifBytes.isEmpty) {
        throw Exception(AppStrings.failedToEncodeAvif);
      }
      await outFile.writeAsBytes(avifBytes);
      await OutputFileValidator.assertValid(outFile);
      await OutputRoundTripValidator.assertDecodesAfterWrite(
        outFile,
        ImageFormat.avif,
      );
      return ConvertedFile(file: outFile, format: ImageFormat.avif);
    } catch (_) {
      final smaller = await _runDownscalePngMaxSide(workingPngBytes, 2048);
      try {
        final avifBytes = await _avifEncodeFromPngBytesCpu(smaller);
        if (avifBytes.isEmpty) {
          throw Exception(AppStrings.failedToEncodeAvif);
        }
        await outFile.writeAsBytes(avifBytes);
        await OutputFileValidator.assertValid(outFile);
        await OutputRoundTripValidator.assertDecodesAfterWrite(
          outFile,
          ImageFormat.avif,
        );
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
