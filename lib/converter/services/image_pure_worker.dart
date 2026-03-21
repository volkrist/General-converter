import 'dart:math' as math;
import 'dart:typed_data';

import 'package:image/image.dart' as img;

import '../models/image_format.dart';
import 'simple_tiff_encoder.dart';

/// Макс. сторона растра на телефонах (OOM при больших значениях).
const int kWorkerMaxImageDimension = 3072;

/// Лимит мегапикселей после декода (HEIC 12MP+ × несколько копий = вылет).
const int kWorkerMaxPixels = 10 * 1000 * 1000;

/// Принудительный даунскейл при тяжёлом исходном файле (даже если «узкий» HEIC).
const int kWorkerAutoResizeFileThresholdBytes = 8 * 1024 * 1024;

/// Уже закодированный PNG (например из [ui.Image.toByteData] PNG).
/// Только [img.decodeImage], без цепочки [_decodeRaster] — иначе часть PNG
/// с Flutter-движка ошибочно трактуется и даёт «битый файл» при повторном входе AVIF.
Uint8List workerImportEncodedPng(Uint8List pngBytes) {
  final decoded =
      img.decodeImage(pngBytes) ?? img.decodePng(pngBytes);
  if (decoded == null) {
    throw FormatException('import_png');
  }
  if (decoded.width <= 0 || decoded.height <= 0) {
    throw FormatException('import_png_dim');
  }
  final oriented = img.bakeOrientation(decoded);
  if (oriented.width <= 0 || oriented.height <= 0) {
    throw FormatException('import_png_dim2');
  }
  final capped = capRasterForMemory(oriented);
  return Uint8List.fromList(img.encodePng(capped));
}

/// Только Dart + `package:image` — безопасно вызывать из [Isolate.run].
Uint8List workerRasterBytesToPng(Uint8List bytes) {
  final decoded = _decodeRaster(bytes);
  if (decoded == null) {
    throw FormatException('decode_raster');
  }
  if (decoded.width <= 0 || decoded.height <= 0) {
    throw FormatException('dimensions');
  }
  final oriented = img.bakeOrientation(decoded);
  if (oriented.width <= 0 || oriented.height <= 0) {
    throw FormatException('dimensions_oriented');
  }
  final capped = capRasterForMemory(oriented);
  return Uint8List.fromList(img.encodePng(capped));
}

/// Уменьшает PNG так, чтобы max(width,height) ≤ [maxSide] (для встраивания в PDF).
Uint8List workerDownscalePngMaxSide(Uint8List pngBytes, int maxSide) {
  final decoded = img.decodeImage(pngBytes);
  if (decoded == null) throw FormatException('shrink_decode');
  if (decoded.width <= maxSide && decoded.height <= maxSide) {
    return pngBytes;
  }
  var im = decoded;
  for (var i = 0; i < 6 && (im.width > maxSide || im.height > maxSide); i++) {
    final scale = maxSide / (im.width > im.height ? im.width : im.height);
    final nw = math.max(1, (im.width * scale).round());
    final nh = math.max(1, (im.height * scale).round());
    im = img.copyResize(
      im,
      width: nw,
      height: nh,
      interpolation: img.Interpolation.linear,
    );
  }
  return Uint8List.fromList(img.encodePng(im));
}

/// Нормализация рабочего PNG (даунскейл при больших пикселях / тяжёлом файле).
Uint8List workerNormalizeWorkingPng(
  Uint8List workingPngBytes,
  int sourceFileLengthBytes,
) {
  final decoded = img.decodeImage(workingPngBytes);
  if (decoded == null) throw FormatException('normalize_decode');
  if (decoded.width <= 0 || decoded.height <= 0) {
    throw FormatException('normalize_dimensions');
  }

  var im = capRasterForMemory(decoded);

  final hugePixels = im.width > kWorkerMaxImageDimension ||
      im.height > kWorkerMaxImageDimension;
  final heavyFile =
      sourceFileLengthBytes >= kWorkerAutoResizeFileThresholdBytes;

  if (!hugePixels && !heavyFile) {
    return Uint8List.fromList(img.encodePng(im));
  }

  final resized = _resizeIfNeeded(im);
  if (resized.width <= 0 || resized.height <= 0) {
    throw FormatException('resize_dimensions');
  }
  final out = capRasterForMemory(resized);
  return Uint8List.fromList(img.encodePng(out));
}

