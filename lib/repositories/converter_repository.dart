import '../models/conversion_result.dart';
import '../models/image_asset.dart';
import '../models/image_format.dart';

abstract class ConverterRepository {
  Future<ImageAsset?> pickImage();
  Future<ConversionResult> convert(ImageAsset source, ImageFormat target);
  Future<String> saveToGallery(ConversionResult result);
}
