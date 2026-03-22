import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdfx/pdfx.dart';

import '../../../constants/app_strings.dart';
import '../../models/image_format.dart';
import '../common/conversion_matrix.dart';
import '../common/conversion_policy.dart';
import '../common/image_pure_worker.dart';
import '../common/normalize_service.dart';
import '../common/output_bytes_validator.dart';
import '../common/output_round_trip_validator.dart';
import '../common/pre_shrink_service.dart';
import 'webp_encode.dart';

/// Конвертация в браузере: **Uint8List → Uint8List**, та же матрица/политика/worker, что и на Android.
class WebImageConverterService {
  Future<Uint8List> convert({
    required Uint8List inputBytes,
    required String inputFileName,
    required ImageFormat targetFormat,
  }) async {
    if (ConversionPolicy.isTooLarge(inputBytes.length)) {
      throw Exception(AppStrings.fileTooLarge);
    }

    final sourceFormat = ImageFormat.fromPath(inputFileName) ??
        ImageFormat.fromExtension(_extensionFromFileName(inputFileName));
    if (sourceFormat == null) {
      throw Exception(AppStrings.unsupportedInputFormat);
    }

    if (!ConversionMatrix.isAllowed(
      input: sourceFormat,
      target: targetFormat,
    )) {
      throw Exception(AppStrings.formatPairNotSupported);
    }

    if (sourceFormat == ImageFormat.heic) {
      throw Exception('HEIC is not supported on Web');
    }
    if (sourceFormat == ImageFormat.avif) {
      throw Exception('AVIF is not supported on Web');
    }
    if (targetFormat == ImageFormat.heic) {
      throw Exception('HEIC not supported on Web');
    }
    if (targetFormat == ImageFormat.avif) {
      throw Exception('AVIF not supported on Web');
    }

    var pngStage = await _decodeSourceToPng(
      inputBytes: inputBytes,
      sourceFormat: sourceFormat,
    );

    final shouldSkipPreShrinkForWeb = sourceFormat == ImageFormat.jpg &&
        targetFormat == ImageFormat.png;
    if (!shouldSkipPreShrinkForWeb) {
      pngStage = PreShrinkService.applyIfNeeded(
        pngBytes: pngStage,
        inputFileLengthBytes: inputBytes.length,
        inputFormat: sourceFormat,
        targetFormat: targetFormat,
      );
    }

    pngStage = NormalizeService.applyUnlessPdfSource(
      pngBytes: pngStage,
      sourceFileLengthBytes: inputBytes.length,
      sourceFormat: sourceFormat,
    );

    final Uint8List out = await _encodeTarget(
      workingPng: pngStage,
      targetFormat: targetFormat,
    );

    OutputBytesValidator.assertNonEmpty(out);
    await OutputRoundTripValidator.assertDecodesFromBytes(out, targetFormat);
    _assertOutputMatchesFormat(out, targetFormat);
    return out;
  }

  String _extensionFromFileName(String name) {
    final dot = name.lastIndexOf('.');
    if (dot < 0 || dot >= name.length - 1) return '';
    return name.substring(dot + 1);
  }

  Future<Uint8List> _decodeSourceToPng({
    required Uint8List inputBytes,
    required ImageFormat sourceFormat,
  }) async {
    try {
      switch (sourceFormat) {
        case ImageFormat.heic:
          throw Exception(AppStrings.failedToDecodeHeic);
        case ImageFormat.avif:
          throw Exception('AVIF is not supported on Web');
        case ImageFormat.pdf:
          return _decodePdfToPng(inputBytes);
        case ImageFormat.jpg:
        case ImageFormat.png:
        case ImageFormat.webp:
        case ImageFormat.gif:
        case ImageFormat.tiff:
        case ImageFormat.bmp:
          return workerRasterBytesToPng(inputBytes);
      }
    } on FormatException catch (e) {
      throw _mapWorkerError(e);
    }
  }

  Exception _mapWorkerError(FormatException e) {
    final code = e.message;
    if (code.contains('dimension') || code.contains('pdf_')) {
      return Exception(AppStrings.invalidImageDimensions);
    }
    if (code.contains('shrink') || code.contains('decode')) {
      return Exception(AppStrings.invalidOrCorruptImage);
    }
    return Exception(AppStrings.invalidOrCorruptImage);
  }

  Future<Uint8List> _decodePdfToPng(Uint8List pdfBytes) async {
    PdfDocument? doc;
    try {
      doc = await PdfDocument.openData(pdfBytes);
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

      final pageImage = await page.render(
        width: wi.toDouble(),
        height: hi.toDouble(),
        format: PdfPageImageFormat.png,
        quality: 100,
      );

      if (pageImage == null) {
        throw Exception(AppStrings.invalidOrCorruptImage);
      }

      try {
        return workerImportEncodedPng(pageImage.bytes);
      } on FormatException catch (e) {
        throw _mapWorkerError(e);
      }
    } on MissingPluginException {
      throw Exception(AppStrings.pdfRenderUnavailable);
    } on PlatformNotSupportedException {
      throw Exception(AppStrings.pdfRenderUnavailable);
    } finally {
      if (doc != null) {
        await doc.close();
      }
    }
  }

