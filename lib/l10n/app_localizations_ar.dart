// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'محول عام';

  @override
  String get pickImage => 'اختيار ملف';

  @override
  String get pickFromGallery => 'المعرض';

  @override
  String get pickFromFiles => 'الملفات';

  @override
  String get pickManyFiles => 'اختيار عدة ملفات';

  @override
  String get pickFolder => 'مجلد';

  @override
  String get pickFileTitle => 'اختر المصدر';

  @override
  String get targetFormat => 'التنسيق المستهدف';

  @override
  String get convert => 'تحويل';

  @override
  String get convertBatch => 'تحويل الدفعة';

  @override
  String get converting => 'جارٍ التحويل...';

  @override
  String get cancel => 'إلغاء';

  @override
  String get fileTooLarge => 'حجم الملف كبير جدًا';

  @override
  String get largeFileWarning =>
      'تم الكشف عن ملف كبير. قد يقلل التحويل من حجم الصورة لضمان الاستقرار.';

  @override
  String get notEnoughMemory =>
      'ذاكرة غير كافية لمعالجة هذا الملف. جرّب صورة أصغر أو أغلق تطبيقات أخرى.';

  @override
  String get memoryGuardTriggered =>
      'الملف ثقيل جدًا لإجراء تحويل آمن على هذا الجهاز.';

  @override
  String get batchMemoryGuardTriggered =>
      'تم تحديد الكثير من الملفات الثقيلة دفعة واحدة. قم بتقسيم الدفعة إلى أجزاء أصغر.';

  @override
  String get save => 'حفظ';

  @override
  String get saving => 'جارٍ الحفظ...';

  @override
  String get saved => 'تم الحفظ';

  @override
  String get share => 'مشاركة';

  @override
  String get rename => 'إعادة تسمية';

  @override
  String get renameOutput => 'إعادة تسمية الناتج';

  @override
  String get renameHint => 'اسم الملف بدون الامتداد';

  @override
  String get apply => 'تطبيق';

  @override
  String get dismiss => 'إغلاق';

  @override
  String get emptyStateHint => 'اضغط + للاختيار من المعرض أو الملفات';

  @override
  String get conversionFailed => 'فشل التحويل';

  @override
  String get batchConversionFailed => 'فشل تحويل الدفعة';

  @override
  String get saveFailed => 'فشل الحفظ';

  @override
  String get pickFailed => 'فشل في اختيار الصورة';

  @override
  String get tapToPick => 'اضغط للاختيار';

  @override
  String get invalidOrCorruptImage => 'الملف ليس صورة صالحة أو يبدو تالفًا.';

  @override
  String get invalidImageDimensions =>
      'الصورة لها أبعاد غير صالحة (فارغة أو أبعاد صفرية).';

  @override
  String get failedToDecodeHeic => 'فشل فك ترميز HEIC';

  @override
  String get failedToEncodeHeic => 'فشل ترميز HEIC';

  @override
  String get previewNotAvailable => 'المعاينة غير متاحة لهذا التنسيق';

  @override
  String get batchPreviewNoThumbnail => 'لا توجد صورة مصغرة';

  @override
  String get batchPreviewWaiting => 'الصورة المصغرة بعد التحويل';

  @override
  String get failedToEncodeAvif => 'فشل ترميز AVIF';

  @override
  String get formatPairNotSupported => 'زوج التنسيقات هذا غير مدعوم';

  @override
  String get pdfRenderUnavailable => 'يتعذر عرض ملف PDF على هذا الجهاز';

  @override
  String get savePdfFailed => 'فشل حفظ ملف PDF';

  @override
  String get unsupportedInputFormat => 'تنسيق إدخال غير مدعوم';

  @override
  String get open => 'فتح';

  @override
  String get openFileFailed => 'تعذر فتح الملف بتطبيق آخر';

  @override
  String get openFileUnavailableWeb =>
      'فتح الملفات بتطبيق آخر غير متاح على الويب';

  @override
  String get outputFileEmpty => 'ملف الإخراج فارغ';

  @override
  String get outputEncodeRoundTripFailed =>
      'لم يكن ملف الإخراج قابلاً للقراءة بعد الحفظ';

  @override
  String get toggleTheme => 'تبديل النمط';

  @override
  String get policyPreShrinkNoWritableDir =>
      'لا يمكن إعداد مساحة عمل مؤقتة لهذا الملف. جرّب مصدرًا آخر أو حرّر مساحة التخزين.';

  @override
  String get conversionHintQuick => 'غالبًا ما ينتهي في غضون ثوانٍ قليلة.';

  @override
  String get conversionHintHeavy =>
      'ملف كبير — قد يستغرق التحويل حوالي 10–30 ثانية.';

  @override
  String get conversionHintPdf =>
      'تصدير PDF قد يستغرق وقتًا أطول (حوالي 10–30 ثانية).';

  @override
  String get batchReady => 'قائمة الدفعات جاهزة';

  @override
  String get batchDone => 'اكتمل تحويل الدفعة';

  @override
  String get noBatchFiles => 'لم يتم تحديد ملفات لتحويل الدُفعات';

  @override
  String get progressFiles => 'ملفات';

  @override
  String get batchModeTitle => 'تحويل دفعي';

  @override
  String get batchModeSubtitle =>
      'اختر التنسيق المستهدف ثم حوّل جميع الملفات. يتم إخفاء عرض الملف الواحد في هذا الوضع.';

  @override
  String get batchSummaryTotal => 'الإجمالي';

  @override
  String get batchSummaryDone => 'تم';

  @override
  String get batchSummaryFailed => 'فشل';

  @override
  String get batchSummaryQueued => 'قيد الانتظار';

  @override
  String get saveAllSuccessful => 'تم حفظ الكل بنجاح';

  @override
  String get batchSaveAllStarting => 'جارٍ حفظ الملفات...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'حفظ $current/$total';
  }

  @override
  String get retryFailed => 'إعادة المحاولة';

  @override
  String get clearCompleted => 'مسح المكتمل';

  @override
  String get clearCompletedTooltip =>
      'إزالة العناصر المميزة كمحفوظة من هذه القائمة';

  @override
  String get clearBatchQueue => 'مسح القائمة';

  @override
  String get batchStatusQueued => 'قيد الانتظار';

  @override
  String get batchStatusConverting => 'جارٍ التحويل';

  @override
  String get batchStatusDone => 'تم';

  @override
  String get batchStatusFailed => 'فشل';

  @override
  String get batchStatusSaving => 'جارٍ الحفظ';

  @override
  String get batchStatusSaved => 'تم الحفظ';

  @override
  String get batchStatusCancelled => 'أُلغي';

  @override
  String get appNameWebSuffix => '(الويب)';

  @override
  String get download => 'تنزيل';

  @override
  String get language => 'اللغة';

  @override
  String get systemLanguage => 'لغة النظام الافتراضية';

  @override
  String get errorDialogTitle => 'خطأ';

  @override
  String get pickedFileCaption => 'الملف المختار';

  @override
  String get keepScreenOn => 'منع إيقاف الشاشة';

  @override
  String get keepScreenOnTooltip =>
      'منع شاشة الجهاز من الإطفاء أثناء تشغيل التطبيق.';
}
