import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart' as img;
import 'package:path/path.dart' as p;

class PreviewThumbnailService {
  static Future<File?> createPreviewForFile({
    required File sourceFile,
    required Directory tempDir,
    int maxSide = 320,
  }) async {
    try {
      final bytes = await sourceFile.readAsBytes();
      final decoded = img.decodeImage(bytes);
      if (decoded == null) return null;

      final resized = _resize(decoded, maxSide: maxSide);
      final jpgBytes = Uint8List.fromList(
        img.encodeJpg(resized, quality: 82),
      );

      final unique = sourceFile.path.hashCode.abs();
      final outPath = p.join(
        tempDir.path,
        '${p.basenameWithoutExtension(sourceFile.path)}_${unique}_preview.jpg',
      );

      final outFile = File(outPath);
      await outFile.writeAsBytes(jpgBytes, flush: true);
      return outFile;
    } catch (_) {
      return null;
    }
  }

  static img.Image _resize(img.Image image, {required int maxSide}) {
    final width = image.width;
    final height = image.height;

    if (width <= maxSide && height <= maxSide) {
      return image;
    }

    if (width >= height) {
      return img.copyResize(image, width: maxSide);
    }
    return img.copyResize(image, height: maxSide);
  }
}
