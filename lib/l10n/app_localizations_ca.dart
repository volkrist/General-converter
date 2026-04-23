// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appName => 'Convertidor genèric';

  @override
  String get pickImage => 'Selecciona fitxer';

  @override
  String get pickFromGallery => 'Galeria';

  @override
  String get pickFromFiles => 'Fitxers';

  @override
  String get pickManyFiles => 'Fitxers per lots';

  @override
  String get pickFolder => 'Carpeta';

  @override
  String get pickFileTitle => 'Tria la font';

  @override
  String get targetFormat => 'Format de destinació';

  @override
  String get convert => 'Convertir';

  @override
  String get convertBatch => 'Convertir lot';

  @override
  String get converting => 'Convertint...';

  @override
  String get cancel => 'Cancel·la';

  @override
  String get fileTooLarge => 'El fitxer és massa gran';

  @override
  String get largeFileWarning =>
      'S\'ha detectat un fitxer gran. La conversió pot reduir la mida per estabilitat.';

  @override
  String get notEnoughMemory =>
      'No hi ha prou memòria per processar aquest fitxer. Proveu una imatge més petita o tanqueu altres apps.';

  @override
  String get memoryGuardTriggered =>
      'El fitxer és massa pesat per fer una conversió segura en aquest dispositiu.';

  @override
  String get batchMemoryGuardTriggered =>
      'S\'han seleccionat massa fitxers pesats alhora. Separeu el lot en parts més petites.';

  @override
  String get save => 'Desa';

  @override
  String get saving => 'Desant...';

  @override
  String get saved => 'Desat';

  @override
  String get share => 'Comparteix';

  @override
  String get rename => 'Canvia nom';

  @override
  String get renameOutput => 'Canvia nom de la sortida';

  @override
  String get renameHint => 'Nom del fitxer sense extensió';

  @override
  String get apply => 'Aplica';

  @override
  String get dismiss => 'Tanca';

  @override
  String get emptyStateHint => 'Prem + per seleccionar de la galeria o fitxers';

  @override
  String get conversionFailed => 'La conversió ha fallat';

  @override
  String get batchConversionFailed => 'La conversió per lots ha fallat';

  @override
  String get saveFailed => 'Error en desar';

  @override
  String get pickFailed => 'No s\'ha pogut seleccionar la imatge';

  @override
  String get tapToPick => 'Toca per seleccionar un fitxer';

  @override
  String get invalidOrCorruptImage =>
      'El fitxer no és una imatge vàlida o sembla estar danyat.';

  @override
  String get invalidImageDimensions =>
      'La imatge té mides no vàlides (buida o amb dimensions zero).';

  @override
  String get failedToDecodeHeic => 'Error en decodificar HEIC';

  @override
  String get failedToEncodeHeic => 'Error en codificar HEIC';

  @override
  String get previewNotAvailable =>
      'La vista prèvia no està disponible per a aquest format';

  @override
  String get batchPreviewNoThumbnail => 'Sense miniatura';

  @override
  String get batchPreviewWaiting => 'Miniatura després de la conversió';

  @override
  String get failedToEncodeAvif => 'Error en codificar AVIF';

  @override
  String get formatPairNotSupported =>
      'Aquesta parella de formats no està suportada';

  @override
  String get pdfRenderUnavailable =>
      'No es pot renderitzar PDF en aquest dispositiu';

  @override
  String get savePdfFailed => 'Error en desar PDF';

  @override
  String get unsupportedInputFormat => 'Format d\'entrada no suportat';

  @override
  String get open => 'Obre';

  @override
  String get openFileFailed =>
      'No s\'ha pogut obrir el fitxer amb una altra app';

  @override
  String get openFileUnavailableWeb =>
      'Obrir fitxers en una altra app no està disponible a la web';

  @override
  String get outputFileEmpty => 'El fitxer de sortida està buit';

  @override
  String get outputEncodeRoundTripFailed =>
      'El fitxer de sortida no es podia llegir després de desar';

  @override
  String get toggleTheme => 'Canvia tema';

  @override
  String get policyPreShrinkNoWritableDir =>
      'No es pot preparar un espai de treball temporal per a aquest fitxer. Proveu una altra font o allibereu espai d\'emmagatzematge.';

  @override
  String get conversionHintQuick => 'Normalment acaba en pocs segons.';

  @override
  String get conversionHintHeavy =>
      'Fitxer gran — la conversió pot trigar ~10–30 segons.';

  @override
  String get conversionHintPdf =>
      'L\'exportació a PDF pot trigar més (~10–30 segons).';

  @override
  String get batchReady => 'La cua del lot està preparada';

  @override
  String get batchDone => 'Conversió per lots completada';

  @override
  String get noBatchFiles =>
      'No s\'han seleccionat fitxers per a la conversió per lots';

  @override
  String get progressFiles => 'fitxers';

  @override
  String get batchModeTitle => 'Conversió per lots';

  @override
  String get batchModeSubtitle =>
      'Trieu el format de destinació i després convertiu tots els fitxers. La vista d\'un sol fitxer està oculta en aquest mode.';

  @override
  String get batchSummaryTotal => 'Total';

  @override
  String get batchSummaryDone => 'Fet';

  @override
  String get batchSummaryFailed => 'Fallit';

  @override
  String get batchSummaryQueued => 'A la cua';

  @override
  String get saveAllSuccessful => 'Tot desat correctament';

  @override
  String get batchSaveAllStarting => 'Desant fitxers...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Desant $current/$total';
  }

  @override
  String get retryFailed => 'Torna a intentar';

  @override
  String get clearCompleted => 'Neteja completats';

  @override
  String get clearCompletedTooltip =>
      'Elimina els elements marcats com a desats d\'aquesta llista';

  @override
  String get clearBatchQueue => 'Neteja la cua';

  @override
  String get batchStatusQueued => 'A la cua';

  @override
  String get batchStatusConverting => 'Convertint';

  @override
  String get batchStatusDone => 'Fet';

  @override
  String get batchStatusFailed => 'Fallit';

  @override
  String get batchStatusSaving => 'Desant';

  @override
  String get batchStatusSaved => 'Desat';

  @override
  String get batchStatusCancelled => 'Cancel·lat';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'Descarrega';

  @override
  String get language => 'Idioma';

  @override
  String get systemLanguage => 'Per defecte del sistema';

  @override
  String get errorDialogTitle => 'Error';

  @override
  String get pickedFileCaption => 'Fitxer seleccionat';

  @override
  String get keepScreenOn => 'Mantenir pantalla activa';

  @override
  String get keepScreenOnTooltip =>
      'Evita que la pantalla s\'apagui mentre l\'aplicació està activa.';
}
