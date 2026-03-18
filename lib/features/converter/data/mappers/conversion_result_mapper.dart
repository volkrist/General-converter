import '../../domain/entities/conversion_result.dart';
import '../../domain/enums/image_format.dart';

class ConversionResultMapper {
  static ConversionResult fromRaw({
    required String outputPath,
    required String formatExtension,
    required int sizeBytes,
  }) {
    final format = ImageFormat.fromExtension(formatExtension);
    return ConversionResult(
      outputPath: outputPath,
      format: format ?? ImageFormat.png,
      sizeBytes: sizeBytes,
    );
  }
}
