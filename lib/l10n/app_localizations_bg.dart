// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get appName => 'Универсален конвертор';

  @override
  String get pickImage => 'Избери файл';

  @override
  String get pickFromGallery => 'Галерия';

  @override
  String get pickFromFiles => 'Файлове';

  @override
  String get pickManyFiles => 'Пакетни файлове';

  @override
  String get pickFolder => 'Папка';

  @override
  String get pickFileTitle => 'Изберете източник';

  @override
  String get targetFormat => 'Целеви формат';

  @override
  String get convert => 'Конвертиране';

  @override
  String get convertBatch => 'Конвертиране на пакет';

  @override
  String get converting => 'Конвертиране...';

  @override
  String get cancel => 'Отказ';

  @override
  String get fileTooLarge => 'Файлът е твърде голям';

  @override
  String get largeFileWarning =>
      'Открит е голям файл. Конвертирането може да намали размера за стабилност.';

  @override
  String get notEnoughMemory =>
      'Недостатъчно памет за обработка на този файл. Опитайте с по-малка снимка или затворете други приложения.';

  @override
  String get memoryGuardTriggered =>
      'Файлът е твърде тежък за безопасно конвертиране на това устройство.';

  @override
  String get batchMemoryGuardTriggered =>
      'Избрани са твърде много тежки файлове наведнъж. Разделете пакета на по-малки части.';

  @override
  String get save => 'Запази';

  @override
  String get saving => 'Запазване...';

  @override
  String get saved => 'Запазено';

  @override
  String get share => 'Споделяне';

  @override
  String get rename => 'Преименуване';

  @override
  String get renameOutput => 'Преименуване на изхода';

  @override
  String get renameHint => 'Име на файла без разширение';

  @override
  String get apply => 'Приложи';

  @override
  String get dismiss => 'Затвори';

  @override
  String get emptyStateHint =>
      'Докоснете + за избор от галерията или файловете';

  @override
  String get conversionFailed => 'Конвертирането не успя';

  @override
  String get batchConversionFailed => 'Пакетното конвертиране не успя';

  @override
  String get saveFailed => 'Неуспешно запазване';

  @override
  String get pickFailed => 'Неуспешен избор на изображение';

  @override
  String get tapToPick => 'Докоснете, за да изберете файл';

  @override
  String get invalidOrCorruptImage =>
      'Файлът не е валидно изображение или изглежда повреден.';

  @override
  String get invalidImageDimensions =>
      'Изображението има невалидни размери (празно или нулеви размери).';

  @override
  String get failedToDecodeHeic => 'Грешка при декодиране на HEIC';

  @override
  String get failedToEncodeHeic => 'Грешка при кодиране на HEIC';

  @override
  String get previewNotAvailable => 'Прегледът не е наличен за този формат';

  @override
  String get batchPreviewNoThumbnail => 'Няма миниатюра';

  @override
  String get batchPreviewWaiting => 'Миниатюра след конвертиране';

  @override
  String get failedToEncodeAvif => 'Грешка при кодиране на AVIF';

  @override
  String get formatPairNotSupported =>
      'Тази комбинация от формати не се поддържа';

  @override
  String get pdfRenderUnavailable =>
      'PDF не може да бъде визуализиран на това устройство';

  @override
  String get savePdfFailed => 'Неуспешно запазване на PDF';

  @override
  String get unsupportedInputFormat => 'Неподдържан входен формат';

  @override
  String get open => 'Отвори';

  @override
  String get openFileFailed => 'Не можа да се отвори файл с друго приложение';

  @override
  String get openFileUnavailableWeb =>
      'Отварянето на файлове в друго приложение не е налично в уеб';

  @override
  String get outputFileEmpty => 'Изходният файл е празен';

  @override
  String get outputEncodeRoundTripFailed =>
      'Изходният файл не беше четим след запис';

  @override
  String get toggleTheme => 'Смяна на тема';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Не може да се подготви временна работна папка за този файл. Опитайте друг източник или освободете място.';

  @override
  String get conversionHintQuick =>
      'Обикновено завършва в рамките на няколко секунди.';

  @override
  String get conversionHintHeavy =>
      'Голям файл — конвертирането може да отнеме около 10–30 секунди.';

  @override
  String get conversionHintPdf =>
      'Експортирането в PDF може да отнеме повече (около 10–30 секунди).';

  @override
  String get batchReady => 'Опашката за пакет е готова';

  @override
  String get batchDone => 'Пакетното конвертиране е завършено';

  @override
  String get noBatchFiles => 'Не са избрани файлове за пакетно конвертиране';

  @override
  String get progressFiles => 'файла';

  @override
  String get batchModeTitle => 'Пакетно конвертиране';

  @override
  String get batchModeSubtitle =>
      'Изберете целевия формат, след което конвертирайте всички файлове. Изгледът за единичен файл се скрива в този режим.';

  @override
  String get batchSummaryTotal => 'Общо';

  @override
  String get batchSummaryDone => 'Завършено';

  @override
  String get batchSummaryFailed => 'Неуспешно';

  @override
  String get batchSummaryQueued => 'В опашката';

  @override
  String get saveAllSuccessful => 'Всички файлове са запазени успешно';

  @override
  String get batchSaveAllStarting => 'Запазване на файловете...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Запазване $current/$total';
  }

  @override
  String get retryFailed => 'Опитай отново';

  @override
  String get clearCompleted => 'Изчисти завършените';

  @override
  String get clearCompletedTooltip =>
      'Премахване на елементи маркирани като запазени от този списък';

  @override
  String get clearBatchQueue => 'Изчисти опашката';

  @override
  String get batchStatusQueued => 'В опашката';

  @override
  String get batchStatusConverting => 'Конвертиране';

  @override
  String get batchStatusDone => 'Готово';

  @override
  String get batchStatusFailed => 'Неуспешно';

  @override
  String get batchStatusSaving => 'Запазване';

  @override
  String get batchStatusSaved => 'Запазено';

  @override
  String get batchStatusCancelled => 'Отменено';

  @override
  String get appNameWebSuffix => '(Уеб)';

  @override
  String get download => 'Изтегляне';

  @override
  String get language => 'Език';

  @override
  String get systemLanguage => 'Системен по подразбиране';

  @override
  String get errorDialogTitle => 'Грешка';

  @override
  String get pickedFileCaption => 'Избран файл';

  @override
  String get keepScreenOn => 'Не изключвай екрана';

  @override
  String get keepScreenOnTooltip =>
      'Предотвратява изключването на дисплея на устройството, докато приложението е активно.';
}
