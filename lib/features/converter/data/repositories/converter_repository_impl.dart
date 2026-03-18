import '../../domain/entities/conversion_result.dart';
import '../../domain/entities/image_asset.dart';
import '../../domain/enums/image_format.dart';
import '../../domain/repositories/converter_repository.dart';
import '../services/image_converter_service.dart';
import '../services/image_picker_service.dart';
import '../services/image_save_service.dart';

class ConverterRepositoryImpl implements ConverterRepository {
  ConverterRepositoryImpl({
    required this.pickerService,
    required this.converterService,
    required this.saveService,
  });

  final ImagePickerService pickerService;
  final ImageConverterService converterService;
  final ImageSaveService saveService;

  @override
  Future<ImageAsset?> pickImage() => pickerService.pickImage();

  @override
  Future<ConversionResult> convert(ImageAsset source, ImageFormat target) =>
      converterService.convert(source, target);

  @override
  Future<String> saveToGallery(ConversionResult result) =>
      saveService.saveToGallery(result);
}
