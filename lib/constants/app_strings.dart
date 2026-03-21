abstract final class AppStrings {
  static const String appName = 'General Converter';
  static const String pickImage = 'Pick file';
  static const String pickFromGallery = 'Gallery';
  static const String pickFromFiles = 'Files';
  static const String pickFileTitle = 'Choose source';
  static const String targetFormat = 'Target format';
  static const String convert = 'Convert';
  static const String converting = 'Converting...';
  static const String fileTooLarge =
      'File is too large (max 50 MB on this device).';
  static const String largeFileWarning =
      'Large file — it will be scaled down so the app does not run out of memory.';
  static const String notEnoughMemory =
      'Not enough memory to process this file. Try a smaller image or close other apps.';
  static const String save = 'Save';
  static const String saving = 'Saving...';
  static const String saved = 'Saved';
  static const String share = 'Share';
  static const String dismiss = 'Dismiss';
  static const String emptyStateHint = 'Tap + to pick from gallery or files';
  static const String conversionFailed = 'Conversion failed';
  static const String saveFailed = 'Failed to save';
  static const String pickFailed = 'Failed to pick image';
  static const String tapToPick = 'Tap to pick a file';
  static const String invalidOrCorruptImage =
      'The file is not a valid image or appears to be damaged.';
  static const String invalidImageDimensions =
      'The image has invalid size (empty or zero dimensions).';
  /// Короткое сообщение для баннера (см. также [heicDecodeFailed]).
  static const String failedToDecodeHeic = 'Failed to decode HEIC';
  static const String heicDecodeFailed = failedToDecodeHeic;
  static const String failedToEncodeHeic = 'Failed to encode HEIC';

  static const String previewNotAvailable =
      'Preview is not available for this format';

  static const String failedToEncodeAvif = 'Failed to encode AVIF';
  static const String avifEncodeFailed = failedToEncodeAvif;

  static const String formatPairNotSupported =
      'Format pair is not supported yet';

  static const String pdfRenderUnavailable =
      'PDF could not be rendered on this device';

  static const String savePdfFailed = 'Failed to save PDF';

  static const String unsupportedInputFormat =
      'This file type is not supported';

  static const String open = 'Open';
  static const String openFileFailed = 'Could not open file with another app';
  static const String openFileUnavailableWeb =
      'Opening files in another app is not available on web';
  static const String outputFileEmpty =
      'Output file is empty — conversion failed. Try another format or a smaller image.';
  static const String toggleTheme = 'Toggle theme';
}
