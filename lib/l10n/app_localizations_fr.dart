// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Convertisseur générique';

  @override
  String get pickImage => 'Choisir le fichier';

  @override
  String get pickFromGallery => 'Galerie';

  @override
  String get pickFromFiles => 'Fichiers';

  @override
  String get pickManyFiles => 'Fichiers par lot';

  @override
  String get pickFolder => 'Dossier';

  @override
  String get pickFileTitle => 'Choisir la source';

  @override
  String get targetFormat => 'Format cible';

  @override
  String get convert => 'Convertir';

  @override
  String get convertBatch => 'Convertir le lot';

  @override
  String get converting => 'Conversion...';

  @override
  String get cancel => 'Annuler';

  @override
  String get fileTooLarge => 'Le fichier est trop volumineux';

  @override
  String get largeFileWarning =>
      'Fichier volumineux détecté. La conversion peut réduire la taille de l\'image pour la stabilité.';

  @override
  String get notEnoughMemory =>
      'Pas assez de mémoire pour traiter ce fichier. Essayez une image plus petite ou fermez d\'autres applications.';

  @override
  String get memoryGuardTriggered =>
      'Le fichier est trop lourd pour une conversion sûre sur cet appareil.';

  @override
  String get batchMemoryGuardTriggered =>
      'Trop de fichiers lourds sélectionnés en même temps. Divisez le lot.';

  @override
  String get save => 'Enregistrer';

  @override
  String get saving => 'Enregistrement...';

  @override
  String get saved => 'Enregistré';

  @override
  String get share => 'Partager';

  @override
  String get rename => 'Renommer';

  @override
  String get renameOutput => 'Renommer la sortie';

  @override
  String get renameHint => 'Nom de fichier sans extension';

  @override
  String get apply => 'Appliquer';

  @override
  String get dismiss => 'Fermer';

  @override
  String get emptyStateHint =>
      'Appuyez sur + pour choisir depuis la galerie ou les fichiers';

  @override
  String get conversionFailed => 'La conversion a échoué';

  @override
  String get batchConversionFailed => 'La conversion par lot a échoué';

  @override
  String get saveFailed => 'Échec de l\'enregistrement';

  @override
  String get pickFailed => 'Échec de la sélection de l\'image';

  @override
  String get tapToPick => 'Appuyez pour choisir un fichier';

  @override
  String get invalidOrCorruptImage =>
      'Le fichier n\'est pas une image valide ou semble corrompu.';

  @override
  String get invalidImageDimensions =>
      'L\'image a des dimensions invalides (vide ou nulles).';

  @override
  String get failedToDecodeHeic => 'Échec du décodage HEIC';

  @override
  String get failedToEncodeHeic => 'Échec de l\'encodage HEIC';

  @override
  String get previewNotAvailable => 'Aperçu non disponible pour ce format';

  @override
  String get batchPreviewNoThumbnail => 'Pas de vignette';

  @override
  String get batchPreviewWaiting => 'Vignette après conversion';

  @override
  String get failedToEncodeAvif => 'Échec de l\'encodage AVIF';

  @override
  String get formatPairNotSupported =>
      'Cette paire de formats n\'est pas prise en charge';

  @override
  String get pdfRenderUnavailable =>
      'Le PDF n\'a pas pu être rendu sur cet appareil';

  @override
  String get savePdfFailed => 'Échec de l\'enregistrement du PDF';

  @override
  String get unsupportedInputFormat => 'Format d\'entrée non pris en charge';

  @override
  String get open => 'Ouvrir';

  @override
  String get openFileFailed =>
      'Impossible d\'ouvrir le fichier avec une autre application';

  @override
  String get openFileUnavailableWeb =>
      'Ouvrir des fichiers dans une autre application n\'est pas disponible sur le web';

  @override
  String get outputFileEmpty => 'Le fichier de sortie est vide';

  @override
  String get outputEncodeRoundTripFailed =>
      'Le fichier de sortie n\'était pas lisible après l\'enregistrement';

  @override
  String get toggleTheme => 'Basculer le thème';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Impossible de préparer un espace de travail temporaire pour ce fichier. Essayez une autre source ou libérez de l\'espace.';

  @override
  String get conversionHintQuick =>
      'Se termine généralement en quelques secondes.';

  @override
  String get conversionHintHeavy =>
      'Fichier volumineux — la conversion peut prendre ~10–30 secondes.';

  @override
  String get conversionHintPdf =>
      'L\'export PDF peut prendre plus de temps (~10–30 secondes).';

  @override
  String get batchReady => 'La file de lot est prête';

  @override
  String get batchDone => 'Conversion par lot terminée';

  @override
  String get noBatchFiles =>
      'Aucun fichier sélectionné pour la conversion par lot';

  @override
  String get progressFiles => 'fichiers';

  @override
  String get batchModeTitle => 'Conversion par lot';

  @override
  String get batchModeSubtitle =>
      'Choisissez le format cible, puis convertissez tous les fichiers. La vue fichier unique est masquée dans ce mode.';

  @override
  String get batchSummaryTotal => 'Total';

  @override
  String get batchSummaryDone => 'Terminé';

  @override
  String get batchSummaryFailed => 'Échoué';

  @override
  String get batchSummaryQueued => 'En file';

  @override
  String get saveAllSuccessful => 'Tout enregistré avec succès';

  @override
  String get batchSaveAllStarting => 'Enregistrement des fichiers...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Enregistrement $current/$total';
  }

  @override
  String get retryFailed => 'Réessayer';

  @override
  String get clearCompleted => 'Effacer les complétés';

  @override
  String get clearCompletedTooltip =>
      'Supprimez les éléments marqués comme enregistrés de cette liste';

  @override
  String get clearBatchQueue => 'Effacer la file';

  @override
  String get batchStatusQueued => 'En file';

  @override
  String get batchStatusConverting => 'Conversion';

  @override
  String get batchStatusDone => 'Terminé';

  @override
  String get batchStatusFailed => 'Échoué';

  @override
  String get batchStatusSaving => 'Enregistrement';

  @override
  String get batchStatusSaved => 'Enregistré';

  @override
  String get batchStatusCancelled => 'Annulé';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'Télécharger';

  @override
  String get language => 'Langue';

  @override
  String get systemLanguage => 'Par défaut du système';

  @override
  String get errorDialogTitle => 'Erreur';

  @override
  String get pickedFileCaption => 'Fichier choisi';

  @override
  String get keepScreenOn => 'Maintenir l\'écran allumé';

  @override
  String get keepScreenOnTooltip =>
      'Empêche l\'extinction de l\'écran pendant que l\'app est active.';
}
