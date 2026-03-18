import '../enums/image_format.dart';

class ConversionResult {
  const ConversionResult({
    required this.outputPath,
    required this.format,
    required this.sizeBytes,
  });

  final String outputPath;
  final ImageFormat format;
  final int sizeBytes;
}
