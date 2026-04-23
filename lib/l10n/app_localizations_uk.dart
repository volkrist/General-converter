// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appName => 'Загальний конвертер';

  @override
  String get pickImage => 'Вибрати файл';

  @override
  String get pickFromGallery => 'Галерея';

  @override
  String get pickFromFiles => 'Файли';

  @override
  String get pickManyFiles => 'Пакет файлів';

  @override
  String get pickFolder => 'Папка';

  @override
  String get pickFileTitle => 'Виберіть джерело';

  @override
  String get targetFormat => 'Цільовий формат';

  @override
  String get convert => 'Конвертувати';

  @override
  String get convertBatch => 'Пакетна конвертація';

  @override
  String get converting => 'Конвертування...';

  @override
  String get cancel => 'Скасувати';

  @override
  String get fileTooLarge => 'Файл занадто великий';

  @override
  String get largeFileWarning =>
      'Виявлено великий файл. Конвертація може зменшити розмір зображення для стабільності.';

  @override
  String get notEnoughMemory =>
      'Не вистачає пам\'яті для обробки цього файлу. Спробуйте менше зображення або закрийте інші додатки.';

  @override
  String get memoryGuardTriggered =>
      'Файл занадто важкий для безпечної конвертації на цьому пристрої.';

  @override
  String get batchMemoryGuardTriggered =>
      'Одночасно вибрано занадто багато важких файлів. Розділіть пакет.';

  @override
  String get save => 'Зберегти';

  @override
  String get saving => 'Збереження...';

  @override
  String get saved => 'Збережено';

  @override
  String get share => 'Поділитися';

  @override
  String get rename => 'Перейменувати';

  @override
  String get renameOutput => 'Перейменувати вивід';

  @override
  String get renameHint => 'Ім\'я файлу без розширення';

  @override
  String get apply => 'Застосувати';

  @override
  String get dismiss => 'Закрити';

  @override
  String get emptyStateHint => 'Торкніться +, щоб вибрати з галереї або файлів';

  @override
  String get conversionFailed => 'Конвертація не вдалася';

  @override
  String get batchConversionFailed => 'Пакетна конвертація не вдалася';

  @override
  String get saveFailed => 'Не вдалося зберегти';

  @override
  String get pickFailed => 'Не вдалося вибрати';

  @override
  String get tapToPick => 'Торкніться, щоб вибрати файл';

  @override
  String get invalidOrCorruptImage =>
      'Файл не є дійсним зображенням або, здається, пошкоджений.';

  @override
  String get invalidImageDimensions =>
      'Зображення має недійсні розміри (порожнє або нульове).';

  @override
  String get failedToDecodeHeic => 'Не вдалося декодувати HEIC';

  @override
  String get failedToEncodeHeic => 'Не вдалося кодувати HEIC';

  @override
  String get previewNotAvailable =>
      'Попередній перегляд недоступний для цього формату';

  @override
  String get batchPreviewNoThumbnail => 'Немає мініатюри';

  @override
  String get batchPreviewWaiting => 'Мініатюра після конвертації';

  @override
  String get failedToEncodeAvif => 'Не вдалося кодувати AVIF';

  @override
  String get formatPairNotSupported => 'Ця пара форматів не підтримується';

  @override
  String get pdfRenderUnavailable =>
      'PDF не можна відобразити на цьому пристрої';

  @override
  String get savePdfFailed => 'Не вдалося зберегти PDF';

  @override
  String get unsupportedInputFormat => 'Непідтримуваний вхідний формат';

  @override
  String get open => 'Відкрити';

  @override
  String get openFileFailed => 'Не вдалося відкрити файл іншим додатком';

  @override
  String get openFileUnavailableWeb =>
      'Відкриття файлів в іншому додатку недоступне в інтернеті';

  @override
  String get outputFileEmpty => 'Файл виводу порожній';

  @override
  String get outputEncodeRoundTripFailed =>
      'Файл виводу було неможливо прочитати після збереження';

  @override
  String get toggleTheme => 'Змінити тему';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Не вдалося підготувати тимчасовий робочий простір для цього файлу. Спробуйте інше джерело або звільніть місце.';

  @override
  String get conversionHintQuick => 'Зазвичай завершується за кілька секунд.';

  @override
  String get conversionHintHeavy =>
      'Великий файл — конвертація може зайняти ~10–30 секунд.';

  @override
  String get conversionHintPdf =>
      'Експорт PDF може зайняти більше часу (~10–30 секунд).';

  @override
  String get batchReady => 'Черга пакета готова';

  @override
  String get batchDone => 'Пакетна конвертація завершена';

  @override
  String get noBatchFiles => 'Файли для пакетної конвертації не вибрані';

  @override
  String get progressFiles => 'файли';

  @override
  String get batchModeTitle => 'Пакетна конвертація';

  @override
  String get batchModeSubtitle =>
      'Виберіть цільовий формат, потім конвертуйте всі файли. Перегляд одиночного файлу приховано в цьому режимі.';

  @override
  String get batchSummaryTotal => 'Всього';

  @override
  String get batchSummaryDone => 'Готово';

  @override
  String get batchSummaryFailed => 'Не вдалося';

  @override
  String get batchSummaryQueued => 'В черзі';

  @override
  String get saveAllSuccessful => 'Усі збережені успішно';

  @override
  String get batchSaveAllStarting => 'Збереження файлів...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Збереження $current/$total';
  }

  @override
  String get retryFailed => 'Спробуйте ще раз';

  @override
  String get clearCompleted => 'Очистити завершені';

  @override
  String get clearCompletedTooltip =>
      'Видаліть елементи, позначені як збережені, з цього списку';

  @override
  String get clearBatchQueue => 'Очистити чергу';

  @override
  String get batchStatusQueued => 'В черзі';

  @override
  String get batchStatusConverting => 'Конвертується';

  @override
  String get batchStatusDone => 'Готово';

  @override
  String get batchStatusFailed => 'Не вдалося';

  @override
  String get batchStatusSaving => 'Збереження';

  @override
  String get batchStatusSaved => 'Збережено';

  @override
  String get batchStatusCancelled => 'Скасовано';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'Завантажити';

  @override
  String get language => 'Мова';

  @override
  String get systemLanguage => 'Системний за замовчуванням';

  @override
  String get errorDialogTitle => 'Помилка';

  @override
  String get pickedFileCaption => 'Вибраний файл';

  @override
  String get keepScreenOn => 'Тримати екран увімкненим';

  @override
  String get keepScreenOnTooltip =>
      'Запобігайте вимкненню дисплея пристрою, поки додаток активний.';
}