img.Image capRasterForMemory(img.Image source) {
  var im = source;
  for (var guard = 0; guard < 10; guard++) {
    final w = im.width;
    final h = im.height;
    final pixels = w * h;
    final sideTooLarge =
        w > kWorkerMaxImageDimension || h > kWorkerMaxImageDimension;
    final pxTooLarge = pixels > kWorkerMaxPixels;
    if (!sideTooLarge && !pxTooLarge) {
      return im;
    }

    var scale = 1.0;
    if (sideTooLarge) {
      final s = kWorkerMaxImageDimension / (w > h ? w : h);
      scale = math.min(scale, s);
    }
    if (pxTooLarge) {
      final s = math.sqrt(kWorkerMaxPixels / pixels) * 0.97;
      scale = math.min(scale, s);
    }
    if (scale >= 0.999) {
      im = _resizeIfNeeded(im);
      continue;
    }
    final nw = math.max(1, (w * scale).round());
    final nh = math.max(1, (h * scale).round());
    im = img.copyResize(
      im,
      width: nw,
      height: nh,
      interpolation: img.Interpolation.linear,
    );
  }
  return im;
}

/// Кодирует рабочий PNG в целевой растровый формат (без HEIC/WebP/AVIF/PDF).
Uint8List workerEncodeBasic(Uint8List workingPngBytes, int formatIndex) {
  final targetFormat = ImageFormat.values[formatIndex];
  final decoded = img.decodeImage(workingPngBytes);
  if (decoded == null) throw FormatException('encode_decode');
  if (decoded.width <= 0 || decoded.height <= 0) {
    throw FormatException('encode_dimensions');
  }

  final im = capRasterForMemory(decoded);

  switch (targetFormat) {
    case ImageFormat.jpg:
      return Uint8List.fromList(img.encodeJpg(im, quality: 92));
    case ImageFormat.png:
      return Uint8List.fromList(img.encodePng(im));
    case ImageFormat.gif:
      return Uint8List.fromList(img.encodeGif(im));
    case ImageFormat.tiff:
      return _encodeTiffRgbBaseline(im);
    case ImageFormat.bmp:
      return Uint8List.fromList(img.encodeBmp(im));
    case ImageFormat.heic:
    case ImageFormat.avif:
    case ImageFormat.webp:
    case ImageFormat.pdf:
      throw StateError('workerEncodeBasic: $targetFormat not supported');
  }
}

/// RGBA пиксели страницы PDF → PNG (после [pdf_render] на главном изоляте).
Uint8List workerPdfRgbaToPng(
  Uint8List rgbaBytes,
  int width,
  int height,
) {
  final raster = img.Image.fromBytes(
    width: width,
    height: height,
    bytes: rgbaBytes.buffer,
    bytesOffset: rgbaBytes.offsetInBytes,
    numChannels: 4,
    order: img.ChannelOrder.rgba,
  );
  if (raster.width <= 0 || raster.height <= 0) {
    throw FormatException('pdf_dimensions');
  }
  final capped = capRasterForMemory(raster);
  return Uint8List.fromList(img.encodePng(capped));
}

/// [package:image] `encodeTiff` даёт на части устройств **0 байт** или битый IFD;
/// baseline RGB без сжатия читается везде.
Uint8List _encodeTiffRgbBaseline(img.Image source) {
  var im = source;
  if (im.isHdrFormat) {
    im = im.convert(format: img.Format.uint8);
  }
  final w = im.width;
  final h = im.height;
  final rgb = Uint8List(w * h * 3);
  var j = 0;
  for (var y = 0; y < h; y++) {
    for (var x = 0; x < w; x++) {
      final p = im.getPixel(x, y);
      rgb[j++] = p.r.toInt().clamp(0, 255);
      rgb[j++] = p.g.toInt().clamp(0, 255);
      rgb[j++] = p.b.toInt().clamp(0, 255);
    }
  }
  return encodeRgbTiffUncompressed(
    width: w,
    height: h,
    rgbInterleaved: rgb,
  );
}

img.Image? _decodeRaster(Uint8List bytes) {
  return img.decodeImage(bytes) ??
      img.decodeJpg(bytes) ??
      img.decodePng(bytes) ??
      img.decodeWebP(bytes) ??
      img.decodeGif(bytes) ??
      img.decodeTiff(bytes) ??
      img.decodeBmp(bytes);
}

img.Image _resizeIfNeeded(img.Image source) {
  if (source.width <= kWorkerMaxImageDimension &&
      source.height <= kWorkerMaxImageDimension) {
    return source;
  }

  if (source.width >= source.height) {
    final newWidth = kWorkerMaxImageDimension;
    final newHeight = (source.height * kWorkerMaxImageDimension / source.width)
        .round()
        .clamp(1, 1 << 20);
    return img.copyResize(
      source,
      width: newWidth,
      height: newHeight,
      interpolation: img.Interpolation.linear,
    );
  }

  final newHeight = kWorkerMaxImageDimension;
  final newWidth = (source.width * kWorkerMaxImageDimension / source.height)
      .round()
      .clamp(1, 1 << 20);
  return img.copyResize(
    source,
    width: newWidth,
    height: newHeight,
    interpolation: img.Interpolation.linear,
  );
}
