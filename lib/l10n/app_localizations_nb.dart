// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appName => 'Generell Konverter';

  @override
  String get pickImage => 'Velg fil';

  @override
  String get pickFromGallery => 'Galleri';

  @override
  String get pickFromFiles => 'Filer';

  @override
  String get pickManyFiles => 'Batch-filer';

  @override
  String get pickFolder => 'Mappe';

  @override
  String get pickFileTitle => 'Velg kilde';

  @override
  String get targetFormat => 'Målformat';

  @override
  String get convert => 'Konverter';

  @override
  String get convertBatch => 'Batch-konverter';

  @override
  String get converting => 'Konverterer...';

  @override
  String get cancel => 'Avbryt';

  @override
  String get fileTooLarge => 'Filen er for stor';

  @override
  String get largeFileWarning =>
      'Stor fil oppdaget. Konvertering kan redusere bildestørrelsen for stabilitet.';

  @override
  String get notEnoughMemory =>
      'Ikke nok minne til å behandle denne filen. Prøv et mindre bilde eller lukk andre apper.';

  @override
  String get memoryGuardTriggered =>
      'Filen er for tung for sikker konvertering på denne enheten.';

  @override
  String get batchMemoryGuardTriggered =>
      'For mange tunge filer valgt samtidig. Del batchen i mindre deler.';

  @override
  String get save => 'Lagre';

  @override
  String get saving => 'Lagrer...';

  @override
  String get saved => 'Lagret';

  @override
  String get share => 'Del';

  @override
  String get rename => 'Gi nytt navn';

  @override
  String get renameOutput => 'Gi nytt navn til output';

  @override
  String get renameHint => 'Filnavn uten utvidelse';

  @override
  String get apply => 'Bruk';

  @override
  String get dismiss => 'Lukk';

  @override
  String get emptyStateHint => 'Trykk + for å velge fra galleri eller filer';

  @override
  String get conversionFailed => 'Konvertering mislyktes';

  @override
  String get batchConversionFailed => 'Batch-konvertering mislyktes';

  @override
  String get saveFailed => 'Lagring mislyktes';

  @override
  String get pickFailed => 'Valg mislyktes';

  @override
  String get tapToPick => 'Trykk for å velge en fil';

  @override
  String get invalidOrCorruptImage =>
      'Filen er ikke et gyldig bilde eller ser ut til å være skadet.';

  @override
  String get invalidImageDimensions =>
      'Bildet har ugyldige dimensjoner (tomt eller null).';

  @override
  String get failedToDecodeHeic => 'Kunne ikke dekode HEIC';

  @override
  String get failedToEncodeHeic => 'Kunne ikke kode HEIC';

  @override
  String get previewNotAvailable =>
      'Forhåndsvisning er ikke tilgjengelig for dette formatet';

  @override
  String get batchPreviewNoThumbnail => 'Ingen miniatyrbilde';

  @override
  String get batchPreviewWaiting => 'Miniatyrbilde etter konvertering';

  @override
  String get failedToEncodeAvif => 'Kunne ikke kode AVIF';

  @override
  String get formatPairNotSupported => 'Dette formatparet støttes ikke';

  @override
  String get pdfRenderUnavailable => 'PDF kunne ikke vises på denne enheten';

  @override
  String get savePdfFailed => 'Kunne ikke lagre PDF';

  @override
  String get unsupportedInputFormat => 'Ikke støttet inndataformat';

  @override
  String get open => 'Åpne';

  @override
  String get openFileFailed => 'Kunne ikke åpne filen med en annen app';

  @override
  String get openFileUnavailableWeb =>
      'Åpne filer i en annen app er ikke tilgjengelig på nettet';

  @override
  String get outputFileEmpty => 'Utdatafilen er tom';

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
  String get pickedFileCaption => 'Valgt fil';

  @override
  String get keepScreenOn => 'Keep screen on';

  @override
  String get keepScreenOnTooltip =>
      'Prevent the device display from turning off while the app is active.';
}
