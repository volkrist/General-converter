// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Универсальный конвертер';

  @override
  String get pickImage => 'Выбрать файл';

  @override
  String get pickFromGallery => 'Галерея';

  @override
  String get pickFromFiles => 'Файлы';

  @override
  String get pickManyFiles => 'Пакет файлов';

  @override
  String get pickFolder => 'Папка';

  @override
  String get pickFileTitle => 'Источник';

  @override
  String get targetFormat => 'Целевой формат';

  @override
  String get convert => 'Конвертировать';

  @override
  String get convertBatch => 'Конвертировать пакет';

  @override
  String get converting => 'Конвертация…';

  @override
  String get cancel => 'Отмена';

  @override
  String get fileTooLarge => 'Файл слишком большой';

  @override
  String get largeFileWarning =>
      'Обнаружен крупный файл. Для стабильности размер изображения может быть уменьшен.';

  @override
  String get notEnoughMemory =>
      'Недостаточно памяти для обработки. Попробуйте меньшее изображение или закройте другие приложения.';

  @override
  String get memoryGuardTriggered =>
      'Файл слишком тяжёлый для безопасной конвертации на этом устройстве.';

  @override
  String get batchMemoryGuardTriggered =>
      'Слишком много тяжёлых файлов за раз. Разбейте пакет на части.';

  @override
  String get save => 'Сохранить';

  @override
  String get saving => 'Сохранение…';

  @override
  String get saved => 'Сохранено';

  @override
  String get share => 'Поделиться';

  @override
  String get rename => 'Переименовать';

  @override
  String get renameOutput => 'Имя результата';

  @override
  String get renameHint => 'Имя файла без расширения';

  @override
  String get apply => 'Применить';

  @override
  String get dismiss => 'Скрыть';

  @override
  String get emptyStateHint => 'Нажмите + и выберите галерею или файлы';

  @override
  String get conversionFailed => 'Ошибка конвертации';

  @override
  String get batchConversionFailed => 'Ошибка пакетной конвертации';

  @override
  String get saveFailed => 'Не удалось сохранить';

  @override
  String get pickFailed => 'Не удалось выбрать изображение';

  @override
  String get tapToPick => 'Нажмите, чтобы выбрать файл';

  @override
  String get invalidOrCorruptImage =>
      'Файл не является корректным изображением или повреждён.';

  @override
  String get invalidImageDimensions =>
      'Недопустимый размер изображения (пусто или нулевые размеры).';

  @override
  String get failedToDecodeHeic => 'Не удалось декодировать HEIC';

  @override
  String get failedToEncodeHeic => 'Не удалось закодировать HEIC';

  @override
  String get previewNotAvailable => 'Предпросмотр недоступен для этого формата';

  @override
  String get batchPreviewNoThumbnail => 'Нет миниатюры';

  @override
  String get batchPreviewWaiting => 'Миниатюра после конвертации';

  @override
  String get failedToEncodeAvif => 'Не удалось закодировать AVIF';

  @override
  String get formatPairNotSupported => 'Эта пара форматов не поддерживается';

  @override
  String get pdfRenderUnavailable =>
      'Не удалось отрисовать PDF на этом устройстве';

  @override
  String get savePdfFailed => 'Не удалось сохранить PDF';

  @override
  String get unsupportedInputFormat => 'Неподдерживаемый формат входа';

  @override
  String get open => 'Открыть';

  @override
  String get openFileFailed => 'Не удалось открыть файл в другом приложении';

  @override
  String get openFileUnavailableWeb =>
      'На веб-версии открытие в другом приложении недоступно';

  @override
  String get outputFileEmpty => 'Выходной файл пуст';

  @override
  String get outputEncodeRoundTripFailed =>
      'После сохранения файл не удалось прочитать';

  @override
  String get toggleTheme => 'Сменить тему';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Не удалось подготовить временные файлы. Выберите другой источник или освободите место.';

  @override
  String get conversionHintQuick => 'Обычно несколько секунд.';

  @override
  String get conversionHintHeavy =>
      'Крупный файл — конвертация может занять ~10–30 секунд.';

  @override
  String get conversionHintPdf =>
      'Экспорт в PDF может занять дольше (~10–30 секунд).';

  @override
  String get batchReady => 'Пакет готов';

  @override
  String get batchDone => 'Пакетная конвертация завершена';

  @override
  String get noBatchFiles => 'Не выбраны файлы для пакетной конвертации';

  @override
  String get progressFiles => 'файлов';

  @override
  String get batchModeTitle => 'Пакетная конвертация';

  @override
  String get batchModeSubtitle =>
      'Выберите целевой формат и конвертируйте все файлы. Одиночный режим в этом режиме скрыт.';

  @override
  String get batchSummaryTotal => 'Всего';

  @override
  String get batchSummaryDone => 'Готово';

  @override
  String get batchSummaryFailed => 'Ошибки';

  @override
  String get batchSummaryQueued => 'В очереди';

  @override
  String get saveAllSuccessful => 'Сохранить все успешные';

  @override
  String get batchSaveAllStarting => 'Сохранение файлов…';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Сохранение $current/$total';
  }

  @override
  String get retryFailed => 'Повторить ошибки';

  @override
  String get clearCompleted => 'Очистить завершённые';

  @override
  String get clearCompletedTooltip =>
      'Убрать из списка элементы, отмеченные как сохранённые';

  @override
  String get clearBatchQueue => 'Очистить очередь';

  @override
  String get batchStatusQueued => 'В очереди';

  @override
  String get batchStatusConverting => 'Конвертация';

  @override
  String get batchStatusDone => 'Готово';

  @override
  String get batchStatusFailed => 'Ошибка';

  @override
  String get batchStatusSaving => 'Сохранение';

  @override
  String get batchStatusSaved => 'Сохранено';

  @override
  String get batchStatusCancelled => 'Отменено';

  @override
  String get appNameWebSuffix => '(Веб)';

  @override
  String get download => 'Скачать';

  @override
  String get language => 'Язык';

  @override
  String get systemLanguage => 'Как в системе';

  @override
  String get errorDialogTitle => 'Ошибка';

  @override
  String get pickedFileCaption => 'Выбранный файл';

  @override
  String get keepScreenOn => 'Keep screen on';

  @override
  String get keepScreenOnTooltip =>
      'Prevent the device display from turning off while the app is active.';
}
