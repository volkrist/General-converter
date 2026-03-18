import '../entities/conversion_result.dart';
import '../entities/image_asset.dart';
import '../enums/image_format.dart';

abstract class ConverterRepository {
  Future<ImageAsset?> pickImage();
  Future<ConversionResult> convert(ImageAsset source, ImageFormat target);
  Future<String> saveToGallery(ConversionResult result);
}
