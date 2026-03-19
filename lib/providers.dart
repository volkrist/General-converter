import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'repositories/converter_repository_impl.dart';
import 'services/image_converter_service.dart';
import 'services/image_picker_service.dart';
import 'services/image_save_service.dart';
import 'usecases/convert_image_usecase.dart';
import 'usecases/pick_image_usecase.dart';
import 'usecases/save_result_usecase.dart';
import 'viewmodels/converter_view_model.dart';
import 'theme_view_model.dart';

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
