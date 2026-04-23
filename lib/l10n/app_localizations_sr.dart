// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbian (`sr`).
class AppLocalizationsSr extends AppLocalizations {
  AppLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get appName => 'Opšti konverter';

  @override
  String get pickImage => 'Izaberi datoteku';

  @override
  String get pickFromGallery => 'Galerija';

  @override
  String get pickFromFiles => 'Datoteke';

  @override
  String get pickManyFiles => 'Grupne datoteke';

  @override
  String get pickFolder => 'Folder';

  @override
  String get pickFileTitle => 'Izaberite izvor';

  @override
  String get targetFormat => 'Ciljni format';

  @override
  String get convert => 'Konvertuj';

  @override
  String get convertBatch => 'Konvertuj grupno';

  @override
  String get converting => 'Konvertovanje...';

  @override
  String get cancel => 'Otkaži';

  @override
  String get fileTooLarge => 'Datoteka je prevelika';

  @override
  String get largeFileWarning =>
      'Otkrivena velika datoteka. Konverzija može smanjiti veličinu slike radi stabilnosti.';

  @override
  String get notEnoughMemory =>
      'Nema dovoljno memorije za obradu ove datoteke. Pokušajte manju sliku ili zatvorite druge aplikacije.';

  @override
  String get memoryGuardTriggered =>
      'Datoteka je preteška za sigurnu konverziju na ovom uređaju.';

  @override
  String get batchMemoryGuardTriggered =>
      'Izabrano je previše teških datoteka odjednom. Podelite grupu.';

  @override
  String get save => 'Sačuvaj';

  @override
  String get saving => 'Čuvanje...';

  @override
  String get saved => 'Sačuvano';

  @override
  String get share => 'Podeli';

  @override
  String get rename => 'Preimenuj';

  @override
  String get renameOutput => 'Preimenuj izlaz';

  @override
  String get renameHint => 'Ime datoteke bez ekstenzije';

  @override
  String get apply => 'Primeni';

  @override
  String get dismiss => 'Zatvori';

  @override
  String get emptyStateHint =>
      'Dodirnite + da izaberete iz galerije ili datoteka';

  @override
  String get conversionFailed => 'Konverzija nije uspela';

  @override
  String get batchConversionFailed => 'Grupna konverzija nije uspela';

  @override
  String get saveFailed => 'Čuvanje nije uspelo';

  @override
  String get pickFailed => 'Izbor nije uspeo';

  @override
  String get tapToPick => 'Dodirnite da izaberete datoteku';

  @override
  String get invalidOrCorruptImage =>
      'Datoteka nije važeća slika ili izgleda oštećeno.';

  @override
  String get invalidImageDimensions =>
      'Slika ima nevažeće dimenzije (prazno ili nula).';

  @override
  String get failedToDecodeHeic => 'Dekodovanje HEIC nije uspelo';

  @override
  String get failedToEncodeHeic => 'Kodovanje HEIC nije uspelo';

  @override
  String get previewNotAvailable => 'Pregled nije dostupan za ovaj format';

  @override
  String get batchPreviewNoThumbnail => 'Nema sličice';

  @override
  String get batchPreviewWaiting => 'Sličica posle konverzije';

  @override
  String get failedToEncodeAvif => 'Kodovanje AVIF nije uspelo';

  @override
  String get formatPairNotSupported => 'Ovaj par formata nije podržan';

  @override
  String get pdfRenderUnavailable =>
      'PDF nije moguće prikazati na ovom uređaju';

  @override
  String get savePdfFailed => 'Čuvanje PDF-a nije uspelo';

  @override
  String get unsupportedInputFormat => 'Nepodržani ulazni format';

  @override
  String get open => 'Otvori';

  @override
  String get openFileFailed =>
      'Nije moguće otvoriti datoteku drugim programom';

  @override
  String get openFileUnavailableWeb =>
      'Otvaranje datoteka u drugom programu nije dostupno na webu';

  @override
  String get outputFileEmpty => 'Izlazna datoteka je prazna';

  @override
  String get outputEncodeRoundTripFailed =>
      'Izlazna datoteka nije bila čitljiva nakon čuvanja';

  @override
  String get toggleTheme => 'Promeni temu';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Ne mogu da pripremim privremeni radni prostor za ovu datoteku. Pokušajte drugi izvor ili oslobodite prostor za skladištenje.';

  @override
  String get conversionHintQuick => 'Obično se završava za nekoliko sekundi.';

  @override
  String get conversionHintHeavy =>
      'Velika datoteka — konverzija može potrajati ~10–30 sekundi.';

  @override
  String get conversionHintPdf =>
      'Izvoz u PDF može potrajati duže (~10–30 sekundi).';

  @override
  String get batchReady => 'Red za grupu je spreman';

  @override
  String get batchDone => 'Grupna konverzija završena';

  @override
  String get noBatchFiles => 'Nema datoteka odabranih za grupnu konverziju';

  @override
  String get progressFiles => 'datoteke';

  @override
  String get batchModeTitle => 'Grupna konverzija';

  @override
  String get batchModeSubtitle =>
      'Izaberite ciljni format, zatim konvertujte sve datoteke. Prikaz pojedinačne datoteke je skriven u ovom modu.';

  @override
  String get batchSummaryTotal => 'Ukupno';

  @override
  String get batchSummaryDone => 'Završeno';

  @override
  String get batchSummaryFailed => 'Neuspešno';

  @override
  String get batchSummaryQueued => 'U redu';

  @override
  String get saveAllSuccessful => 'Sve uspešno sačuvano';

  @override
  String get batchSaveAllStarting => 'Čuvanje datoteka...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Čuvanje $current/$total';
  }

  @override
  String get retryFailed => 'Pokušajte ponovo nije uspelo';

  @override
  String get clearCompleted => 'Obriši završene';

  @override
  String get clearCompletedTooltip =>
      'Uklonite stavke koje su označene kao sačuvane iz ovog spiska';

  @override
  String get clearBatchQueue => 'Obriši red';

  @override
  String get batchStatusQueued => 'U redu';

  @override
  String get batchStatusConverting => 'Konvertuje se';

  @override
  String get batchStatusDone => 'Završeno';

  @override
  String get batchStatusFailed => 'Neuspešno';

  @override
  String get batchStatusSaving => 'Čuva se';

  @override
  String get batchStatusSaved => 'Sačuvano';

  @override
  String get batchStatusCancelled => 'Otkazano';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'Preuzmi';

  @override
  String get language => 'Jezik';

  @override
  String get systemLanguage => 'Podrazumevano sistema';

  @override
  String get errorDialogTitle => 'Greška';

  @override
  String get pickedFileCaption => 'Izabrana datoteka';

  @override
  String get keepScreenOn => 'Drži ekran uključen';

  @override
  String get keepScreenOnTooltip =>
      'Sprečite gašenje ekrana dok je aplikacija aktivna.';
}
