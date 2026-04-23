// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'Allgemeiner Konverter';

  @override
  String get pickImage => 'Datei auswählen';

  @override
  String get pickFromGallery => 'Galerie';

  @override
  String get pickFromFiles => 'Dateien';

  @override
  String get pickManyFiles => 'Stapeldateien';

  @override
  String get pickFolder => 'Ordner';

  @override
  String get pickFileTitle => 'Quelle wählen';

  @override
  String get targetFormat => 'Zielformat';

  @override
  String get convert => 'Konvertieren';

  @override
  String get convertBatch => 'Stapel konvertieren';

  @override
  String get converting => 'Konvertiere...';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get fileTooLarge => 'Datei ist zu groß';

  @override
  String get largeFileWarning =>
      'Große Datei erkannt. Die Konvertierung kann die Bildgröße zur Stabilität verringern.';

  @override
  String get notEnoughMemory =>
      'Nicht genügend Speicher, um diese Datei zu verarbeiten. Versuchen Sie ein kleineres Bild oder schließen Sie andere Apps.';

  @override
  String get memoryGuardTriggered =>
      'Datei ist zu groß für eine sichere Konvertierung auf diesem Gerät.';

  @override
  String get batchMemoryGuardTriggered =>
      'Zu viele große Dateien auf einmal ausgewählt. Teilen Sie den Stapel auf.';

  @override
  String get save => 'Speichern';

  @override
  String get saving => 'Speichere...';

  @override
  String get saved => 'Gespeichert';

  @override
  String get share => 'Teilen';

  @override
  String get rename => 'Umbenennen';

  @override
  String get renameOutput => 'Ausgabe umbenennen';

  @override
  String get renameHint => 'Dateiname ohne Erweiterung';

  @override
  String get apply => 'Anwenden';

  @override
  String get dismiss => 'Schließen';

  @override
  String get emptyStateHint =>
      'Tippen Sie +, um aus Galerie oder Dateien zu wählen';

  @override
  String get conversionFailed => 'Konvertierung fehlgeschlagen';

  @override
  String get batchConversionFailed => 'Stapelkonvertierung fehlgeschlagen';

  @override
  String get saveFailed => 'Speichern fehlgeschlagen';

  @override
  String get pickFailed => 'Auswahl des Bildes fehlgeschlagen';

  @override
  String get tapToPick => 'Tippen, um Datei auszuwählen';

  @override
  String get invalidOrCorruptImage =>
      'Die Datei ist kein gültiges Bild oder scheint beschädigt zu sein.';

  @override
  String get invalidImageDimensions =>
      'Das Bild hat ungültige Abmessungen (leer oder null).';

  @override
  String get failedToDecodeHeic => 'HEIC-Decodierung fehlgeschlagen';

  @override
  String get failedToEncodeHeic => 'HEIC-Kodierung fehlgeschlagen';

  @override
  String get previewNotAvailable =>
      'Vorschau für dieses Format nicht verfügbar';

  @override
  String get batchPreviewNoThumbnail => 'Keine Miniatur';

  @override
  String get batchPreviewWaiting => 'Miniatur nach Konvertierung';

  @override
  String get failedToEncodeAvif => 'AVIF-Kodierung fehlgeschlagen';

  @override
  String get formatPairNotSupported =>
      'Dieses Formatpaar wird nicht unterstützt';

  @override
  String get pdfRenderUnavailable =>
      'PDF kann auf diesem Gerät nicht gerendert werden';

  @override
  String get savePdfFailed => 'PDF speichern fehlgeschlagen';

  @override
  String get unsupportedInputFormat => 'Nicht unterstütztes Eingabeformat';

  @override
  String get open => 'Öffnen';

  @override
  String get openFileFailed =>
      'Datei konnte nicht mit einer anderen App geöffnet werden';

  @override
  String get openFileUnavailableWeb =>
      'Dateien in einer anderen App zu öffnen ist im Web nicht verfügbar';

  @override
  String get outputFileEmpty => 'Ausgabedatei ist leer';

  @override
  String get outputEncodeRoundTripFailed =>
      'Ausgabedatei war nach dem Speichern nicht lesbar';

  @override
  String get toggleTheme => 'Design wechseln';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Temporären Arbeitsbereich für diese Datei kann nicht vorbereitet werden. Versuchen Sie eine andere Quelle oder geben Sie Speicher frei.';

  @override
  String get conversionHintQuick => 'Dauert normalerweise nur wenige Sekunden.';

  @override
  String get conversionHintHeavy =>
      'Große Datei — Konvertierung kann ~10–30 Sekunden dauern.';

  @override
  String get conversionHintPdf =>
      'PDF-Export kann länger dauern (~10–30 Sekunden).';

  @override
  String get batchReady => 'Stapel-Warteschlange ist bereit';

  @override
  String get batchDone => 'Stapelkonvertierung abgeschlossen';

  @override
  String get noBatchFiles => 'Keine Dateien für Stapelkonvertierung ausgewählt';

  @override
  String get progressFiles => 'Dateien';

  @override
  String get batchModeTitle => 'Stapelkonvertierung';

  @override
  String get batchModeSubtitle =>
      'Wählen Sie das Zielformat und konvertieren Sie dann alle Dateien. Einzelansicht ist in diesem Modus ausgeblendet.';

  @override
  String get batchSummaryTotal => 'Insgesamt';

  @override
  String get batchSummaryDone => 'Fertig';

  @override
  String get batchSummaryFailed => 'Fehlgeschlagen';

  @override
  String get batchSummaryQueued => 'In Warteschlange';

  @override
  String get saveAllSuccessful => 'Alle erfolgreich gespeichert';

  @override
  String get batchSaveAllStarting => 'Speichere Dateien...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Speichere $current/$total';
  }

  @override
  String get retryFailed => 'Erneut versuchen';

  @override
  String get clearCompleted => 'Abgeschlossene löschen';

  @override
  String get clearCompletedTooltip =>
      'Entfernt als gespeichert markierte Elemente aus dieser Liste';

  @override
  String get clearBatchQueue => 'Warteschlange leeren';

  @override
  String get batchStatusQueued => 'In Warteschlange';

  @override
  String get batchStatusConverting => 'Konvertiere';

  @override
  String get batchStatusDone => 'Fertig';

  @override
  String get batchStatusFailed => 'Fehlgeschlagen';

  @override
  String get batchStatusSaving => 'Speichere';

  @override
  String get batchStatusSaved => 'Gespeichert';

  @override
  String get batchStatusCancelled => 'Abgebrochen';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'Herunterladen';

  @override
  String get language => 'Sprache';

  @override
  String get systemLanguage => 'Systemstandard';

  @override
  String get errorDialogTitle => 'Fehler';

  @override
  String get pickedFileCaption => 'Ausgewählte Datei';

  @override
  String get keepScreenOn => 'Bildschirm eingeschaltet lassen';

  @override
  String get keepScreenOnTooltip =>
      'Verhindert, dass das Display ausgeschaltet wird, während die App aktiv ist.';
}
