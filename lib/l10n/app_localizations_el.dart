// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appName => 'Γενικός Μετατροπέας';

  @override
  String get pickImage => 'Επιλογή αρχείου';

  @override
  String get pickFromGallery => 'Συλλογή';

  @override
  String get pickFromFiles => 'Αρχεία';

  @override
  String get pickManyFiles => 'Αρχεία παρτίδας';

  @override
  String get pickFolder => 'Φάκελος';

  @override
  String get pickFileTitle => 'Επιλέξτε πηγή';

  @override
  String get targetFormat => 'Προορισμός μορφής';

  @override
  String get convert => 'Μετατροπή';

  @override
  String get convertBatch => 'Μετατροπή παρτίδας';

  @override
  String get converting => 'Γίνεται μετατροπή...';

  @override
  String get cancel => 'Άκυρο';

  @override
  String get fileTooLarge => 'Το αρχείο είναι πολύ μεγάλο';

  @override
  String get largeFileWarning =>
      'Εντοπίστηκε μεγάλο αρχείο. Η μετατροπή μπορεί να μειώσει το μέγεθος της εικόνας για σταθερότητα.';

  @override
  String get notEnoughMemory =>
      'Δεν υπάρχει αρκετή μνήμη για να επεξεργαστείτε αυτό το αρχείο. Δοκιμάστε μια μικρότερη εικόνα ή κλείστε άλλες εφαρμογές.';

  @override
  String get memoryGuardTriggered =>
      'Το αρχείο είναι πολύ βαρύ για ασφαλή μετατροπή σε αυτή τη συσκευή.';

  @override
  String get batchMemoryGuardTriggered =>
      'Επιλέχθηκαν πάρα πολλά βαριά αρχεία ταυτόχρονα. Διαχωρίστε την παρτίδα.';

  @override
  String get save => 'Αποθήκευση';

  @override
  String get saving => 'Αποθηκεύεται...';

  @override
  String get saved => 'Αποθηκεύτηκε';

  @override
  String get share => 'Κοινοποίηση';

  @override
  String get rename => 'Μετονομασία';

  @override
  String get renameOutput => 'Μετονομασία εξόδου';

  @override
  String get renameHint => 'Όνομα αρχείου χωρίς κατάληξη';

  @override
  String get apply => 'Εφαρμογή';

  @override
  String get dismiss => 'Κλείσιμο';

  @override
  String get emptyStateHint => 'Πατήστε + για επιλογή από συλλογή ή αρχεία';

  @override
  String get conversionFailed => 'Η μετατροπή απέτυχε';

  @override
  String get batchConversionFailed => 'Η παρτίδα μετατροπής απέτυχε';

  @override
  String get saveFailed => 'Αποτυχία αποθήκευσης';

  @override
  String get pickFailed => 'Αποτυχία επιλογής εικόνας';

  @override
  String get tapToPick => 'Πατήστε για επιλογή αρχείου';

  @override
  String get invalidOrCorruptImage =>
      'Το αρχείο δεν είναι έγκυρη εικόνα ή φαίνεται κατεστραμμένο.';

  @override
  String get invalidImageDimensions =>
      'Η εικόνα έχει μη έγκυρο μέγεθος (κενό ή μηδενικές διαστάσεις).';

  @override
  String get failedToDecodeHeic => 'Αποτυχία αποκωδικοποίησης HEIC';

  @override
  String get failedToEncodeHeic => 'Αποτυχία κωδικοποίησης HEIC';

  @override
  String get previewNotAvailable =>
      'Η προεπισκόπηση δεν είναι διαθέσιμη για αυτή τη μορφή';

  @override
  String get batchPreviewNoThumbnail => 'Χωρίς μικρογραφία';

  @override
  String get batchPreviewWaiting => 'Μικρογραφία μετά τη μετατροπή';

  @override
  String get failedToEncodeAvif => 'Αποτυχία κωδικοποίησης AVIF';

  @override
  String get formatPairNotSupported =>
      'Αυτό το ζεύγος μορφών δεν υποστηρίζεται';

  @override
  String get pdfRenderUnavailable =>
      'Το PDF δεν μπορεί να αποδοθεί σε αυτή τη συσκευή';

  @override
  String get savePdfFailed => 'Αποτυχία αποθήκευσης PDF';

  @override
  String get unsupportedInputFormat => 'Μη υποστηριζόμενη μορφή εισόδου';

  @override
  String get open => 'Άνοιγμα';

  @override
  String get openFileFailed => 'Αποτυχία ανοίγματος αρχείου με άλλη εφαρμογή';

  @override
  String get openFileUnavailableWeb =>
      'Το άνοιγμα αρχείων σε άλλη εφαρμογή δεν είναι διαθέσιμο στον web';

  @override
  String get outputFileEmpty => 'Το αρχείο εξόδου είναι κενό';

  @override
  String get outputEncodeRoundTripFailed =>
      'Το αρχείο εξόδου δεν ήταν αναγνώσιμο μετά την αποθήκευση';

  @override
  String get toggleTheme => 'Εναλλαγή θέματος';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Δεν είναι δυνατή η προετοιμασία προσωρινού χώρου εργασίας για αυτό το αρχείο. Δοκιμάστε άλλη πηγή ή ελευθερώστε χώρο.';

  @override
  String get conversionHintQuick =>
      'Συνήθως ολοκληρώνεται μέσα σε λίγα δευτερόλεπτα.';

  @override
  String get conversionHintHeavy =>
      'Μεγάλο αρχείο — η μετατροπή μπορεί να διαρκέσει ~10–30 δευτερόλεπτα.';

  @override
  String get conversionHintPdf =>
      'Η εξαγωγή σε PDF μπορεί να διαρκέσει περισσότερο (~10–30 δευτερόλεπτα).';

  @override
  String get batchReady => 'Η παρτίδα είναι έτοιμη';

  @override
  String get batchDone => 'Η παρτίδα ολοκληρώθηκε';

  @override
  String get noBatchFiles => 'Δεν επιλέχθηκαν αρχεία για παρτίδα';

  @override
  String get progressFiles => 'αρχεία';

  @override
  String get batchModeTitle => 'Μετατροπή παρτίδας';

  @override
  String get batchModeSubtitle =>
      'Επιλέξτε μορφή προορισμού και μετατρέψτε όλα τα αρχεία. Η προβολή μονής αρχείου αποκρύπτεται σε αυτή τη λειτουργία.';

  @override
  String get batchSummaryTotal => 'Σύνολο';

  @override
  String get batchSummaryDone => 'Ολοκληρώθηκε';

  @override
  String get batchSummaryFailed => 'Απέτυχε';

  @override
  String get batchSummaryQueued => 'Σε ουρά';

  @override
  String get saveAllSuccessful => 'Όλα αποθηκεύτηκαν επιτυχώς';

  @override
  String get batchSaveAllStarting => 'Αποθηκεύονται αρχεία...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Αποθήκευση $current/$total';
  }

  @override
  String get retryFailed => 'Δοκιμάστε ξανά';

  @override
  String get clearCompleted => 'Καθαρισμός ολοκληρωμένων';

  @override
  String get clearCompletedTooltip =>
      'Αφαιρέστε στοιχεία που έχουν επισημανθεί ως αποθηκευμένα από αυτήν τη λίστα';

  @override
  String get clearBatchQueue => 'Καθαρισμός ουράς';

  @override
  String get batchStatusQueued => 'Σε ουρά';

  @override
  String get batchStatusConverting => 'Μετατροπή';

  @override
  String get batchStatusDone => 'Ολοκληρώθηκε';

  @override
  String get batchStatusFailed => 'Απέτυχε';

  @override
  String get batchStatusSaving => 'Αποθήκευση';

  @override
  String get batchStatusSaved => 'Αποθηκεύτηκε';

  @override
  String get batchStatusCancelled => 'Ακυρώθηκε';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'Λήψη';

  @override
  String get language => 'Γλώσσα';

  @override
  String get systemLanguage => 'Προεπιλογή συστήματος';

  @override
  String get errorDialogTitle => 'Σφάλμα';

  @override
  String get pickedFileCaption => 'Επιλεγμένο αρχείο';

  @override
  String get keepScreenOn => 'Διατήρηση οθόνης ενεργής';

  @override
  String get keepScreenOnTooltip =>
      'Αποτρέψτε την απενεργοποίηση της οθόνης ενώ η εφαρμογή είναι ενεργή.';
}
