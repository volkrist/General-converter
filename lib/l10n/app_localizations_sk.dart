// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appName => 'Všeobecný Konvertor';

  @override
  String get pickImage => 'Vybrať súbor';

  @override
  String get pickFromGallery => 'Galéria';

  @override
  String get pickFromFiles => 'Súbory';

  @override
  String get pickManyFiles => 'Dávkové súbory';

  @override
  String get pickFolder => 'Priečinok';

  @override
  String get pickFileTitle => 'Vybrať zdroj';

  @override
  String get targetFormat => 'Cieľový formát';

  @override
  String get convert => 'Konvertovať';

  @override
  String get convertBatch => 'Dávkové konvertovanie';

  @override
  String get converting => 'Konvertovanie...';

  @override
  String get cancel => 'Zrušiť';

  @override
  String get fileTooLarge => 'Súbor je príliš veľký';

  @override
  String get largeFileWarning =>
      'Bol zistený veľký súbor. Konverzia môže zmenšiť veľkosť obrázka pre stabilitu.';

  @override
  String get notEnoughMemory =>
      'Nedostatok pamäte na spracovanie tohto súboru. Skúste menší obrázok alebo zatvorte iné aplikácie.';

  @override
  String get memoryGuardTriggered =>
      'Súbor je príliš ťažký na bezpečnú konverziu na tomto zariadení.';

  @override
  String get batchMemoryGuardTriggered =>
      'Naraz bolo vybraných príliš veľa ťažkých súborov. Rozdeľte dávku na menšie časti.';

  @override
  String get save => 'Uložiť';

  @override
  String get saving => 'Ukladanie...';

  @override
  String get saved => 'Uložené';

  @override
  String get share => 'Zdieľať';

  @override
  String get rename => 'Premenovať';

  @override
  String get renameOutput => 'Premenovať výstup';

  @override
  String get renameHint => 'Názov súboru bez prípony';

  @override
  String get apply => 'Použiť';

  @override
  String get dismiss => 'Zatvoriť';

  @override
  String get emptyStateHint => 'Ťuknite na + pre výber z galérie alebo súborov';

  @override
  String get conversionFailed => 'Konverzia zlyhala';

  @override
  String get batchConversionFailed => 'Dávková konverzia zlyhala';

  @override
  String get saveFailed => 'Uloženie zlyhalo';

  @override
  String get pickFailed => 'Výber zlyhal';

  @override
  String get tapToPick => 'Ťuknite na výber súboru';

  @override
  String get invalidOrCorruptImage =>
      'Súbor nie je platný obrázok alebo sa zdá byť poškodený.';

  @override
  String get invalidImageDimensions =>
      'Obrázok má neplatné rozmery (prázdne alebo nulové).';

  @override
  String get failedToDecodeHeic => 'Dekódovanie HEIC zlyhalo';

  @override
  String get failedToEncodeHeic => 'Kódovanie HEIC zlyhalo';

  @override
  String get previewNotAvailable =>
      'Náhľad nie je k dispozícii pre tento formát';

  @override
  String get batchPreviewNoThumbnail => 'Žiadna miniatúra';

  @override
  String get batchPreviewWaiting => 'Miniatúra po konverzii';

  @override
  String get failedToEncodeAvif => 'Kódovanie AVIF zlyhalo';

  @override
  String get formatPairNotSupported =>
      'Táto dvojica formátov nie je podporovaná';

  @override
  String get pdfRenderUnavailable =>
      'PDF sa nepodarilo zobraziť na tomto zariadení';

  @override
  String get savePdfFailed => 'Uloženie PDF zlyhalo';

  @override
  String get unsupportedInputFormat => 'Nepodporovaný vstupný formát';

  @override
  String get open => 'Otvoriť';

  @override
  String get openFileFailed => 'Nepodarilo sa otvoriť súbor v inej aplikácii';

  @override
  String get openFileUnavailableWeb =>
      'Otváranie súborov v inej aplikácii nie je k dispozícii na webe';

  @override
  String get outputFileEmpty => 'Výstupný súbor je prázdny';

  @override
  String get outputEncodeRoundTripFailed =>
      'Výstupný súbor bol nečitateľný po ukladani';

  @override
  String get toggleTheme => 'Toggle theme';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Nemôže sa pripraviť dočasný priestor pre tento súbor. Skúste iný zdroj alebo svobodné úložisko.';

  @override
  String get conversionHintQuick => 'Obvykle dokončí v niekoľkých sekundách.';

  @override
  String get conversionHintHeavy =>
      'Veľký súbor — konverzia môže trvať ~10–30 sekúnd.';

  @override
  String get conversionHintPdf =>
      'PDF export môže trvať dlhšie (~10–30 sekúnd).';

  @override
  String get batchReady => 'Dávková fronta je pripravená';

  @override
  String get batchDone => 'Dávková konverzia dokončená';

  @override
  String get noBatchFiles => 'Žiadne súbory vybrané pre dávkové konvertovanie';

  @override
  String get progressFiles => 'súbory';

  @override
  String get batchModeTitle => 'Dávkové konvertovanie';

  @override
  String get batchModeSubtitle =>
      'Vybrať cieľový formát, potom konvertovať všetky súbory. Jedno-súborový zobrazenie je skryté v tomto režime.';

  @override
  String get batchSummaryTotal => 'Celkom';

  @override
  String get batchSummaryDone => 'Dokončené';

  @override
  String get batchSummaryFailed => 'Zlyhali';

  @override
  String get batchSummaryQueued => 'V fronte';

  @override
  String get saveAllSuccessful => 'Uloženie všetkých súborov bolo úspešné';

  @override
  String get batchSaveAllStarting => 'Ukladanie súborov...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Ukladanie $current/$total';
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
  String get pickedFileCaption => 'Vybraný súbor';

  @override
  String get keepScreenOn => 'Keep screen on';

  @override
  String get keepScreenOnTooltip =>
      'Prevent the device display from turning off while the app is active.';
}
