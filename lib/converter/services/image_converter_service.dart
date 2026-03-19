import 'dart:io';

import 'package:image/image.dart' as img;

import '../../models/image_format.dart';

class ImageConverterService {
  Future<File> convert({
    required File inputFile,
    required ImageFormat targetFormat,
  }) async {
    final bytes = await inputFile.readAsBytes();

    final image = img.decodeImage(bytes);
    if (image == null) {
      throw Exception('Failed to decode image');
    }

    late List<int> convertedBytes;

    switch (targetFormat) {
      case ImageFormat.jpg:
        convertedBytes = img.encodeJpg(image, quality: 90);
        break;

      case ImageFormat.png:
        convertedBytes = img.encodePng(image);
        break;

      case ImageFormat.bmp:
        convertedBytes = img.encodeBmp(image);
        break;

      case ImageFormat.tiff:
        convertedBytes = img.encodeTiff(image);
        break;

      case ImageFormat.gif:
        convertedBytes = img.encodeGif(image);
        break;

      case ImageFormat.webp:
      case ImageFormat.heic:
      case ImageFormat.avif:
        throw Exception('Format not supported yet');
    }

    final newPath = _buildOutputPath(inputFile.path, targetFormat);

    final outputFile = File(newPath);
    try {
      await outputFile.writeAsBytes(convertedBytes);
    } catch (e) {
      throw Exception('Failed to save file');
    }

    return outputFile;
  }

  String _buildOutputPath(String originalPath, ImageFormat format) {
    final dotIndex = originalPath.lastIndexOf('.');
    final base =
        dotIndex != -1 ? originalPath.substring(0, dotIndex) : originalPath;

    return '${base}_${DateTime.now().millisecondsSinceEpoch}.${format.name}';
  }
}

