import '../l10n/app_localizations_en.dart';

/// Сообщения для слоёв **без** [BuildContext] (сервисы, VM, маппер ошибок).
///
/// Всегда **английский**, чтобы [UserErrorMapper] и тесты сравнивали стабильный текст.
/// В интерфейсе используйте [AppLocalizations.of] / [AppL10nX].
abstract final class AppStrings {
  static final AppLocalizationsEn _en = AppLocalizationsEn();

  static String get appName => _en.appName;
  static String get pickImage => _en.pickImage;
  static String get pickFromGallery => _en.pickFromGallery;
  static String get pickFromFiles => _en.pickFromFiles;
  static String get pickManyFiles => _en.pickManyFiles;
  static String get pickFolder => _en.pickFolder;
  static String get pickFileTitle => _en.pickFileTitle;
  static String get targetFormat => _en.targetFormat;
  static String get convert => _en.convert;
  static String get convertBatch => _en.convertBatch;
  static String get converting => _en.converting;
  static String get cancel => _en.cancel;
  static String get fileTooLarge => _en.fileTooLarge;
  static String get largeFileWarning => _en.largeFileWarning;
  static String get notEnoughMemory => _en.notEnoughMemory;
  static String get memoryGuardTriggered => _en.memoryGuardTriggered;
  static String get batchMemoryGuardTriggered => _en.batchMemoryGuardTriggered;
  static String get save => _en.save;
  static String get saving => _en.saving;
  static String get saved => _en.saved;
  static String get share => _en.share;
  static String get rename => _en.rename;
  static String get renameOutput => _en.renameOutput;
  static String get renameHint => _en.renameHint;
  static String get apply => _en.apply;
  static String get dismiss => _en.dismiss;
  static String get emptyStateHint => _en.emptyStateHint;
  static String get conversionFailed => _en.conversionFailed;
  static String get batchConversionFailed => _en.batchConversionFailed;
  static String get saveFailed => _en.saveFailed;
  static String get pickFailed => _en.pickFailed;
  static String get tapToPick => _en.tapToPick;
  static String get invalidOrCorruptImage => _en.invalidOrCorruptImage;
  static String get invalidImageDimensions => _en.invalidImageDimensions;
  static String get failedToDecodeHeic => _en.failedToDecodeHeic;
  static String get heicDecodeFailed => _en.failedToDecodeHeic;
  static String get failedToEncodeHeic => _en.failedToEncodeHeic;
  static String get previewNotAvailable => _en.previewNotAvailable;
  static String get batchPreviewNoThumbnail => _en.batchPreviewNoThumbnail;
  static String get batchPreviewWaiting => _en.batchPreviewWaiting;
  static String get failedToEncodeAvif => _en.failedToEncodeAvif;
  static String get avifEncodeFailed => _en.failedToEncodeAvif;
  static String get formatPairNotSupported => _en.formatPairNotSupported;
  static String get pdfRenderUnavailable => _en.pdfRenderUnavailable;
  static String get savePdfFailed => _en.savePdfFailed;
  static String get unsupportedInputFormat => _en.unsupportedInputFormat;
  static String get open => _en.open;
  static String get openFileFailed => _en.openFileFailed;
  static String get openFileUnavailableWeb => _en.openFileUnavailableWeb;
  static String get outputFileEmpty => _en.outputFileEmpty;
  static String get outputEncodeRoundTripFailed =>
      _en.outputEncodeRoundTripFailed;
  static String get toggleTheme => _en.toggleTheme;
  static String get policyPreShrinkNoWritableDir =>
      _en.policyPreShrinkNoWritableDir;
  static String get conversionHintQuick => _en.conversionHintQuick;
  static String get conversionHintHeavy => _en.conversionHintHeavy;
  static String get conversionHintPdf => _en.conversionHintPdf;
  static String get batchReady => _en.batchReady;
  static String get batchDone => _en.batchDone;
  static String get noBatchFiles => _en.noBatchFiles;
  static String get progressFiles => _en.progressFiles;
  static String get batchModeTitle => _en.batchModeTitle;
  static String get batchModeSubtitle => _en.batchModeSubtitle;
  static String get batchSummaryTotal => _en.batchSummaryTotal;
  static String get batchSummaryDone => _en.batchSummaryDone;
  static String get batchSummaryFailed => _en.batchSummaryFailed;
  static String get batchSummaryQueued => _en.batchSummaryQueued;
  static String get saveAllSuccessful => _en.saveAllSuccessful;
  static String get batchSaveAllStarting => _en.batchSaveAllStarting;
  static String batchSaveAllProgressLabel(int current, int total) =>
      _en.batchSaveAllProgressLabel(current, total);
  static String get retryFailed => _en.retryFailed;
  static String get clearCompleted => _en.clearCompleted;
  static String get clearCompletedTooltip => _en.clearCompletedTooltip;
  static String get clearBatchQueue => _en.clearBatchQueue;
  static String get batchStatusQueued => _en.batchStatusQueued;
  static String get batchStatusConverting => _en.batchStatusConverting;
  static String get batchStatusDone => _en.batchStatusDone;
  static String get batchStatusFailed => _en.batchStatusFailed;
  static String get batchStatusSaving => _en.batchStatusSaving;
  static String get batchStatusSaved => _en.batchStatusSaved;
  static String get batchStatusCancelled => _en.batchStatusCancelled;
  static String get errorDialogTitle => _en.errorDialogTitle;
  static String get appNameWebSuffix => _en.appNameWebSuffix;
  static String get download => _en.download;
  static String get language => _en.language;
  static String get systemLanguage => _en.systemLanguage;
  static String get pickedFileCaption => _en.pickedFileCaption;
}
