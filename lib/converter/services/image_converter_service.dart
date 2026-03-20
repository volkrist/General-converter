import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_avif/flutter_avif.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:heif_converter/heif_converter.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_render/pdf_render.dart';

import '../../constants/app_strings.dart';
import '../models/converted_file.dart';
import '../models/image_format.dart';

/// Конвертация изображений и простой PDF (MVP): отдельные пути decode / encode.
///
/// Промежуточное представление — **PNG bytes** (растр).
///
/// **PDF:** только **одна страница** при вводе и **одна картинка = одна страница**
/// при выводе; многостраничный экспорт не поддерживается.
class ImageConverterService {
  static const int maxFileSizeBytes = 100 * 1024 * 1024;

  static const int _maxImageDimension = 4000;
  static const int _autoResizeFileThresholdBytes = 25 * 1024 * 1024;

  Future<ConvertedFile> convert({
    required File inputFile,
    required ImageFormat targetFormat,
  }) async {
    final fileLength = await inputFile.length();
    if (fileLength > maxFileSizeBytes) {
      throw Exception(AppStrings.fileTooLarge100);
    }

    final sourceFormat = ImageFormat.fromPath(inputFile.path);
    if (sourceFormat == null) {
      throw Exception('Unsupported or unknown input file extension');
    }

    try {
      var workingPngBytes = await _decodeToPngBytes(
        inputFile: inputFile,
        sourceFormat: sourceFormat,
      );

      if (sourceFormat != ImageFormat.pdf) {
        workingPngBytes = _normalizeWorkingPngForMemory(
          workingPngBytes: workingPngBytes,
          sourceFileLengthBytes: fileLength,
        );
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
    }
  }

  /// Уменьшает растр, если сторона > [_maxImageDimension] или файл ≥ 25 MB.
  void _assertPositiveDimensions(img.Image image, {required String stage}) {
    if (image.width <= 0 || image.height <= 0) {
      throw Exception(
        '${AppStrings.invalidImageDimensions} ($stage: ${image.width}×${image.height})',
      );
    }
  }

  Uint8List _normalizeWorkingPngForMemory({
    required Uint8List workingPngBytes,
    required int sourceFileLengthBytes,
  }) {
    final decoded = img.decodeImage(workingPngBytes);
    if (decoded == null) {
      throw Exception(AppStrings.invalidOrCorruptImage);
    }
    _assertPositiveDimensions(decoded, stage: 'working PNG');

    final hugePixels = decoded.width > _maxImageDimension ||
        decoded.height > _maxImageDimension;
    final heavyFile = sourceFileLengthBytes >= _autoResizeFileThresholdBytes;

    if (!hugePixels && !heavyFile) {
      return workingPngBytes;
    }

    final resized = _resizeIfNeeded(decoded);
    _assertPositiveDimensions(resized, stage: 'resized');
    return Uint8List.fromList(img.encodePng(resized));
  }

  img.Image _resizeIfNeeded(img.Image source) {
    if (source.width <= _maxImageDimension &&
        source.height <= _maxImageDimension) {
      return source;
    }

    if (source.width >= source.height) {
      final newWidth = _maxImageDimension;
      final newHeight = (source.height * _maxImageDimension / source.width)
          .round()
          .clamp(1, 1 << 20);
      return img.copyResize(
        source,
        width: newWidth,
        height: newHeight,
        interpolation: img.Interpolation.linear,
      );
    }

    final newHeight = _maxImageDimension;
    final newWidth = (source.width * _maxImageDimension / source.height)
        .round()
        .clamp(1, 1 << 20);
    return img.copyResize(
      source,
      width: newWidth,
      height: newHeight,
      interpolation: img.Interpolation.linear,
    );
  }

  /// Всегда возвращает PNG bytes растрового изображения (первый кадр для GIF/AVIF).
  Future<Uint8List> _decodeToPngBytes({
    required File inputFile,
    required ImageFormat sourceFormat,
  }) async {
    switch (sourceFormat) {
      case ImageFormat.heic:
        return _decodeHeicFileToPngBytes(inputFile);

      case ImageFormat.avif:
        return _decodeAvifFileToPngBytes(inputFile);

      case ImageFormat.pdf:
        return _decodePdfToPngBytes(inputFile);

      case ImageFormat.jpg:
      case ImageFormat.png:
      case ImageFormat.webp:
      case ImageFormat.gif:
      case ImageFormat.tiff:
      case ImageFormat.bmp:
        final bytes = await inputFile.readAsBytes();
        return _rasterBytesToPng(bytes);
    }
  }

  Future<Uint8List> _decodeHeicFileToPngBytes(File file) async {
    if (kIsWeb) {
      throw Exception('HEIC/HEIF input is not supported on web');
    }
    final convertedPath = await HeifConverter.convert(
      file.path,
      format: 'png',
    );
    if (convertedPath == null || convertedPath.isEmpty) {
      throw Exception('Failed to convert HEIC/HEIF to PNG (native converter)');
    }
    try {
      final pngBytes = await File(convertedPath).readAsBytes();
      return _rasterBytesToPng(pngBytes);
    } finally {
      try {
        await File(convertedPath).delete();
      } catch (_) {}
    }
  }

  Future<Uint8List> _decodeAvifFileToPngBytes(File file) async {
    final bytes = await file.readAsBytes();
    final frames = await decodeAvif(bytes);
    if (frames.isEmpty) {
      throw Exception('Failed to decode AVIF (no frames)');
    }

    final ui.Image image = frames.first.image;
    try {
      if (image.width <= 0 || image.height <= 0) {
        throw Exception(AppStrings.invalidImageDimensions);
      }
      final byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) {
        throw Exception('Failed to rasterize AVIF frame to PNG');
      }
      return _rasterBytesToPng(byteData.buffer.asUint8List());
    } finally {
      image.dispose();
    }
  }

