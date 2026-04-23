// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appName => 'Ogólny Konwerter';

  @override
  String get pickImage => 'Wybierz plik';

  @override
  String get pickFromGallery => 'Galeria';

  @override
  String get pickFromFiles => 'Pliki';

  @override
  String get pickManyFiles => 'Pliki wsadowe';

  @override
  String get pickFolder => 'Folder';

  @override
  String get pickFileTitle => 'Wybierz źródło';

  @override
  String get targetFormat => 'Format docelowy';

  @override
  String get convert => 'Konwertuj';

  @override
  String get convertBatch => 'Konwertuj wsadowo';

  @override
  String get converting => 'Konwertowanie...';

  @override
  String get cancel => 'Anuluj';

  @override
  String get fileTooLarge => 'Plik jest za duży';

  @override
  String get largeFileWarning =>
      'Wykryto duży plik. Konwersja może zmniejszyć rozmiar obrazu dla stabilności.';

  @override
  String get notEnoughMemory =>
      'Za mało pamięci, aby przetworzyć ten plik. Spróbuj mniejszego obrazu lub zamknij inne aplikacje.';

  @override
  String get memoryGuardTriggered =>
      'Plik jest zbyt ciężki do bezpiecznej konwersji na tym urządzeniu.';

  @override
  String get batchMemoryGuardTriggered =>
      'Wybrano zbyt wiele ciężkich plików naraz. Podziel wsad na mniejsze części.';

  @override
  String get save => 'Zapisz';

  @override
  String get saving => 'Zapisywanie...';

  @override
  String get saved => 'Zapisano';

  @override
  String get share => 'Udostępnij';

  @override
  String get rename => 'Zmień nazwę';

  @override
  String get renameOutput => 'Zmień nazwę wyjścia';

  @override
  String get renameHint => 'Nazwa pliku bez rozszerzenia';

  @override
  String get apply => 'Zastosuj';

  @override
  String get dismiss => 'Zamknij';

  @override
  String get emptyStateHint => 'Dotknij +, aby wybrać z galerii lub plików';

  @override
  String get conversionFailed => 'Konwersja nie powiodła się';

  @override
  String get batchConversionFailed => 'Konwersja wsadowa nie powiodła się';

  @override
  String get saveFailed => 'Zapisywanie nie powiodło się';

  @override
  String get pickFailed => 'Wybór nie powiódł się';

  @override
  String get tapToPick => 'Dotknij, aby wybrać plik';

  @override
  String get invalidOrCorruptImage =>
      'Plik nie jest prawidłowym obrazem lub wydaje się uszkodzony.';

  @override
  String get invalidImageDimensions =>
      'Obraz ma nieprawidłowe wymiary (pusty lub zerowy).';

  @override
  String get failedToDecodeHeic => 'Nie udało się zdekodować HEIC';

  @override
  String get failedToEncodeHeic => 'Nie udało się zakodować HEIC';

  @override
  String get previewNotAvailable =>
      'Podgląd nie jest dostępny dla tego formatu';

  @override
  String get batchPreviewNoThumbnail => 'Brak miniatury';

  @override
  String get batchPreviewWaiting => 'Miniatura po konwersji';

  @override
  String get failedToEncodeAvif => 'Nie udało się zakodować AVIF';

  @override
  String get formatPairNotSupported => 'Ta para formatów nie jest obsługiwana';

  @override
  String get pdfRenderUnavailable =>
      'Nie można wyświetlić PDF na tym urządzeniu';

  @override
  String get savePdfFailed => 'Nie udało się zapisać PDF';

  @override
  String get unsupportedInputFormat => 'Nieobsługiwany format wejściowy';

  @override
  String get open => 'Otwórz';

  @override
  String get openFileFailed => 'Nie udało się otworzyć pliku w innej aplikacji';

  @override
  String get openFileUnavailableWeb =>
      'Otwieranie plików w innej aplikacji nie jest dostępne w sieci';

  @override
  String get outputFileEmpty => 'Plik wyjściowy jest pusty';

  @override
  String get outputEncodeRoundTripFailed =>
      'Plik wyjściowy był nieczytelny po zapisie';

  @override
  String get toggleTheme => 'Toggle theme';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Nie można przygotować miejsca tymczasowego dla tego pliku. Spróbuj innego źródła lub wolnego miejsca.';

  @override
  String get conversionHintQuick => 'Zazwyczaj kończy się w kilka sekund.';

  @override
  String get conversionHintHeavy =>
      'Duży plik — konwersja może trwać ~10–30 sekund.';

  @override
  String get conversionHintPdf =>
      'Eksport PDF może trwać dłużej (~10–30 sekund).';

  @override
  String get batchReady => 'Wsad jest gotowy';

  @override
  String get batchDone => 'Konwersja wsadowa zakończona';

  @override
  String get noBatchFiles => 'Brak plików do konwersji wsadowej';

  @override
  String get progressFiles => 'plików';

  @override
  String get batchModeTitle => 'Konwersja wsadowa';

  @override
  String get batchModeSubtitle =>
      'Wybierz format docelowy, potem przekonwertuj wszystkie pliki. Widok pojedynczego pliku jest ukryty w tym trybie.';

  @override
  String get batchSummaryTotal => 'Suma';

  @override
  String get batchSummaryDone => 'Zrobione';

  @override
  String get batchSummaryFailed => 'Nieudane';

  @override
  String get batchSummaryQueued => 'W kolejce';

  @override
  String get saveAllSuccessful => 'Zapisano wszystkie pliki';

  @override
  String get batchSaveAllStarting => 'Zapisywanie plików...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Zapisywanie $current/$total';
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
  String get pickedFileCaption => 'Wybrany plik';

  @override
  String get keepScreenOn => 'Keep screen on';

  @override
  String get keepScreenOnTooltip =>
      'Prevent the device display from turning off while the app is active.';
}
