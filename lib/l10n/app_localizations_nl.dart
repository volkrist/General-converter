// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appName => 'Algemene Converter';

  @override
  String get pickImage => 'Kies bestand';

  @override
  String get pickFromGallery => 'Galerij';

  @override
  String get pickFromFiles => 'Bestanden';

  @override
  String get pickManyFiles => 'Batch bestanden';

  @override
  String get pickFolder => 'Map';

  @override
  String get pickFileTitle => 'Kies bron';

  @override
  String get targetFormat => 'Doelformaat';

  @override
  String get convert => 'Converteren';

  @override
  String get convertBatch => 'Batch converteren';

  @override
  String get converting => 'Bezig met converteren...';

  @override
  String get cancel => 'Annuleren';

  @override
  String get fileTooLarge => 'Bestand is te groot';

  @override
  String get largeFileWarning =>
      'Groot bestand gedetecteerd. Conversie kan de afbeeldingsgrootte verkleinen voor stabiliteit.';

  @override
  String get notEnoughMemory =>
      'Niet genoeg geheugen om dit bestand te verwerken. Probeer een kleinere afbeelding of sluit andere apps.';

  @override
  String get memoryGuardTriggered =>
      'Bestand is te zwaar voor veilige conversie op dit apparaat.';

  @override
  String get batchMemoryGuardTriggered =>
      'Te veel zware bestanden tegelijk geselecteerd. Verdeel de batch in kleinere delen.';

  @override
  String get save => 'Opslaan';

  @override
  String get saving => 'Bezig met opslaan...';

  @override
  String get saved => 'Opgeslagen';

  @override
  String get share => 'Delen';

  @override
  String get rename => 'Hernoemen';

  @override
  String get renameOutput => 'Uitvoer hernoemen';

  @override
  String get renameHint => 'Bestandsnaam zonder extensie';

  @override
  String get apply => 'Toepassen';

  @override
  String get dismiss => 'Sluiten';

  @override
  String get emptyStateHint => 'Tik op + om te kiezen uit galerij of bestanden';

  @override
  String get conversionFailed => 'Conversie mislukt';

  @override
  String get batchConversionFailed => 'Batchconversie mislukt';

  @override
  String get saveFailed => 'Opslaan mislukt';

  @override
  String get pickFailed => 'Selecteren mislukt';

  @override
  String get tapToPick => 'Tik om een bestand te kiezen';

  @override
  String get invalidOrCorruptImage =>
      'Het bestand is geen geldige afbeelding of lijkt beschadigd te zijn.';

  @override
  String get invalidImageDimensions =>
      'De afbeelding heeft ongeldige afmetingen (leeg of nul).';

  @override
  String get failedToDecodeHeic => 'HEIC decoderen mislukt';

  @override
  String get failedToEncodeHeic => 'HEIC coderen mislukt';

  @override
  String get previewNotAvailable =>
      'Voorvertoning is niet beschikbaar voor dit formaat';

  @override
  String get batchPreviewNoThumbnail => 'Geen miniatuur';

  @override
  String get batchPreviewWaiting => 'Miniatuur na conversie';

  @override
  String get failedToEncodeAvif => 'AVIF coderen mislukt';

  @override
  String get formatPairNotSupported =>
      'Dit formatenpaar wordt niet ondersteund';

  @override
  String get pdfRenderUnavailable =>
      'PDF kon niet worden weergegeven op dit apparaat';

  @override
  String get savePdfFailed => 'PDF opslaan mislukt';

  @override
  String get unsupportedInputFormat => 'Niet-ondersteund invoerformaat';

  @override
  String get open => 'Openen';

  @override
  String get openFileFailed => 'Kon bestand niet openen met een andere app';

  @override
  String get openFileUnavailableWeb =>
      'Bestanden openen in een andere app is niet beschikbaar op het web';

  @override
  String get outputFileEmpty => 'Uitvoerbestand is leeg';

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
  String get pickedFileCaption => 'Geselecteerd bestand';

  @override
  String get keepScreenOn => 'Keep screen on';

  @override
  String get keepScreenOnTooltip =>
      'Prevent the device display from turning off while the app is active.';
}