  Uint8List _rasterBytesToPng(Uint8List bytes) {
    final decoded = img.decodeImage(bytes);
    if (decoded == null) {
      throw Exception(AppStrings.invalidOrCorruptImage);
    }
    _assertPositiveDimensions(decoded, stage: 'decoded');
    final oriented = img.bakeOrientation(decoded);
    _assertPositiveDimensions(oriented, stage: 'after EXIF orientation');
    return Uint8List.fromList(img.encodePng(oriented));
  }

  /// PDF → растр: только **первая страница** ([pdf_render]).
  Future<Uint8List> _decodePdfToPngBytes(File file) async {
    PdfDocument? doc;
    PdfPageImage? pageImage;
    try {
      doc = await PdfDocument.openFile(file.path);
      if (doc.pageCount < 1) {
        throw Exception('PDF has no pages');
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

      final pixels = pageImage.pixels;
      final raster = img.Image.fromBytes(
        width: pageImage.width,
        height: pageImage.height,
        bytes: pixels.buffer,
        bytesOffset: pixels.offsetInBytes,
        numChannels: 4,
        order: img.ChannelOrder.rgba,
      );
      _assertPositiveDimensions(raster, stage: 'PDF page');
      return Uint8List.fromList(img.encodePng(raster));
    } on MissingPluginException catch (e) {
      throw Exception(
        'PDF rendering is not available on this platform (pdf_render): $e',
      );
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
    final doc = pw.Document();
    final image = pw.MemoryImage(workingPngBytes);

    doc.addPage(
      pw.Page(
        build: (_) => pw.Center(
          child: pw.Image(image),
        ),
      ),
    );

    final bytes = await doc.save();
    final outFile = File(outPath);
    await outFile.writeAsBytes(bytes);
    return ConvertedFile(file: outFile, format: ImageFormat.pdf);
  }

  Future<ConvertedFile> _encodeBasic({
    required Uint8List workingPngBytes,
    required ImageFormat targetFormat,
    required String outPath,
  }) async {
    final decoded = img.decodeImage(workingPngBytes);
    if (decoded == null) {
      throw Exception(AppStrings.invalidOrCorruptImage);
    }
    _assertPositiveDimensions(decoded, stage: 'encode');

    late Uint8List outputBytes;

    switch (targetFormat) {
      case ImageFormat.jpg:
        outputBytes = Uint8List.fromList(img.encodeJpg(decoded, quality: 95));
        break;
      case ImageFormat.png:
        outputBytes = Uint8List.fromList(img.encodePng(decoded));
        break;
      case ImageFormat.gif:
        outputBytes = Uint8List.fromList(img.encodeGif(decoded));
        break;
      case ImageFormat.tiff:
        outputBytes = Uint8List.fromList(img.encodeTiff(decoded));
        break;
      case ImageFormat.bmp:
        outputBytes = Uint8List.fromList(img.encodeBmp(decoded));
        break;
      case ImageFormat.heic:
      case ImageFormat.avif:
      case ImageFormat.webp:
      case ImageFormat.pdf:
        throw StateError('Wrong encoder route for $targetFormat');
    }

    final outFile = File(outPath);
    await outFile.writeAsBytes(outputBytes);
    return ConvertedFile(file: outFile, format: targetFormat);
  }

  Future<ConvertedFile> _encodeHeic({
    required Uint8List workingPngBytes,
    required String outPath,
  }) async {
    if (kIsWeb) {
      throw Exception('HEIC output is not supported on web');
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
        throw Exception(
          'HEIC encoding failed (device may not support HEIF writer, API 28+)',
        );
      }

      return ConvertedFile(file: File(result.path), format: ImageFormat.heic);
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
    final avifBytes = await encodeAvif(workingPngBytes);
    final outFile = File(outPath);
    await outFile.writeAsBytes(avifBytes);
    return ConvertedFile(file: outFile, format: ImageFormat.avif);
  }

  /// Пакет `image` не даёт encoder для WebP — используем нативный путь плагина.
  Future<ConvertedFile> _encodeWebp({
    required Uint8List workingPngBytes,
    required String outPath,
  }) async {
    if (kIsWeb) {
      throw Exception('WebP output is not supported on web');
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
        throw Exception(
          'WebP encoding failed (often Android-only in flutter_image_compress)',
        );
      }

      return ConvertedFile(file: File(result.path), format: ImageFormat.webp);
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
