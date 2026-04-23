// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appName => 'Convertor General';

  @override
  String get pickImage => 'Alege fișier';

  @override
  String get pickFromGallery => 'Galerie';

  @override
  String get pickFromFiles => 'Fișiere';

  @override
  String get pickManyFiles => 'Fișiere batch';

  @override
  String get pickFolder => 'Folder';

  @override
  String get pickFileTitle => 'Alege sursa';

  @override
  String get targetFormat => 'Format țintă';

  @override
  String get convert => 'Convertiți';

  @override
  String get convertBatch => 'Convertiți batch';

  @override
  String get converting => 'Se convertește...';

  @override
  String get cancel => 'Anulați';

  @override
  String get fileTooLarge => 'Fișierul este prea mare';

  @override
  String get largeFileWarning =>
      'Fișier mare detectat. Conversia poate reduce dimensiunea imaginii pentru stabilitate.';

  @override
  String get notEnoughMemory =>
      'Memorie insuficientă pentru a procesa acest fișier. Încercați o imagine mai mică sau închideți alte aplicații.';

  @override
  String get memoryGuardTriggered =>
      'Fișierul este prea greu pentru o conversie sigură pe acest dispozitiv.';

  @override
  String get batchMemoryGuardTriggered =>
      'Prea multe fișiere grele selectate simultan. Împărțiți lotul în părți mai mici.';

  @override
  String get save => 'Salvați';

  @override
  String get saving => 'Se salvează...';

  @override
  String get saved => 'Salvat';

  @override
  String get share => 'Partajați';

  @override
  String get rename => 'Redenumiți';

  @override
  String get renameOutput => 'Redenumiți ieșirea';

  @override
  String get renameHint => 'Nume fișier fără extensie';

  @override
  String get apply => 'Aplicați';

  @override
  String get dismiss => 'Închideți';

  @override
  String get emptyStateHint =>
      'Atingeți + pentru a alege din galerie sau fișiere';

  @override
  String get conversionFailed => 'Conversia a eșuat';

  @override
  String get batchConversionFailed => 'Conversia batch a eșuat';

  @override
  String get saveFailed => 'Salvarea a eșuat';

  @override
  String get pickFailed => 'Selectarea a eșuat';

  @override
  String get tapToPick => 'Atingeți pentru a alege un fișier';

  @override
  String get invalidOrCorruptImage =>
      'Fișierul nu este o imagine validă sau pare deteriorat.';

  @override
  String get invalidImageDimensions =>
      'Imaginea are dimensiuni nevalide (goală sau zero).';

  @override
  String get failedToDecodeHeic => 'Decodarea HEIC a eșuat';

  @override
  String get failedToEncodeHeic => 'Codificarea HEIC a eșuat';

  @override
  String get previewNotAvailable =>
      'Previzualizarea nu este disponibilă pentru acest format';

  @override
  String get batchPreviewNoThumbnail => 'Fără miniatură';

  @override
  String get batchPreviewWaiting => 'Miniatură după conversie';

  @override
  String get failedToEncodeAvif => 'Codificarea AVIF a eșuat';

  @override
  String get formatPairNotSupported =>
      'Această pereche de formate nu este acceptată';

  @override
  String get pdfRenderUnavailable =>
      'PDF-ul nu a putut fi redat pe acest dispozitiv';

  @override
  String get savePdfFailed => 'Salvarea PDF-ului a eșuat';

  @override
  String get unsupportedInputFormat => 'Format de intrare neacceptat';

  @override
  String get open => 'Deschideți';

  @override
  String get openFileFailed =>
      'Nu s-a putut deschide fișierul cu o altă aplicație';

  @override
  String get openFileUnavailableWeb =>
      'Deschiderea fișierelor într-o altă aplicație nu este disponibilă pe web';

  @override
  String get outputFileEmpty => 'Fișierul de ieșire este gol';

  @override
  String get outputEncodeRoundTripFailed =>
      'Fișierul de ieșire nu a fost citibil după salvare';

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
  String get pickedFileCaption => 'Fișier selectat';

  @override
  String get keepScreenOn => 'Keep screen on';

  @override
  String get keepScreenOnTooltip =>
      'Prevent the device display from turning off while the app is active.';
}
