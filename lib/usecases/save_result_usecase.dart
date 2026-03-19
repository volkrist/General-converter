import '../models/conversion_result.dart';
import '../repositories/converter_repository.dart';

class SaveResultUseCase {
  const SaveResultUseCase(this._repository);

  final ConverterRepository _repository;

  Future<String> call(ConversionResult result) =>
      _repository.saveToGallery(result);
}