  Future<Uint8List> _encodeTarget({
    required Uint8List workingPng,
    required ImageFormat targetFormat,
  }) async {
    switch (targetFormat) {
      case ImageFormat.pdf:
        return _encodePdf(workingPng);
      case ImageFormat.heic:
        throw Exception('HEIC not supported on Web');
      case ImageFormat.avif:
        throw Exception('AVIF not supported on Web');
      case ImageFormat.webp:
        try {
          return encodeWebPFromPngBytes(workingPng);
        } catch (_) {
          throw Exception(AppStrings.conversionFailed);
        }
      case ImageFormat.jpg:
      case ImageFormat.png:
      case ImageFormat.gif:
      case ImageFormat.tiff:
      case ImageFormat.bmp:
        try {
          return workerEncodeBasic(workingPng, targetFormat.index);
        } on FormatException catch (e) {
          throw _mapWorkerError(e);
        } on StateError {
          throw Exception(AppStrings.conversionFailed);
        }
    }
  }

  Future<Uint8List> _encodePdf(Uint8List workingPng) async {
    final pdfPng = workerDownscalePngMaxSide(workingPng, 1920);
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
    return Uint8List.fromList(bytes);
  }
}

void _assertOutputMatchesFormat(Uint8List bytes, ImageFormat format) {
  if (bytes.isEmpty) {
    throw Exception('Empty output bytes');
  }

  switch (format) {
    case ImageFormat.png:
      if (!_looksLikePng(bytes)) {
        throw Exception('Expected PNG output, but bytes are not PNG');
      }
      break;
    case ImageFormat.jpg:
      if (!_looksLikeJpeg(bytes)) {
        throw Exception('Expected JPG output, but bytes are not JPG');
      }
      break;
    case ImageFormat.bmp:
      if (!_looksLikeBmp(bytes)) {
        throw Exception('Expected BMP output, but bytes are not BMP');
      }
      break;
    case ImageFormat.gif:
      if (!_looksLikeGif(bytes)) {
        throw Exception('Expected GIF output, but bytes are not GIF');
      }
      break;
    case ImageFormat.tiff:
      if (!_looksLikeTiff(bytes)) {
        throw Exception('Expected TIFF output, but bytes are not TIFF');
      }
      break;
    case ImageFormat.pdf:
      if (!_looksLikePdf(bytes)) {
        throw Exception('Expected PDF output, but bytes are not PDF');
      }
      break;
    case ImageFormat.webp:
      if (!_looksLikeWebp(bytes)) {
        throw Exception('Expected WebP output, but bytes are not WebP');
      }
      break;
    case ImageFormat.heic:
    case ImageFormat.avif:
      break;
  }
}

bool _looksLikePng(Uint8List b) =>
    b.length >= 8 &&
    b[0] == 0x89 &&
    b[1] == 0x50 &&
    b[2] == 0x4E &&
    b[3] == 0x47 &&
    b[4] == 0x0D &&
    b[5] == 0x0A &&
    b[6] == 0x1A &&
    b[7] == 0x0A;

bool _looksLikeJpeg(Uint8List b) =>
    b.length >= 3 &&
    b[0] == 0xFF &&
    b[1] == 0xD8 &&
    b[2] == 0xFF;

bool _looksLikeBmp(Uint8List b) =>
    b.length >= 2 &&
    b[0] == 0x42 &&
    b[1] == 0x4D;

bool _looksLikeGif(Uint8List b) =>
    b.length >= 6 &&
    b[0] == 0x47 &&
    b[1] == 0x49 &&
    b[2] == 0x46;

bool _looksLikeTiff(Uint8List b) =>
    b.length >= 4 &&
    ((b[0] == 0x49 && b[1] == 0x49 && b[2] == 0x2A && b[3] == 0x00) ||
        (b[0] == 0x4D && b[1] == 0x4D && b[2] == 0x00 && b[3] == 0x2A));

bool _looksLikePdf(Uint8List b) =>
    b.length >= 4 &&
    b[0] == 0x25 &&
    b[1] == 0x50 &&
    b[2] == 0x44 &&
    b[3] == 0x46;

bool _looksLikeWebp(Uint8List b) =>
    b.length >= 12 &&
    b[0] == 0x52 &&
    b[1] == 0x49 &&
    b[2] == 0x46 &&
    b[3] == 0x46 &&
    b[8] == 0x57 &&
    b[9] == 0x45 &&
    b[10] == 0x42 &&
    b[11] == 0x50;
