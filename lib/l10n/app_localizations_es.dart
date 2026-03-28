// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'General Converter';

  @override
  String get pickImage => 'Pick file';

  @override
  String get pickFromGallery => 'Gallery';

  @override
  String get pickFromFiles => 'Files';

  @override
  String get pickManyFiles => 'Batch files';

  @override
  String get pickFolder => 'Folder';

  @override
  String get pickFileTitle => 'Choose source';

  @override
  String get targetFormat => 'Target format';

  @override
  String get convert => 'Convert';

  @override
  String get convertBatch => 'Convert batch';

  @override
  String get converting => 'Converting...';

  @override
  String get cancel => 'Cancel';

  @override
  String get fileTooLarge => 'File is too large';

  @override
  String get largeFileWarning =>
      'Large file detected. Conversion may reduce image size for stability.';

  @override
  String get notEnoughMemory =>
      'Not enough memory to process this file. Try a smaller image or close other apps.';

  @override
  String get memoryGuardTriggered =>
      'File is too heavy for safe conversion on this device.';

  @override
  String get batchMemoryGuardTriggered =>
      'Too many heavy files selected at once. Split the batch into smaller parts.';

  @override
  String get save => 'Save';

  @override
  String get saving => 'Saving...';

  @override
  String get saved => 'Saved';

  @override
  String get share => 'Share';

  @override
  String get rename => 'Rename';

  @override
  String get renameOutput => 'Rename output';

  @override
  String get renameHint => 'File name without extension';

  @override
  String get apply => 'Apply';

  @override
  String get dismiss => 'Dismiss';

  @override
  String get emptyStateHint => 'Tap + to pick from gallery or files';

  @override
  String get conversionFailed => 'Conversion failed';

  @override
  String get batchConversionFailed => 'Batch conversion failed';

  @override
  String get saveFailed => 'Failed to save';

  @override
  String get pickFailed => 'Failed to pick image';

  @override
  String get tapToPick => 'Tap to pick a file';

  @override
  String get invalidOrCorruptImage =>
      'The file is not a valid image or appears to be damaged.';

  @override
  String get invalidImageDimensions =>
      'The image has invalid size (empty or zero dimensions).';

  @override
  String get failedToDecodeHeic => 'Failed to decode HEIC';

  @override
  String get failedToEncodeHeic => 'Failed to encode HEIC';

  @override
  String get previewNotAvailable => 'Preview is not available for this format';

  @override
  String get batchPreviewNoThumbnail => 'No thumbnail';

  @override
  String get batchPreviewWaiting => 'Thumbnail after conversion';

  @override
  String get failedToEncodeAvif => 'Failed to encode AVIF';

  @override
  String get formatPairNotSupported => 'This format pair is not supported';

  @override
  String get pdfRenderUnavailable => 'PDF could not be rendered on this device';

  @override
  String get savePdfFailed => 'Failed to save PDF';

  @override
  String get unsupportedInputFormat => 'Unsupported input format';

  @override
  String get open => 'Open';

  @override
  String get openFileFailed => 'Could not open file with another app';

  @override
  String get openFileUnavailableWeb =>
      'Opening files in another app is not available on web';

  @override
  String get outputFileEmpty => 'Output file is empty';

  @override
  String get outputEncodeRoundTripFailed =>
      'Output file was not readable after save';

  @override
  String get toggleTheme => 'Toggle theme';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Cannot prepare a temporary workspace for this file. Try another source or free storage.';

  @override
  String get conversionHintQuick => 'Usually finishes in a few seconds.';

  @override
  String get conversionHintHeavy =>
      'Large file — conversion may take ~10–30 seconds.';

  @override
  String get conversionHintPdf =>
      'PDF export may take longer (~10–30 seconds).';

  @override
  String get batchReady => 'Batch queue is ready';

  @override
  String get batchDone => 'Batch conversion completed';

  @override
  String get noBatchFiles => 'No files selected for batch conversion';

  @override
  String get progressFiles => 'files';

  @override
  String get batchModeTitle => 'Batch conversion';

  @override
  String get batchModeSubtitle =>
      'Choose target format, then convert all files. Single-file view is hidden in this mode.';

  @override
  String get batchSummaryTotal => 'Total';

  @override
  String get batchSummaryDone => 'Done';

  @override
  String get batchSummaryFailed => 'Failed';

  @override
  String get batchSummaryQueued => 'Queued';

  @override
  String get saveAllSuccessful => 'Save all successful';

  @override
  String get batchSaveAllStarting => 'Saving files...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Saving $current/$total';
  }

  @override
  String get retryFailed => 'Retry failed';

  @override
  String get clearCompleted => 'Clear completed';

  @override
  String get clearCompletedTooltip =>
      'Remove items marked as saved from this list';

  @override
  String get clearBatchQueue => 'Clear queue';

  @override
  String get batchStatusQueued => 'Queued';

  @override
  String get batchStatusConverting => 'Converting';

  @override
  String get batchStatusDone => 'Done';

  @override
  String get batchStatusFailed => 'Failed';

  @override
  String get batchStatusSaving => 'Saving';

  @override
  String get batchStatusSaved => 'Saved';

  @override
  String get batchStatusCancelled => 'Cancelled';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'Download';

  @override
  String get language => 'Language';

  @override
  String get systemLanguage => 'System default';

  @override
  String get errorDialogTitle => 'Error';

  @override
  String get pickedFileCaption => 'Picked file';
}
