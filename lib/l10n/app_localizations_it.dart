// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'Convertitore Generico';

  @override
  String get pickImage => 'Seleziona file';

  @override
  String get pickFromGallery => 'Galleria';

  @override
  String get pickFromFiles => 'File';

  @override
  String get pickManyFiles => 'File in batch';

  @override
  String get pickFolder => 'Cartella';

  @override
  String get pickFileTitle => 'Scegli sorgente';

  @override
  String get targetFormat => 'Formato di destinazione';

  @override
  String get convert => 'Converti';

  @override
  String get convertBatch => 'Converti batch';

  @override
  String get converting => 'Conversione in corso...';

  @override
  String get cancel => 'Annulla';

  @override
  String get fileTooLarge => 'Il file è troppo grande';

  @override
  String get largeFileWarning =>
      'Rilevato un file di grandi dimensioni. La conversione potrebbe ridurre le dimensioni dell\'immagine per stabilità.';

  @override
  String get notEnoughMemory =>
      'Memoria insufficiente per elaborare questo file. Prova un\'immagine più piccola o chiudi altre app.';

  @override
  String get memoryGuardTriggered =>
      'Il file è troppo pesante per una conversione sicura su questo dispositivo.';

  @override
  String get batchMemoryGuardTriggered =>
      'Troppe file pesanti selezionate contemporaneamente. Dividi il batch.';

  @override
  String get save => 'Salva';

  @override
  String get saving => 'Salvataggio...';

  @override
  String get saved => 'Salvato';

  @override
  String get share => 'Condividi';

  @override
  String get rename => 'Rinomina';

  @override
  String get renameOutput => 'Rinomina output';

  @override
  String get renameHint => 'Nome file senza estensione';

  @override
  String get apply => 'Applica';

  @override
  String get dismiss => 'Chiudi';

  @override
  String get emptyStateHint => 'Tocca + per scegliere da galleria o file';

  @override
  String get conversionFailed => 'Conversione fallita';

  @override
  String get batchConversionFailed => 'Conversione batch fallita';

  @override
  String get saveFailed => 'Salvataggio fallito';

  @override
  String get pickFailed => 'Selezione fallita';

  @override
  String get tapToPick => 'Tocca per selezionare un file';

  @override
  String get invalidOrCorruptImage =>
      'Il file non è un\'immagine valida o sembra danneggiato.';

  @override
  String get invalidImageDimensions =>
      'L\'immagine ha dimensioni non valide (vuote o zero).';

  @override
  String get failedToDecodeHeic => 'Decodifica HEIC fallita';

  @override
  String get failedToEncodeHeic => 'Codifica HEIC fallita';

  @override
  String get previewNotAvailable =>
      'Anteprima non disponibile per questo formato';

  @override
  String get batchPreviewNoThumbnail => 'Nessuna miniatura';

  @override
  String get batchPreviewWaiting => 'Miniatura dopo la conversione';

  @override
  String get failedToEncodeAvif => 'Codifica AVIF fallita';

  @override
  String get formatPairNotSupported =>
      'Questa coppia di formati non è supportata';

  @override
  String get pdfRenderUnavailable =>
      'PDF non può essere renderizzato su questo dispositivo';

  @override
  String get savePdfFailed => 'Salvataggio PDF fallito';

  @override
  String get unsupportedInputFormat => 'Formato di input non supportato';

  @override
  String get open => 'Apri';

  @override
  String get openFileFailed => 'Impossibile aprire il file con un\'altra app';

  @override
  String get openFileUnavailableWeb =>
      'Aprire file in un\'altra app non è disponibile sul web';

  @override
  String get outputFileEmpty => 'Il file di output è vuoto';

  @override
  String get outputEncodeRoundTripFailed =>
      'Il file di output non era leggibile dopo il salvataggio';

  @override
  String get toggleTheme => 'Cambia tema';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Impossibile preparare uno spazio di lavoro temporaneo per questo file. Prova una fonte diversa o libera spazio.';

  @override
  String get conversionHintQuick => 'Di solito termina in pochi secondi.';

  @override
  String get conversionHintHeavy =>
      'File grande — la conversione può richiedere ~10–30 secondi.';

  @override
  String get conversionHintPdf =>
      'L\'esportazione PDF può richiedere più tempo (~10–30 secondi).';

  @override
  String get batchReady => 'Coda batch pronta';

  @override
  String get batchDone => 'Conversione batch completata';

  @override
  String get noBatchFiles => 'Nessun file selezionato per la conversione batch';

  @override
  String get progressFiles => 'file';

  @override
  String get batchModeTitle => 'Conversione batch';

  @override
  String get batchModeSubtitle =>
      'Scegli il formato di destinazione, poi converti tutti i file. La vista a singolo file è nascosta in questa modalità.';

  @override
  String get batchSummaryTotal => 'Totale';

  @override
  String get batchSummaryDone => 'Fatto';

  @override
  String get batchSummaryFailed => 'Fallito';

  @override
  String get batchSummaryQueued => 'In coda';

  @override
  String get saveAllSuccessful => 'Salvataggio di tutti riuscito';

  @override
  String get batchSaveAllStarting => 'Salvataggio file...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Salvataggio $current/$total';
  }

  @override
  String get retryFailed => 'Riprova';

  @override
  String get clearCompleted => 'Pulisci completati';

  @override
  String get clearCompletedTooltip =>
      'Rimuovi elementi contrassegnati come salvati da questo elenco';

  @override
  String get clearBatchQueue => 'Svuota coda';

  @override
  String get batchStatusQueued => 'In coda';

  @override
  String get batchStatusConverting => 'Conversione';

  @override
  String get batchStatusDone => 'Completato';

  @override
  String get batchStatusFailed => 'Fallito';

  @override
  String get batchStatusSaving => 'Salvataggio';

  @override
  String get batchStatusSaved => 'Salvato';

  @override
  String get batchStatusCancelled => 'Annullato';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'Scarica';

  @override
  String get language => 'Lingua';

  @override
  String get systemLanguage => 'Predefinito di sistema';

  @override
  String get errorDialogTitle => 'Errore';

  @override
  String get pickedFileCaption => 'File selezionato';

  @override
  String get keepScreenOn => 'Mantieni schermo acceso';

  @override
  String get keepScreenOnTooltip =>
      'Impedisci lo spegnimento del display del dispositivo mentre l\'app è attiva.';
}
