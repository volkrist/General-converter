import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'localization/locale_controller.dart';
import 'converter/services/android/image_converter_service.dart'
    as core_converter_service;
import 'converter/services/image_picker_service.dart'
    as core_picker_service;
import 'converter/services/android/image_save_service.dart' as core_save_service;
import 'converter/viewmodels/converter_view_model.dart' as core_vm;
import 'theme_view_model.dart';

/// Глобальный список провайдеров для всего приложения.
///
/// Здесь "сшиваем":
/// - ThemeViewModel — отвечает за светлую/тёмную тему
/// - ConverterViewModel — новый core‑слой конвертера (File‑based)
List<SingleChildWidget> get appProviders {
  // Инициализируем core‑сервисы один раз на всё приложение.
  final pickerService = core_picker_service.ImagePickerService();
  final converterService = core_converter_service.ImageConverterService();
  final saveService = core_save_service.ImageSaveService();

  return [
    ChangeNotifierProvider<LocaleController>(
      create: (_) => LocaleController()..load(),
    ),
    ChangeNotifierProvider<ThemeViewModel>(
      create: (_) => ThemeViewModel(),
    ),
    ChangeNotifierProvider<core_vm.ConverterViewModel>(
      create: (_) => core_vm.ConverterViewModel(
        pickerService,
        converterService,
        saveService,
      ),
    ),
  ];
}
