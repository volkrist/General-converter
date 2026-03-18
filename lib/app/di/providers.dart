import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/converter/data/repositories/converter_repository_impl.dart';
import '../../features/converter/data/services/image_converter_service.dart';
import '../../features/converter/data/services/image_picker_service.dart';
import '../../features/converter/data/services/image_save_service.dart';
import '../../features/converter/domain/usecases/convert_image_usecase.dart';
import '../../features/converter/domain/usecases/pick_image_usecase.dart';
import '../../features/converter/domain/usecases/save_result_usecase.dart';
import '../../features/converter/presentation/viewmodels/converter_view_model.dart';
import '../theme/theme_view_model.dart';

List<SingleChildWidget> get appProviders {
  final pickerService = ImagePickerService();
  final converterService = ImageConverterService();
  final saveService = ImageSaveService();

  final repository = ConverterRepositoryImpl(
    pickerService: pickerService,
    converterService: converterService,
    saveService: saveService,
  );

  final pickImageUseCase = PickImageUseCase(repository);
  final convertImageUseCase = ConvertImageUseCase(repository);
  final saveResultUseCase = SaveResultUseCase(repository);

  return [
    ChangeNotifierProvider<ThemeViewModel>(
      create: (_) => ThemeViewModel(),
    ),
    ChangeNotifierProvider<ConverterViewModel>(
      create: (_) => ConverterViewModel(
        pickImageUseCase: pickImageUseCase,
        convertImageUseCase: convertImageUseCase,
        saveResultUseCase: saveResultUseCase,
      ),
    ),
  ];
}
