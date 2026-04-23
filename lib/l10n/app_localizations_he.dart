// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appName => 'ממיר כללי';

  @override
  String get pickImage => 'בחר קובץ';

  @override
  String get pickFromGallery => 'גלריה';

  @override
  String get pickFromFiles => 'קבצים';

  @override
  String get pickManyFiles => 'קבצים באצווה';

  @override
  String get pickFolder => 'תיקייה';

  @override
  String get pickFileTitle => 'בחר מקור';

  @override
  String get targetFormat => 'פורמט יעד';

  @override
  String get convert => 'המר';

  @override
  String get convertBatch => 'המר אצווה';

  @override
  String get converting => 'ממירים...';

  @override
  String get cancel => 'ביטול';

  @override
  String get fileTooLarge => 'הקובץ גדול מדי';

  @override
  String get largeFileWarning =>
      'זוהה קובץ גדול. המרה עשויה להקטין את גודל התמונה לשם יציבות.';

  @override
  String get notEnoughMemory =>
      'אין מספיק זיכרון לעיבוד קובץ זה. נסה תמונה קטנה יותר או סגור אפליקציות אחרות.';

  @override
  String get memoryGuardTriggered => 'הקובץ כבד מדי להמרה בטוחה במכשיר זה.';

  @override
  String get batchMemoryGuardTriggered =>
      'נבחרו יותר מדי קבצים כבדים בבת אחת. חלק את האצווה לחלקים קטנים יותר.';

  @override
  String get save => 'שמור';

  @override
  String get saving => 'שומר...';

  @override
  String get saved => 'נשמר';

  @override
  String get share => 'שיתוף';

  @override
  String get rename => 'שנה שם';

  @override
  String get renameOutput => 'שינוי שם הפלט';

  @override
  String get renameHint => 'שם הקובץ ללא סיומת';

  @override
  String get apply => 'החל';

  @override
  String get dismiss => 'סגור';

  @override
  String get emptyStateHint => 'הקש + כדי לבחור מהגלריה או מהקבצים';

  @override
  String get conversionFailed => 'ההמרה נכשלה';

  @override
  String get batchConversionFailed => 'ההמרה באצווה נכשלה';

  @override
  String get saveFailed => 'השמירה נכשלה';

  @override
  String get pickFailed => 'הבחירה נכשלה';

  @override
  String get tapToPick => 'הקש כדי לבחור קובץ';

  @override
  String get invalidOrCorruptImage => 'הקובץ אינו תמונה תקינה או נראה פגום.';

  @override
  String get invalidImageDimensions =>
      'לתמונה יש ממדים לא חוקיים (ריקים או אפס).';

  @override
  String get failedToDecodeHeic => 'פענוח HEIC נכשל';

  @override
  String get failedToEncodeHeic => 'הצפנת HEIC נכשלה';

  @override
  String get previewNotAvailable => 'תצוגה מקדימה אינה זמינה לפורמט זה';

  @override
  String get batchPreviewNoThumbnail => 'אין תמונה ממוזערת';

  @override
  String get batchPreviewWaiting => 'תמונה ממוזערת לאחר ההמרה';

  @override
  String get failedToEncodeAvif => 'הצפנת AVIF נכשלה';

  @override
  String get formatPairNotSupported => 'צמד פורמטים זה אינו נתמך';

  @override
  String get pdfRenderUnavailable => 'לא ניתן לעבד PDF במכשיר זה';

  @override
  String get savePdfFailed => 'שמירת ה-PDF נכשלה';

  @override
  String get unsupportedInputFormat => 'פורמט קלט לא נתמך';

  @override
  String get open => 'פתח';

  @override
  String get openFileFailed => 'לא ניתן לפתוח קובץ באפליקציה אחרת';

  @override
  String get openFileUnavailableWeb =>
      'פתיחת קבצים באפליקציה אחרת אינה זמינה בווב';

  @override
  String get outputFileEmpty => 'קובץ הפלט ריק';

  @override
  String get outputEncodeRoundTripFailed => 'קובץ הפלט לא היה קריא לאחר השמירה';

  @override
  String get toggleTheme => 'החלף ערכת נושא';

  @override
  String get policyPreShrinkNoWritableDir =>
      'לא ניתן להכין סביבת עבודה זמנית עבור קובץ זה. נסה מקור אחר או שחרר מקום אחסון.';

  @override
  String get conversionHintQuick => 'בד\"רזית מסתיים תוך מספר שניות.';

  @override
  String get conversionHintHeavy =>
      'קובץ גדול — ההמרה עשויה לקחת ~10–30 שניות.';

  @override
  String get conversionHintPdf =>
      'ייצוא PDF עשוי לקחת יותר זמן (~10–30 שניות).';

  @override
  String get batchReady => 'תור האצווה מוכן';

  @override
  String get batchDone => 'המרת האצווה הושלמה';

  @override
  String get noBatchFiles => 'לא נבחרו קבצים להמרת אצווה';

  @override
  String get progressFiles => 'קבצים';

  @override
  String get batchModeTitle => 'המרת אצווה';

  @override
  String get batchModeSubtitle =>
      'בחר פורמט יעד ואז המיר את כל הקבצים. תצוגת הקובץ היחיד מוסתרת במצב זה.';

  @override
  String get batchSummaryTotal => 'סה\"כ';

  @override
  String get batchSummaryDone => 'הושלם';

  @override
  String get batchSummaryFailed => 'נכשל';

  @override
  String get batchSummaryQueued => 'בתור';

  @override
  String get saveAllSuccessful => 'הכל נשמר בהצלחה';

  @override
  String get batchSaveAllStarting => 'שומר את הקבצים...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'שומר $current/$total';
  }

  @override
  String get retryFailed => 'נסה שוב';

  @override
  String get clearCompleted => 'נקה את הושלם';

  @override
  String get clearCompletedTooltip => 'הסר פריטים שסומנו כנשמרים מרשימה זו';

  @override
  String get clearBatchQueue => 'נקה תור';

  @override
  String get batchStatusQueued => 'בתור';

  @override
  String get batchStatusConverting => 'ממירים';

  @override
  String get batchStatusDone => 'הושלם';

  @override
  String get batchStatusFailed => 'נכשל';

  @override
  String get batchStatusSaving => 'שומר';

  @override
  String get batchStatusSaved => 'נשמר';

  @override
  String get batchStatusCancelled => 'בוטל';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'הורד';

  @override
  String get language => 'שפה';

  @override
  String get systemLanguage => 'ברירת מחדל של המערכת';

  @override
  String get errorDialogTitle => 'שגיאה';

  @override
  String get pickedFileCaption => 'הקובץ שנבחר';

  @override
  String get keepScreenOn => 'השאר את המסך דולק';

  @override
  String get keepScreenOnTooltip => 'מנע כיבוי המסך בזמן שהאפליקציה פעילה.';
}
