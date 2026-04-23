// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appName => 'Általános konverter';

  @override
  String get pickImage => 'Fájl kiválasztása';

  @override
  String get pickFromGallery => 'Galéria';

  @override
  String get pickFromFiles => 'Fájlok';

  @override
  String get pickManyFiles => 'Tömeges fájlok';

  @override
  String get pickFolder => 'Mappa';

  @override
  String get pickFileTitle => 'Forrás kiválasztása';

  @override
  String get targetFormat => 'Célformátum';

  @override
  String get convert => 'Konvertálás';

  @override
  String get convertBatch => 'Kötegkonvertálás';

  @override
  String get converting => 'Konvertálás...';

  @override
  String get cancel => 'Mégse';

  @override
  String get fileTooLarge => 'A fájl túl nagy';

  @override
  String get largeFileWarning =>
      'Nagy fájl észlelve. A konverzió a stabilitás érdekében csökkentheti a kép méretét.';

  @override
  String get notEnoughMemory =>
      'Nincs elegendő memória a fájl feldolgozásához. Próbáljon kisebb képet vagy zárjon be más alkalmazásokat.';

  @override
  String get memoryGuardTriggered =>
      'A fájl túl nehéz a biztonságos konverzióhoz ezen az eszközön.';

  @override
  String get batchMemoryGuardTriggered =>
      'Egyszerre túl sok nehéz fájl lett kiválasztva. Ossza fel a köteget.';

  @override
  String get save => 'Mentés';

  @override
  String get saving => 'Mentés...';

  @override
  String get saved => 'Mentve';

  @override
  String get share => 'Megosztás';

  @override
  String get rename => 'Átnevezés';

  @override
  String get renameOutput => 'Kimenet átnevezése';

  @override
  String get renameHint => 'Fájlnév kiterjesztés nélkül';

  @override
  String get apply => 'Alkalmaz';

  @override
  String get dismiss => 'Bezárás';

  @override
  String get emptyStateHint =>
      'Érintse a + gombot a galériából vagy fájlokból való kiválasztáshoz';

  @override
  String get conversionFailed => 'A konverzió sikertelen';

  @override
  String get batchConversionFailed => 'A kötegkonverzió sikertelen';

  @override
  String get saveFailed => 'A mentés sikertelen';

  @override
  String get pickFailed => 'A kiválasztás sikertelen';

  @override
  String get tapToPick => 'Érintse meg a kiválasztáshoz';

  @override
  String get invalidOrCorruptImage =>
      'A fájl nem érvényes kép vagy sérültnek tűnik.';

  @override
  String get invalidImageDimensions =>
      'A kép érvénytelen méretekkel rendelkezik (üres vagy nulla).';

  @override
  String get failedToDecodeHeic => 'A HEIC dekódolása sikertelen';

  @override
  String get failedToEncodeHeic => 'A HEIC kódolása sikertelen';

  @override
  String get previewNotAvailable => 'Előnézet nem elérhető ehhez a formátumhoz';

  @override
  String get batchPreviewNoThumbnail => 'Nincs bélyegkép';

  @override
  String get batchPreviewWaiting => 'Bélyegkép a konverzió után';

  @override
  String get failedToEncodeAvif => 'Az AVIF kódolása sikertelen';

  @override
  String get formatPairNotSupported => 'Ez a formátumpár nem támogatott';

  @override
  String get pdfRenderUnavailable =>
      'A PDF nem jeleníthető meg ezen az eszközön';

  @override
  String get savePdfFailed => 'PDF mentése sikertelen';

  @override
  String get unsupportedInputFormat => 'Nem támogatott bemeneti formátum';

  @override
  String get open => 'Megnyitás';

  @override
  String get openFileFailed =>
      'Nem sikerült megnyitni a fájlt egy másik alkalmazással';

  @override
  String get openFileUnavailableWeb =>
      'Más alkalmazásban történő fájlmegnyitás nem érhető el weben';

  @override
  String get outputFileEmpty => 'A kimeneti fájl üres';

  @override
  String get outputEncodeRoundTripFailed =>
      'A kimeneti fájl nem olvasható mentés után';

  @override
  String get toggleTheme => 'Téma váltása';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Nem lehet ideiglenes munkaterületet előkészíteni ehhez a fájlhoz. Próbáljon meg más forrást vagy szabadítson fel tárhelyet.';

  @override
  String get conversionHintQuick =>
      'Általában néhány másodperc alatt befejeződik.';

  @override
  String get conversionHintHeavy =>
      'Nagy fájl — a konverzió ~10–30 másodpercet igényelhet.';

  @override
  String get conversionHintPdf =>
      'A PDF export hosszabb ideig tarthat (~10–30 másodperc).';

  @override
  String get batchReady => 'A köteg várólista készen áll';

  @override
  String get batchDone => 'Kötegkonverzió befejezve';

  @override
  String get noBatchFiles => 'Nincsenek fájlok kiválasztva kötegkonverzióhoz';

  @override
  String get progressFiles => 'fájlok';

  @override
  String get batchModeTitle => 'Kötegkonverzió';

  @override
  String get batchModeSubtitle =>
      'Válassza ki a célformátumot, majd konvertálja az összes fájlt. Az egy fájl nézet ebben a módban rejtett.';

  @override
  String get batchSummaryTotal => 'Összesen';

  @override
  String get batchSummaryDone => 'Kész';

  @override
  String get batchSummaryFailed => 'Sikertelen';

  @override
  String get batchSummaryQueued => 'Sorban';

  @override
  String get saveAllSuccessful => 'Minden sikeresen mentve';

  @override
  String get batchSaveAllStarting => 'Fájlok mentése...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Mentés $current/$total';
  }

  @override
  String get retryFailed => 'Próbálja újra';

  @override
  String get clearCompleted => 'Befejezettek törlése';

  @override
  String get clearCompletedTooltip =>
      'Távolítsa el a mentettként jelölt elemeket erről a listáról';

  @override
  String get clearBatchQueue => 'Várólista törlése';

  @override
  String get batchStatusQueued => 'Sorban';

  @override
  String get batchStatusConverting => 'Konvertálás';

  @override
  String get batchStatusDone => 'Kész';

  @override
  String get batchStatusFailed => 'Sikertelen';

  @override
  String get batchStatusSaving => 'Mentés';

  @override
  String get batchStatusSaved => 'Mentve';

  @override
  String get batchStatusCancelled => 'Mégse';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'Letöltés';

  @override
  String get language => 'Nyelv';

  @override
  String get systemLanguage => 'Rendszer alapértelmezett';

  @override
  String get errorDialogTitle => 'Hiba';

  @override
  String get pickedFileCaption => 'Kiválasztott fájl';

  @override
  String get keepScreenOn => 'Képernyő bekapcsolva tartása';

  @override
  String get keepScreenOnTooltip =>
      'Megakadályozza a készülék kijelzőjének kikapcsolását, miközben az alkalmazás aktív.';
}
