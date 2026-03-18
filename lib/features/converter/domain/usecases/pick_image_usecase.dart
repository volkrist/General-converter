import '../entities/image_asset.dart';
import '../repositories/converter_repository.dart';

class PickImageUseCase {
  const PickImageUseCase(this._repository);

  final ConverterRepository _repository;

  Future<ImageAsset?> call() => _repository.pickImage();
}
