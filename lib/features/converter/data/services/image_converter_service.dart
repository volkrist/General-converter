import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

import '../../domain/entities/conversion_result.dart';
import '../../domain/entities/image_asset.dart';
import '../../domain/enums/image_format.dart';

class ImageConverterService {
  Future<ConversionResult> convert(
    ImageAsset source,
    ImageFormat target,
  ) async {
    final sourceBytes = await File(source.path).readAsBytes();
    final decoded = img.decodeImage(sourceBytes);
    if (decoded == null) {
      throw FormatException('Cannot decode image: ${source.name}');
    }

    final encoded = _encode(decoded, target);

    final tempDir = await getTemporaryDirectory();
    final baseName = source.name.split('.').first;
    final outputPath = '${tempDir.path}/${baseName}_converted.${target.extension}';

    await File(outputPath).writeAsBytes(encoded);

    return ConversionResult(
      outputPath: outputPath,
      format: target,
      sizeBytes: encoded.length,
    );
  }

  Uint8List _encode(img.Image image, ImageFormat format) {
    return switch (format) {
      ImageFormat.jpg => Uint8List.fromList(img.encodeJpg(image)),
      ImageFormat.png => Uint8List.fromList(img.encodePng(image)),
      ImageFormat.webp => Uint8List.fromList(img.encodePng(image)),
      ImageFormat.gif => Uint8List.fromList(img.encodeGif(image)),
      ImageFormat.tiff => Uint8List.fromList(img.encodeTiff(image)),
      ImageFormat.bmp => Uint8List.fromList(img.encodeBmp(image)),
      ImageFormat.heic => Uint8List.fromList(img.encodePng(image)),
      ImageFormat.avif => Uint8List.fromList(img.encodePng(image)),
    };
  }
}
