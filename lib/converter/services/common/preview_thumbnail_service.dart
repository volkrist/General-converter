import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as p;

/// Decoded превью с тяжёлой работой в [Isolate], чтобы не лочить UI.
class PreviewThumbnailService {
  static Future<File?> createPreviewForFile({
    required File sourceFile,
    required Directory tempDir,
    int maxSide = 320,
  }) async {
    try {
      final bytes = await sourceFile.readAsBytes();
      final jpgBytes = await _runResizeToJpg(bytes, maxSide);
      if (jpgBytes == null) return null;

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

  static Future<Uint8List?> _runResizeToJpg(Uint8List bytes, int maxSide) {
    if (kIsWeb) {
      return Future.value(_resizeToJpgSync(bytes, maxSide));
    }
    return Isolate.run(() => _resizeToJpgSync(bytes, maxSide));
  }
}

Uint8List? _resizeToJpgSync(Uint8List bytes, int maxSide) {
  final decoded = img.decodeImage(bytes);
  if (decoded == null || decoded.width <= 0 || decoded.height <= 0) {
    return null;
  }
  final resized = _resize(decoded, maxSide: maxSide);
  return Uint8List.fromList(img.encodeJpg(resized, quality: 82));
}

img.Image _resize(img.Image image, {required int maxSide}) {
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
