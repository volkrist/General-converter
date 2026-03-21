import 'dart:io';

import 'package:image/image.dart' as img;

import 'package:general_converter/converter/models/image_format.dart';

/// Синтетические растровые файлы только через пакет `image` (без нативных плагинов).
Future<File> writeSyntheticRaster({
  required Directory dir,
  required ImageFormat format,
  String basename = 'sample',
}) async {
  final image = img.Image(width: 4, height: 4);
  img.fill(image, color: img.ColorRgb8(210, 120, 55));

  late List<int> bytes;
  switch (format) {
    case ImageFormat.jpg:
      bytes = img.encodeJpg(image, quality: 92);
      break;
    case ImageFormat.png:
      bytes = img.encodePng(image);
      break;
    case ImageFormat.gif:
      bytes = img.encodeGif(image);
      break;
    case ImageFormat.bmp:
      bytes = img.encodeBmp(image);
      break;
    case ImageFormat.tiff:
      bytes = img.encodeTiff(image);
      break;
    case ImageFormat.webp:
    case ImageFormat.heic:
    case ImageFormat.avif:
    case ImageFormat.pdf:
      throw UnsupportedError(
        'Synthetic $format needs a fixture or native encoder — not in image package',
      );
  }

  final path =
      '${dir.path}${Platform.pathSeparator}$basename.${format.extension}';
  final file = File(path);
  await file.writeAsBytes(bytes);
  return file;
}

/// Форматы, для которых можно сгенерировать входной файл без нативных кодеков.
const syntheticRasterFormats = <ImageFormat>[
  ImageFormat.jpg,
  ImageFormat.png,
  ImageFormat.gif,
  ImageFormat.bmp,
  ImageFormat.tiff,
];
