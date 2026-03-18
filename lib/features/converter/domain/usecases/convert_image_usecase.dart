import '../entities/conversion_result.dart';
import '../entities/image_asset.dart';
import '../enums/image_format.dart';
import '../repositories/converter_repository.dart';

class ConvertImageUseCase {
  const ConvertImageUseCase(this._repository);

  final ConverterRepository _repository;

  Future<ConversionResult> call(ImageAsset source, ImageFormat target) =>
      _repository.convert(source, target);
}
