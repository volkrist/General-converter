// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appName => 'Allmän omvandlare';

  @override
  String get pickImage => 'Välj fil';

  @override
  String get pickFromGallery => 'Galleri';

  @override
  String get pickFromFiles => 'Filer';

  @override
  String get pickManyFiles => 'Flera filer';

  @override
  String get pickFolder => 'Mapp';

  @override
  String get pickFileTitle => 'Välj källa';

  @override
  String get targetFormat => 'Målformat';

  @override
  String get convert => 'Konvertera';

  @override
  String get convertBatch => 'Konvertera batch';

  @override
  String get converting => 'Konverterar...';

  @override
  String get cancel => 'Avbryt';

  @override
  String get fileTooLarge => 'Filen är för stor';

  @override
  String get largeFileWarning =>
      'Stor fil upptäcktes. Konvertering kan minska bildstorleken för stabilitet.';

  @override
  String get notEnoughMemory =>
      'Inte tillräckligt med minne för att bearbeta denna fil. Prova en mindre bild eller stäng andra appar.';

  @override
  String get memoryGuardTriggered =>
      'Filen är för tung för säker konvertering på denna enhet.';

  @override
  String get batchMemoryGuardTriggered =>
      'För många tunga filer valda samtidigt. Dela upp batchen.';

  @override
  String get save => 'Spara';

  @override
  String get saving => 'Sparar...';

  @override
  String get saved => 'Sparad';

  @override
  String get share => 'Dela';

  @override
  String get rename => 'Byt namn';

  @override
  String get renameOutput => 'Byt namn på utdata';

  @override
  String get renameHint => 'Filnamn utan filändelse';

  @override
  String get apply => 'Applicera';

  @override
  String get dismiss => 'Stäng';

  @override
  String get emptyStateHint => 'Tryck + för att välja från galleri eller filer';

  @override
  String get conversionFailed => 'Konverteringen misslyckades';

  @override
  String get batchConversionFailed => 'Batchkonvertering misslyckades';

  @override
  String get saveFailed => 'Kunde inte spara';

  @override
  String get pickFailed => 'Kunde inte välja';

  @override
  String get tapToPick => 'Tryck för att välja en fil';

  @override
  String get invalidOrCorruptImage =>
      'Filen är inte en giltig bild eller verkar vara skadad.';

  @override
  String get invalidImageDimensions =>
      'Bilden har ogiltiga dimensioner (tom eller noll).';

  @override
  String get failedToDecodeHeic => 'Misslyckades med att avkoda HEIC';

  @override
  String get failedToEncodeHeic => 'Misslyckades med att koda HEIC';

  @override
  String get previewNotAvailable =>
      'Förhandsvisning är inte tillgänglig för detta format';

  @override
  String get batchPreviewNoThumbnail => 'Ingen miniatyr';

  @override
  String get batchPreviewWaiting => 'Miniatyr efter konvertering';

  @override
  String get failedToEncodeAvif => 'Misslyckades med att koda AVIF';

  @override
  String get formatPairNotSupported => 'Detta formatpar stöds inte';

  @override
  String get pdfRenderUnavailable => 'PDF kunde inte renderas på denna enhet';

  @override
  String get savePdfFailed => 'Kunde inte spara PDF';

  @override
  String get unsupportedInputFormat => 'Inmatningsformatet stöds inte';

  @override
  String get open => 'Öppna';

  @override
  String get openFileFailed => 'Kunde inte öppna fil med en annan app';

  @override
  String get openFileUnavailableWeb =>
      'Att öppna filer i en annan app är inte tillgängligt på webben';

  @override
  String get outputFileEmpty => 'Utdatafilen är tom';

  @override
  String get outputEncodeRoundTripFailed =>
      'Utdatafilen var inte läsbar efter sparande';

  @override
  String get toggleTheme => 'Växla tema';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Kan inte förbereda ett tillfälligt arbetsutrymme för denna fil. Försök en annan källa eller frigör lagring.';

  @override
  String get conversionHintQuick => 'Avslutas vanligtvis på några sekunder.';

  @override
  String get conversionHintHeavy =>
      'Stor fil — konverteringen kan ta ~10–30 sekunder.';

  @override
  String get conversionHintPdf =>
      'PDF-export kan ta längre tid (~10–30 sekunder).';

  @override
  String get batchReady => 'Batchkön är redo';

  @override
  String get batchDone => 'Batchkonvertering slutförd';

  @override
  String get noBatchFiles => 'Inga filer valda för batchkonvertering';

  @override
  String get progressFiles => 'filer';

  @override
  String get batchModeTitle => 'Batchkonvertering';

  @override
  String get batchModeSubtitle =>
      'Välj målformat, konvertera sedan alla filer. Enkelfilsvy är dold i detta läge.';

  @override
  String get batchSummaryTotal => 'Totalt';

  @override
  String get batchSummaryDone => 'Klar';

  @override
  String get batchSummaryFailed => 'Misslyckades';

  @override
  String get batchSummaryQueued => 'I kö';

  @override
  String get saveAllSuccessful => 'Alla sparades framgångsrikt';

  @override
  String get batchSaveAllStarting => 'Sparar filer...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Sparar $current/$total';
  }

  @override
  String get retryFailed => 'Försök igen misslyckades';

  @override
  String get clearCompleted => 'Rensa slutförda';

  @override
  String get clearCompletedTooltip =>
      'Ta bort objekt markerade som sparade från den här listan';

  @override
  String get clearBatchQueue => 'Rensa kö';

  @override
  String get batchStatusQueued => 'I kö';

  @override
  String get batchStatusConverting => 'Konverterar';

  @override
  String get batchStatusDone => 'Klar';

  @override
  String get batchStatusFailed => 'Misslyckades';

  @override
  String get batchStatusSaving => 'Sparar';

  @override
  String get batchStatusSaved => 'Sparad';

  @override
  String get batchStatusCancelled => 'Avbruten';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'Ladda ner';

  @override
  String get language => 'Språk';

  @override
  String get systemLanguage => 'Systemstandard';

  @override
  String get errorDialogTitle => 'Fel';

  @override
  String get pickedFileCaption => 'Vald fil';

  @override
  String get keepScreenOn => 'Håll skärmen på';

  @override
  String get keepScreenOnTooltip =>
      'Förhindra att skärmen slocknar medan appen är aktiv.';
}
