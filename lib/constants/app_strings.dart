abstract final class AppStrings {
  static const String appName = 'General Converter';

  static const String pickImage = 'Pick file';
  static const String pickFromGallery = 'Gallery';
  static const String pickFromFiles = 'Files';
  static const String pickManyFiles = 'Batch files';
  static const String pickFolder = 'Folder';
  static const String pickFileTitle = 'Choose source';

  static const String targetFormat = 'Target format';
  static const String convert = 'Convert';
  static const String convertBatch = 'Convert batch';
  static const String converting = 'Converting...';
  static const String cancel = 'Cancel';

  static const String fileTooLarge = 'File is too large';
  static const String largeFileWarning =
      'Large file detected. Conversion may reduce image size for stability.';
  static const String notEnoughMemory =
      'Not enough memory to process this file. Try a smaller image or close other apps.';
  static const String memoryGuardTriggered =
      'File is too heavy for safe conversion on this device.';
  static const String batchMemoryGuardTriggered =
      'Too many heavy files selected at once. Split the batch into smaller parts.';

  static const String save = 'Save';
  static const String saving = 'Saving...';
  static const String saved = 'Saved';
  static const String share = 'Share';
  static const String rename = 'Rename';
  static const String renameOutput = 'Rename output';
  static const String renameHint = 'File name without extension';
  static const String apply = 'Apply';
  static const String dismiss = 'Dismiss';

  static const String emptyStateHint = 'Tap + to pick from gallery or files';
  static const String conversionFailed = 'Conversion failed';
  static const String batchConversionFailed = 'Batch conversion failed';
  static const String saveFailed = 'Failed to save';
  static const String pickFailed = 'Failed to pick image';
  static const String tapToPick = 'Tap to pick a file';

  static const String invalidOrCorruptImage =
      'The file is not a valid image or appears to be damaged.';
  static const String invalidImageDimensions =
      'The image has invalid size (empty or zero dimensions).';

  static const String failedToDecodeHeic = 'Failed to decode HEIC';
  static const String heicDecodeFailed = failedToDecodeHeic;
  static const String failedToEncodeHeic = 'Failed to encode HEIC';

  static const String previewNotAvailable =
      'Preview is not available for this format';

  static const String failedToEncodeAvif = 'Failed to encode AVIF';
  static const String avifEncodeFailed = failedToEncodeAvif;

  static const String formatPairNotSupported =
      'This format pair is not supported';

  static const String pdfRenderUnavailable =
      'PDF could not be rendered on this device';

  static const String savePdfFailed = 'Failed to save PDF';
  static const String unsupportedInputFormat = 'Unsupported input format';

  static const String open = 'Open';
  static const String openFileFailed = 'Could not open file with another app';
  static const String openFileUnavailableWeb =
      'Opening files in another app is not available on web';

  static const String outputFileEmpty = 'Output file is empty';
  static const String outputEncodeRoundTripFailed =
      'Output file was not readable after save';

  static const String toggleTheme = 'Toggle theme';

  static const String policyPreShrinkNoWritableDir =
      'Cannot prepare a temporary workspace for this file. Try another source or free storage.';

  static const String conversionHintQuick =
      'Usually finishes in a few seconds.';
  static const String conversionHintHeavy =
      'Large file — conversion may take ~10–30 seconds.';
  static const String conversionHintPdf =
      'PDF export may take longer (~10–30 seconds).';

  static const String batchReady = 'Batch queue is ready';
  static const String batchDone = 'Batch conversion completed';
  static const String noBatchFiles = 'No files selected for batch conversion';
  static const String progressFiles = 'files';

  static const String batchModeTitle = 'Batch conversion';
  static const String batchModeSubtitle =
      'Choose target format, then convert all files. Single-file view is hidden in this mode.';
  static const String batchSummaryTotal = 'Total';
  static const String batchSummaryDone = 'Done';
  static const String batchSummaryFailed = 'Failed';
  static const String batchSummaryQueued = 'Queued';
  static const String saveAllSuccessful = 'Save all successful';
  static const String batchSaveAllStarting = 'Saving files...';
  static String batchSaveAllProgressLabel(int current, int total) =>
      'Saving $current/$total';
  static const String retryFailed = 'Retry failed';
  static const String clearCompleted = 'Clear completed';
  /// Rows already saved to gallery (unsaved “done” items stay in the list).
  static const String clearCompletedTooltip =
      'Remove items marked as saved from this list';
  static const String clearBatchQueue = 'Clear queue';
  static const String batchStatusQueued = 'Queued';
  static const String batchStatusConverting = 'Converting';
  static const String batchStatusDone = 'Done';
  static const String batchStatusFailed = 'Failed';
  static const String batchStatusSaving = 'Saving';
  static const String batchStatusSaved = 'Saved';
  static const String batchStatusCancelled = 'Cancelled';
}
