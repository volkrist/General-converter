import 'image_format.dart';

class ImageAsset {
  const ImageAsset({
    required this.name,
    required this.path,
    required this.sizeBytes,
    this.format,
  });

  final String name;
  final String path;
  final int sizeBytes;
  final ImageFormat? format;

  String get sizeLabel {
    if (sizeBytes < 1024) return '$sizeBytes B';
    if (sizeBytes < 1024 * 1024) {
      return '${(sizeBytes / 1024).toStringAsFixed(1)} KB';
    }
    return '${(sizeBytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}
