// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appName => 'مبدل عمومی';

  @override
  String get pickImage => 'انتخاب فایل';

  @override
  String get pickFromGallery => 'گالری';

  @override
  String get pickFromFiles => 'فایل‌ها';

  @override
  String get pickManyFiles => 'فایل‌های دسته‌ای';

  @override
  String get pickFolder => 'پوشه';

  @override
  String get pickFileTitle => 'انتخاب منبع';

  @override
  String get targetFormat => 'فرمت هدف';

  @override
  String get convert => 'تبدیل';

  @override
  String get convertBatch => 'تبدیل دسته‌ای';

  @override
  String get converting => 'در حال تبدیل...';

  @override
  String get cancel => 'لغو';

  @override
  String get fileTooLarge => 'فایل بیش از حد بزرگ است';

  @override
  String get largeFileWarning =>
      'فایل بزرگی شناسایی شد. تبدیل ممکن است اندازه تصویر را برای پایداری کاهش دهد.';

  @override
  String get notEnoughMemory =>
      'حافظه کافی برای پردازش این فایل وجود ندارد. یک تصویر کوچکتر امتحان کنید یا برنامه‌های دیگر را ببندید.';

  @override
  String get memoryGuardTriggered =>
      'فایل برای تبدیل امن در این دستگاه بیش از حد سنگین است.';

  @override
  String get batchMemoryGuardTriggered =>
      'تعداد زیادی فایل سنگین هم‌زمان انتخاب شده‌اند. دسته را به قسمت‌های کوچکتر تقسیم کنید.';

  @override
  String get save => 'ذخیره';

  @override
  String get saving => 'در حال ذخیره...';

  @override
  String get saved => 'ذخیره شد';

  @override
  String get share => 'اشتراک‌گذاری';

  @override
  String get rename => 'تغییر نام';

  @override
  String get renameOutput => 'تغییر نام خروجی';

  @override
  String get renameHint => 'نام فایل بدون پسوند';

  @override
  String get apply => 'اعمال';

  @override
  String get dismiss => 'بستن';

  @override
  String get emptyStateHint => 'برای انتخاب از گالری یا فایل‌ها + را بزنید';

  @override
  String get conversionFailed => 'تبدیل ناموفق بود';

  @override
  String get batchConversionFailed => 'تبدیل دسته‌ای ناموفق بود';

  @override
  String get saveFailed => 'ذخیره ناموفق';

  @override
  String get pickFailed => 'انتخاب تصویر ناموفق بود';

  @override
  String get tapToPick => 'برای انتخاب فایل ضربه بزنید';

  @override
  String get invalidOrCorruptImage =>
      'فایل یک تصویر معتبر نیست یا به نظر می‌رسد خراب شده باشد.';

  @override
  String get invalidImageDimensions =>
      'تصویر ابعاد نامعتبری دارد (خالی یا صفر).';

  @override
  String get failedToDecodeHeic => 'رمزگشایی HEIC ناموفق بود';

  @override
  String get failedToEncodeHeic => 'رمزگذاری HEIC ناموفق بود';

  @override
  String get previewNotAvailable => 'پیشنمایش برای این فرمت در دسترس نیست';

  @override
  String get batchPreviewNoThumbnail => 'بدون تصاویر کوچک';

  @override
  String get batchPreviewWaiting => 'تصویر کوچک پس از تبدیل';

  @override
  String get failedToEncodeAvif => 'رمزگذاری AVIF ناموفق بود';

  @override
  String get formatPairNotSupported => 'این جفت فرمت پشتیبانی نمی‌شود';

  @override
  String get pdfRenderUnavailable => 'PDF در این دستگاه قابل رندر نیست';

  @override
  String get savePdfFailed => 'ذخیره PDF ناموفق بود';

  @override
  String get unsupportedInputFormat => 'فرمت ورودی پشتیبانی نمی‌شود';

  @override
  String get open => 'باز کردن';

  @override
  String get openFileFailed => 'امکان باز کردن فایل با برنامه دیگر وجود نداشت';

  @override
  String get openFileUnavailableWeb =>
      'باز کردن فایل‌ها در برنامه دیگر در وب امکان‌پذیر نیست';

  @override
  String get outputFileEmpty => 'فایل خروجی خالی است';

  @override
  String get outputEncodeRoundTripFailed =>
      'فایل خروجی پس از ذخیره قابل خواندن نبود';

  @override
  String get toggleTheme => 'تغییر پوسته';

  @override
  String get policyPreShrinkNoWritableDir =>
      'قادر به آماده‌سازی فضای کاری موقت برای این فایل نیستیم. منبع دیگری امتحان کنید یا فضای ذخیره‌سازی آزاد کنید.';

  @override
  String get conversionHintQuick => 'معمولاً در چند ثانیه تمام می‌شود.';

  @override
  String get conversionHintHeavy =>
      'فایل بزرگ — تبدیل ممکن است ~10–30 ثانیه طول بکشد.';

  @override
  String get conversionHintPdf =>
      'صادرات PDF ممکن است زمان بیشتری ببرد (~10–30 ثانیه).';

  @override
  String get batchReady => 'صف دسته آماده است';

  @override
  String get batchDone => 'تبدیل دسته کامل شد';

  @override
  String get noBatchFiles => 'هیچ فایلی برای تبدیل دسته‌ای انتخاب نشده است';

  @override
  String get progressFiles => 'فایل‌ها';

  @override
  String get batchModeTitle => 'تبدیل دسته‌ای';

  @override
  String get batchModeSubtitle =>
      'فرمت هدف را انتخاب کنید، سپس همه فایل‌ها را تبدیل کنید. نمای تک‌فایل در این حالت مخفی است.';

  @override
  String get batchSummaryTotal => 'مجموع';

  @override
  String get batchSummaryDone => 'انجام شد';

  @override
  String get batchSummaryFailed => 'ناموفق';

  @override
  String get batchSummaryQueued => 'در صف';

  @override
  String get saveAllSuccessful => 'همه با موفقیت ذخیره شدند';

  @override
  String get batchSaveAllStarting => 'در حال ذخیره فایل‌ها...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'در حال ذخیره $current/$total';
  }

  @override
  String get retryFailed => 'دوباره تلاش کن';

  @override
  String get clearCompleted => 'پاک کردن تکمیل‌شده‌ها';

  @override
  String get clearCompletedTooltip =>
      'حذف آیتم‌هایی که به عنوان ذخیره‌شده علامت‌گذاری شده‌اند از این فهرست';

  @override
  String get clearBatchQueue => 'پاک کردن صف';

  @override
  String get batchStatusQueued => 'در صف';

  @override
  String get batchStatusConverting => 'در حال تبدیل';

  @override
  String get batchStatusDone => 'انجام شد';

  @override
  String get batchStatusFailed => 'ناموفق';

  @override
  String get batchStatusSaving => 'در حال ذخیره';

  @override
  String get batchStatusSaved => 'ذخیره شد';

  @override
  String get batchStatusCancelled => 'لغو شد';

  @override
  String get appNameWebSuffix => '(وب)';

  @override
  String get download => 'دانلود';

  @override
  String get language => 'زبان';

  @override
  String get systemLanguage => 'پیش‌فرض سیستم';

  @override
  String get errorDialogTitle => 'خطا';

  @override
  String get pickedFileCaption => 'فایل انتخاب‌شده';

  @override
  String get keepScreenOn => 'روشن نگه داشتن صفحه';

  @override
  String get keepScreenOnTooltip =>
      'از خاموش شدن نمایشگر دستگاه در حالی که اپلیکیشن فعال است جلوگیری کنید.';
}
