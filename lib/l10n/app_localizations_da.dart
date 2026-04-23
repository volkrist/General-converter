// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appName => 'Generisk konverter';

  @override
  String get pickImage => 'Vælg fil';

  @override
  String get pickFromGallery => 'Galleri';

  @override
  String get pickFromFiles => 'Filer';

  @override
  String get pickManyFiles => 'Batch-filer';

  @override
  String get pickFolder => 'Mappe';

  @override
  String get pickFileTitle => 'Vælg kilde';

  @override
  String get targetFormat => 'Målformat';

  @override
  String get convert => 'Konverter';

  @override
  String get convertBatch => 'Konverter batch';

  @override
  String get converting => 'Konverterer...';

  @override
  String get cancel => 'Annuller';

  @override
  String get fileTooLarge => 'Filen er for stor';

  @override
  String get largeFileWarning =>
      'Stor fil opdaget. Konvertering kan reducere billedstørrelsen for stabilitet.';

  @override
  String get notEnoughMemory =>
      'Ikke nok hukommelse til at behandle denne fil. Prøv et mindre billede eller luk andre apps.';

  @override
  String get memoryGuardTriggered =>
      'Filen er for krævende til sikker konvertering på denne enhed.';

  @override
  String get batchMemoryGuardTriggered =>
      'For mange tunge filer valgt på én gang. Del batchen op.';

  @override
  String get save => 'Gem';

  @override
  String get saving => 'Gemmer...';

  @override
  String get saved => 'Gemt';

  @override
  String get share => 'Del';

  @override
  String get rename => 'Omdøb';

  @override
  String get renameOutput => 'Omdøb output';

  @override
  String get renameHint => 'Filnavn uden filtype';

  @override
  String get apply => 'Anvend';

  @override
  String get dismiss => 'Luk';

  @override
  String get emptyStateHint => 'Tryk + for at vælge fra galleri eller filer';

  @override
  String get conversionFailed => 'Konvertering mislykkedes';

  @override
  String get batchConversionFailed => 'Batch-konvertering mislykkedes';

  @override
  String get saveFailed => 'Gem mislykkedes';

  @override
  String get pickFailed => 'Valg af billede mislykkedes';

  @override
  String get tapToPick => 'Tryk for at vælge fil';

  @override
  String get invalidOrCorruptImage =>
      'Filen er ikke et gyldigt billede eller ser ud til at være beskadiget.';

  @override
  String get invalidImageDimensions =>
      'Billedet har ugyldige dimensioner (tomt eller nul dimensioner).';

  @override
  String get failedToDecodeHeic => 'Kunne ikke dekode HEIC';

  @override
  String get failedToEncodeHeic => 'Kunne ikke kode HEIC';

  @override
  String get previewNotAvailable =>
      'Forhåndsvisning er ikke tilgængelig for dette format';

  @override
  String get batchPreviewNoThumbnail => 'Ingen miniature';

  @override
  String get batchPreviewWaiting => 'Miniature efter konvertering';

  @override
  String get failedToEncodeAvif => 'Kunne ikke kode AVIF';

  @override
  String get formatPairNotSupported => 'Dette formatpar understøttes ikke';

  @override
  String get pdfRenderUnavailable => 'PDF kunne ikke gengives på denne enhed';

  @override
  String get savePdfFailed => 'Kunne ikke gemme PDF';

  @override
  String get unsupportedInputFormat => 'Uunderstøttet inputformat';

  @override
  String get open => 'Åbn';

  @override
  String get openFileFailed => 'Kunne ikke åbne fil med en anden app';

  @override
  String get openFileUnavailableWeb =>
      'Åbning af filer i en anden app er ikke tilgængelig på web';

  @override
  String get outputFileEmpty => 'Outputfilen er tom';

  @override
  String get outputEncodeRoundTripFailed =>
      'Outputfilen kunne ikke læses efter gem';

  @override
  String get toggleTheme => 'Skift tema';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Kan ikke forberede et midlertidigt arbejdsområde til denne fil. Prøv en anden kilde eller frigør lagerplads.';

  @override
  String get conversionHintQuick => 'Færdiggøres normalt på få sekunder.';

  @override
  String get conversionHintHeavy =>
      'Stor fil — konvertering kan tage ~10–30 sekunder.';

  @override
  String get conversionHintPdf =>
      'PDF-eksport kan tage længere tid (~10–30 sekunder).';

  @override
  String get batchReady => 'Batch-køen er klar';

  @override
  String get batchDone => 'Batch-konvertering fuldført';

  @override
  String get noBatchFiles => 'Ingen filer valgt til batch-konvertering';

  @override
  String get progressFiles => 'filer';

  @override
  String get batchModeTitle => 'Batch-konvertering';

  @override
  String get batchModeSubtitle =>
      'Vælg målformat, og konverter derefter alle filer. Enkel-fils visning er skjult i denne tilstand.';

  @override
  String get batchSummaryTotal => 'I alt';

  @override
  String get batchSummaryDone => 'Færdig';

  @override
  String get batchSummaryFailed => 'Mislykkedes';

  @override
  String get batchSummaryQueued => 'I kø';

  @override
  String get saveAllSuccessful => 'Alle gemt korrekt';

  @override
  String get batchSaveAllStarting => 'Gemmer filer...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Gemmer $current/$total';
  }

  @override
  String get retryFailed => 'Prøv igen';

  @override
  String get clearCompleted => 'Ryd fuldførte';

  @override
  String get clearCompletedTooltip =>
      'Fjern elementer markeret som gemt fra denne liste';

  @override
  String get clearBatchQueue => 'Ryd kø';

  @override
  String get batchStatusQueued => 'I kø';

  @override
  String get batchStatusConverting => 'Konverterer';

  @override
  String get batchStatusDone => 'Færdig';

  @override
  String get batchStatusFailed => 'Mislykkedes';

  @override
  String get batchStatusSaving => 'Gemmer';

  @override
  String get batchStatusSaved => 'Gemt';

  @override
  String get batchStatusCancelled => 'Annulleret';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'Download';

  @override
  String get language => 'Sprog';

  @override
  String get systemLanguage => 'Systemstandard';

  @override
  String get errorDialogTitle => 'Fejl';

  @override
  String get pickedFileCaption => 'Valgt fil';

  @override
  String get keepScreenOn => 'Hold skærm tændt';

  @override
  String get keepScreenOnTooltip =>
      'Forhindrer, at enhedens skærm slukker, mens appen er aktiv.';
}
