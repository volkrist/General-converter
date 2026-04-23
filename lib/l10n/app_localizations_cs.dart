// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appName => 'Obecný převodník';

  @override
  String get pickImage => 'Vybrat soubor';

  @override
  String get pickFromGallery => 'Galerie';

  @override
  String get pickFromFiles => 'Soubory';

  @override
  String get pickManyFiles => 'Soubory v dávce';

  @override
  String get pickFolder => 'Složka';

  @override
  String get pickFileTitle => 'Vyberte zdroj';

  @override
  String get targetFormat => 'Cílový formát';

  @override
  String get convert => 'Převést';

  @override
  String get convertBatch => 'Převést dávku';

  @override
  String get converting => 'Probíhá převod...';

  @override
  String get cancel => 'Zrušit';

  @override
  String get fileTooLarge => 'Soubor je příliš velký';

  @override
  String get largeFileWarning =>
      'Detekován velký soubor. Konverze může snížit velikost obrázku pro stabilitu.';

  @override
  String get notEnoughMemory =>
      'Není dost paměti pro zpracování tohoto souboru. Zkuste menší obrázek nebo zavřete jiné aplikace.';

  @override
  String get memoryGuardTriggered =>
      'Soubor je na tomto zařízení příliš náročný pro bezpečný převod.';

  @override
  String get batchMemoryGuardTriggered =>
      'Bylo vybráno příliš mnoho náročných souborů najednou. Rozdělte dávku.';

  @override
  String get save => 'Uložit';

  @override
  String get saving => 'Ukládání...';

  @override
  String get saved => 'Uloženo';

  @override
  String get share => 'Sdílet';

  @override
  String get rename => 'Přejmenovat';

  @override
  String get renameOutput => 'Přejmenovat výstup';

  @override
  String get renameHint => 'Název souboru bez přípony';

  @override
  String get apply => 'Použít';

  @override
  String get dismiss => 'Zavřít';

  @override
  String get emptyStateHint => 'Klepněte + pro výběr z galerie nebo souborů';

  @override
  String get conversionFailed => 'Konverze selhala';

  @override
  String get batchConversionFailed => 'Dávková konverze selhala';

  @override
  String get saveFailed => 'Uložení se nezdařilo';

  @override
  String get pickFailed => 'Výběr obrázku se nezdařil';

  @override
  String get tapToPick => 'Klepněte pro výběr souboru';

  @override
  String get invalidOrCorruptImage =>
      'Soubor není platný obrázek nebo je poškozen.';

  @override
  String get invalidImageDimensions =>
      'Obrázek má neplatné rozměry (prázdné nebo nulové).';

  @override
  String get failedToDecodeHeic => 'Dekódování HEIC selhalo';

  @override
  String get failedToEncodeHeic => 'Kódování HEIC selhalo';

  @override
  String get previewNotAvailable => 'Náhled pro tento formát není dostupný';

  @override
  String get batchPreviewNoThumbnail => 'Žádná miniatura';

  @override
  String get batchPreviewWaiting => 'Miniatura po konverzi';

  @override
  String get failedToEncodeAvif => 'Kódování AVIF selhalo';

  @override
  String get formatPairNotSupported =>
      'Tato kombinace formátů není podporována';

  @override
  String get pdfRenderUnavailable => 'PDF nelze vykreslit na tomto zařízení';

  @override
  String get savePdfFailed => 'Uložení PDF selhalo';

  @override
  String get unsupportedInputFormat => 'Nepodporovaný vstupní formát';

  @override
  String get open => 'Otevřít';

  @override
  String get openFileFailed => 'Soubor nelze otevřít v jiné aplikaci';

  @override
  String get openFileUnavailableWeb =>
      'Otevírání souborů v jiné aplikaci není na webu dostupné';

  @override
  String get outputFileEmpty => 'Výstupní soubor je prázdný';

  @override
  String get outputEncodeRoundTripFailed =>
      'Výstupní soubor nebyl po uložení čitelný';

  @override
  String get toggleTheme => 'Přepnout motiv';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Nelze připravit dočasné pracovní úložiště pro tento soubor. Zkuste jiný zdroj nebo uvolněte místo.';

  @override
  String get conversionHintQuick => 'Obvykle trvá několik sekund.';

  @override
  String get conversionHintHeavy =>
      'Velký soubor — převod může trvat ~10–30 sekund.';

  @override
  String get conversionHintPdf =>
      'Export do PDF může trvat déle (~10–30 sekund).';

  @override
  String get batchReady => 'Dávková fronta je připravena';

  @override
  String get batchDone => 'Dávková konverze dokončena';

  @override
  String get noBatchFiles =>
      'Pro dávkovou konverzi nejsou vybrány žádné soubory';

  @override
  String get progressFiles => 'soubory';

  @override
  String get batchModeTitle => 'Dávková konverze';

  @override
  String get batchModeSubtitle =>
      'Vyberte cílový formát a poté převedete všechny soubory. Zobrazení jednoho souboru je v tomto režimu skryto.';

  @override
  String get batchSummaryTotal => 'Celkem';

  @override
  String get batchSummaryDone => 'Hotovo';

  @override
  String get batchSummaryFailed => 'Selhalo';

  @override
  String get batchSummaryQueued => 'Ve frontě';

  @override
  String get saveAllSuccessful => 'Vše uloženo úspěšně';

  @override
  String get batchSaveAllStarting => 'Ukládání souborů...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Ukládání $current/$total';
  }

  @override
  String get retryFailed => 'Zkusit znovu';

  @override
  String get clearCompleted => 'Vymazat dokončené';

  @override
  String get clearCompletedTooltip =>
      'Odstranit položky označené jako uložené z tohoto seznamu';

  @override
  String get clearBatchQueue => 'Vymazat frontu';

  @override
  String get batchStatusQueued => 'Ve frontě';

  @override
  String get batchStatusConverting => 'Převádí se';

  @override
  String get batchStatusDone => 'Hotovo';

  @override
  String get batchStatusFailed => 'Selhalo';

  @override
  String get batchStatusSaving => 'Ukládá se';

  @override
  String get batchStatusSaved => 'Uloženo';

  @override
  String get batchStatusCancelled => 'Zrušeno';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'Stáhnout';

  @override
  String get language => 'Jazyk';

  @override
  String get systemLanguage => 'Systémové výchozí';

  @override
  String get errorDialogTitle => 'Chyba';

  @override
  String get pickedFileCaption => 'Vybraný soubor';

  @override
  String get keepScreenOn => 'Zabránit vypnutí obrazovky';

  @override
  String get keepScreenOnTooltip =>
      'Zabrání vypnutí obrazovky zařízení, když je aplikace aktivní.';
}
