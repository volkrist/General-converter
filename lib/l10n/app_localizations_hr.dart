// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get appName => 'Opći pretvarač';

  @override
  String get pickImage => 'Odaberi datoteku';

  @override
  String get pickFromGallery => 'Galerija';

  @override
  String get pickFromFiles => 'Datoteke';

  @override
  String get pickManyFiles => 'Višestruke datoteke';

  @override
  String get pickFolder => 'Mapa';

  @override
  String get pickFileTitle => 'Odaberite izvor';

  @override
  String get targetFormat => 'Ciljani format';

  @override
  String get convert => 'Pretvori';

  @override
  String get convertBatch => 'Pretvori skupno';

  @override
  String get converting => 'Pretvaranje...';

  @override
  String get cancel => 'Otkaži';

  @override
  String get fileTooLarge => 'Datoteka je prevelika';

  @override
  String get largeFileWarning =>
      'Otkrivena je velika datoteka. Pretvorba može smanjiti veličinu slike radi stabilnosti.';

  @override
  String get notEnoughMemory =>
      'Nema dovoljno memorije za obradu ove datoteke. Pokušajte manju sliku ili zatvorite druge aplikacije.';

  @override
  String get memoryGuardTriggered =>
      'Datoteka je preteška za sigurnu konverziju na ovom uređaju.';

  @override
  String get batchMemoryGuardTriggered =>
      'Odabrano je previše teških datoteka odjednom. Podijelite skup.';

  @override
  String get save => 'Spremi';

  @override
  String get saving => 'Spremanje...';

  @override
  String get saved => 'Spremljeno';

  @override
  String get share => 'Dijeli';

  @override
  String get rename => 'Preimenuj';

  @override
  String get renameOutput => 'Preimenuj izlaz';

  @override
  String get renameHint => 'Ime datoteke bez ekstenzije';

  @override
  String get apply => 'Primijeni';

  @override
  String get dismiss => 'Zatvori';

  @override
  String get emptyStateHint => 'Dodirnite + za odabir iz galerije ili datoteka';

  @override
  String get conversionFailed => 'Konverzija nije uspjela';

  @override
  String get batchConversionFailed => 'Skupna konverzija nije uspjela';

  @override
  String get saveFailed => 'Spremanje nije uspjelo';

  @override
  String get pickFailed => 'Odabir nije uspio';

  @override
  String get tapToPick => 'Dodirnite za odabir datoteke';

  @override
  String get invalidOrCorruptImage =>
      'Datoteka nije valjana slika ili izgleda oštećeno.';

  @override
  String get invalidImageDimensions =>
      'Slika ima nevažeće dimenzije (prazno ili nula).';

  @override
  String get failedToDecodeHeic => 'Dekodiranje HEIC-a nije uspjelo';

  @override
  String get failedToEncodeHeic => 'Kodiranje HEIC-a nije uspjelo';

  @override
  String get previewNotAvailable => 'Pregled nije dostupan za ovaj format';

  @override
  String get batchPreviewNoThumbnail => 'Nema sličice';

  @override
  String get batchPreviewWaiting => 'Sličica nakon konverzije';

  @override
  String get failedToEncodeAvif => 'Kodiranje AVIF-a nije uspjelo';

  @override
  String get formatPairNotSupported => 'Ovaj par formata nije podržan';

  @override
  String get pdfRenderUnavailable =>
      'PDF se nije mogao prikazati na ovom uređaju';

  @override
  String get savePdfFailed => 'Spremanje PDF-a nije uspjelo';

  @override
  String get unsupportedInputFormat => 'Nepodržani ulazni format';

  @override
  String get open => 'Otvori';

  @override
  String get openFileFailed =>
      'Nije moguće otvoriti datoteku drugom aplikacijom';

  @override
  String get openFileUnavailableWeb =>
      'Otvaranje datoteka u drugoj aplikaciji nije dostupno na webu';

  @override
  String get outputFileEmpty => 'Izlazna datoteka je prazna';

  @override
  String get outputEncodeRoundTripFailed =>
      'Izlazna datoteka nije bila čitljiva nakon spremanja';

  @override
  String get toggleTheme => 'Promijeni temu';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Nije moguće pripremiti privremeni radni prostor za ovu datoteku. Pokušajte drugi izvor ili oslobodite pohranu.';

  @override
  String get conversionHintQuick => 'Obično završava za nekoliko sekundi.';

  @override
  String get conversionHintHeavy =>
      'Velika datoteka — konverzija može potrajati ~10–30 sekundi.';

  @override
  String get conversionHintPdf =>
      'Izvoz PDF-a može potrajati duže (~10–30 sekundi).';

  @override
  String get batchReady => 'Red za skup je spreman';

  @override
  String get batchDone => 'Skupna konverzija dovršena';

  @override
  String get noBatchFiles => 'Nema datoteka odabranih za skupnu konverziju';

  @override
  String get progressFiles => 'datoteke';

  @override
  String get batchModeTitle => 'Skupna konverzija';

  @override
  String get batchModeSubtitle =>
      'Odaberite ciljani format, zatim konvertirajte sve datoteke. Prikaz jedne datoteke je skriven u ovom načinu.';

  @override
  String get batchSummaryTotal => 'Ukupno';

  @override
  String get batchSummaryDone => 'Dovršeno';

  @override
  String get batchSummaryFailed => 'Neuspjelo';

  @override
  String get batchSummaryQueued => 'U redu';

  @override
  String get saveAllSuccessful => 'Sve uspješno spremljeno';

  @override
  String get batchSaveAllStarting => 'Spremanje datoteka...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Spremanje $current/$total';
  }

  @override
  String get retryFailed => 'Pokušaj ponovno';

  @override
  String get clearCompleted => 'Očisti dovršeno';

  @override
  String get clearCompletedTooltip =>
      'Uklonite stavke označene kao spremljene s ovog popisa';

  @override
  String get clearBatchQueue => 'Očisti red';

  @override
  String get batchStatusQueued => 'U redu';

  @override
  String get batchStatusConverting => 'Konvertira se';

  @override
  String get batchStatusDone => 'Dovršeno';

  @override
  String get batchStatusFailed => 'Neuspjelo';

  @override
  String get batchStatusSaving => 'Spremanje';

  @override
  String get batchStatusSaved => 'Spremljeno';

  @override
  String get batchStatusCancelled => 'Otkazano';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'Preuzmi';

  @override
  String get language => 'Jezik';

  @override
  String get systemLanguage => 'Zadano sustava';

  @override
  String get errorDialogTitle => 'Pogreška';

  @override
  String get pickedFileCaption => 'Odabrana datoteka';

  @override
  String get keepScreenOn => 'Drži zaslon uključen';

  @override
  String get keepScreenOnTooltip =>
      'Spriječite gašenje zaslona dok je aplikacija aktivna.';
}
