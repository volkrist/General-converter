// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'সাধারণ কনভার্টার';

  @override
  String get pickImage => 'ফাইল নির্বাচন করুন';

  @override
  String get pickFromGallery => 'গ্যালারি';

  @override
  String get pickFromFiles => 'ফাইলসমূহ';

  @override
  String get pickManyFiles => 'ব্যাচ ফাইল';

  @override
  String get pickFolder => 'ফোল্ডার';

  @override
  String get pickFileTitle => 'উৎস নির্বাচন করুন';

  @override
  String get targetFormat => 'লক্ষ্য ফরম্যাট';

  @override
  String get convert => 'রূপান্তর';

  @override
  String get convertBatch => 'ব্যাচ রূপান্তর';

  @override
  String get converting => 'রূপান্তর করা হচ্ছে...';

  @override
  String get cancel => 'বাতিল';

  @override
  String get fileTooLarge => 'ফাইলটি খুব বড়';

  @override
  String get largeFileWarning =>
      'বড় ফাইল সনাক্ত হয়েছে। স্থিতিশীলতার জন্য রূপান্তর আকার কমাতে পারে।';

  @override
  String get notEnoughMemory =>
      'এই ফাইলটি প্রক্রিয়া করার জন্য পর্যাপ্ত মেমরি নেই। একটি ছোট ছবি চেষ্টা করুন বা অন্য অ্যাপ বন্ধ করুন।';

  @override
  String get memoryGuardTriggered =>
      'এই ডিভাইসে নিরাপদ রূপান্তরের জন্য ফাইলটি খুব ভারী।';

  @override
  String get batchMemoryGuardTriggered =>
      'একবারে অনেক ভারী ফাইল নির্বাচিত হয়েছে। ব্যাচ ভাগ করুন।';

  @override
  String get save => 'সংরক্ষণ';

  @override
  String get saving => 'সংরক্ষণ করা হচ্ছে...';

  @override
  String get saved => 'সংরক্ষিত';

  @override
  String get share => 'শেয়ার';

  @override
  String get rename => 'পুনঃনামকরণ';

  @override
  String get renameOutput => 'আউটপুটের নাম পরিবর্তন';

  @override
  String get renameHint => 'এক্সটেনশন ছাড়া ফাইলের নাম';

  @override
  String get apply => 'প্রয়োগ';

  @override
  String get dismiss => 'বন্ধ করুন';

  @override
  String get emptyStateHint => 'গ্যালারি বা ফাইল থেকে নির্বাচন করতে + চাপুন';

  @override
  String get conversionFailed => 'রূপান্তর ব্যর্থ হয়েছে';

  @override
  String get batchConversionFailed => 'ব্যাচ রূপান্তর ব্যর্থ হয়েছে';

  @override
  String get saveFailed => 'সংরক্ষণ ব্যর্থ হয়েছে';

  @override
  String get pickFailed => 'নির্বাচন ব্যর্থ হয়েছে';

  @override
  String get tapToPick => 'নির্বাচন করতে চাপুন';

  @override
  String get invalidOrCorruptImage =>
      'ফাইলটি বৈধ ছবি নয় বা ক্ষতিগ্রস্ত হতে পারে।';

  @override
  String get invalidImageDimensions => 'ছবির আকার অসঙ্গত (ফাঁকা বা শূন্য)।';

  @override
  String get failedToDecodeHeic => 'HEIC ডিকোড করতে ব্যর্থ';

  @override
  String get failedToEncodeHeic => 'HEIC এনকোড করতে ব্যর্থ';

  @override
  String get previewNotAvailable => 'এই ফরম্যাটের জন্য পূর্বরূপ উপলব্ধ নয়';

  @override
  String get batchPreviewNoThumbnail => 'কোন মোটা চিত্র নেই';

  @override
  String get batchPreviewWaiting => 'রূপান্তরের পরে থাম্বনেইল';

  @override
  String get failedToEncodeAvif => 'AVIF এনকোড করতে ব্যর্থ';

  @override
  String get formatPairNotSupported => 'এই ফরম্যাট জোড়া সমর্থিত নয়';

  @override
  String get pdfRenderUnavailable => 'এই ডিভাইসে PDF রেন্ডার করা যায় না';

  @override
  String get savePdfFailed => 'PDF সংরক্ষণ ব্যর্থ';

  @override
  String get unsupportedInputFormat => 'অসমর্থিত ইনপুট ফরম্যাট';

  @override
  String get open => 'খুলো';

  @override
  String get openFileFailed => 'অন্য অ্যাপে ফাইল খোলায় ব্যর্থ হয়েছে';

  @override
  String get openFileUnavailableWeb => 'ওয়েবে অন্য অ্যাপে ফাইল খোলা সম্ভব নয়';

  @override
  String get outputFileEmpty => 'আউটপুট ফাইল খালি';

  @override
  String get outputEncodeRoundTripFailed => 'সেভের পরে আউটপুট ফাইল পড়া যায়নি';

  @override
  String get toggleTheme => 'থিম পরিবর্তন';

  @override
  String get policyPreShrinkNoWritableDir =>
      'এই ফাইলের জন্য অস্থায়ী ওয়ার্কস্পেস প্রস্তুত করা যায় না। অন্য উৎস চেষ্টা করুন বা স্টোরেজ ফাঁকা করুন।';

  @override
  String get conversionHintQuick => 'সাধারণত কয়েক সেকেন্ডে শেষ হয়।';

  @override
  String get conversionHintHeavy =>
      'বড় ফাইল — রূপান্তর প্রায় 10–30 সেকেন্ড নিতে পারে।';

  @override
  String get conversionHintPdf =>
      'PDF রপ্তানি সময়সাপেক্ষ হতে পারে (~10–30 সেকেন্ড)।';

  @override
  String get batchReady => 'ব্যাচ কিউ প্রস্তুত';

  @override
  String get batchDone => 'ব্যাচ রূপান্তর সম্পন্ন';

  @override
  String get noBatchFiles => 'ব্যাচ রূপান্তরের জন্য ফাইল নির্বাচিত নেই';

  @override
  String get progressFiles => 'ফাইলসমূহ';

  @override
  String get batchModeTitle => 'ব্যাচ রূপান্তর';

  @override
  String get batchModeSubtitle =>
      'লক্ষ্য ফরম্যাট নির্বাচন করুন, তারপর সব ফাইল রূপান্তর করুন। একক ফাইল ভিউ এই মোডে লুকানো হয়।';

  @override
  String get batchSummaryTotal => 'মোট';

  @override
  String get batchSummaryDone => 'সম্পন্ন';

  @override
  String get batchSummaryFailed => 'ব্যর্থ';

  @override
  String get batchSummaryQueued => 'কিউতে';

  @override
  String get saveAllSuccessful => 'সবকিছু সফলভাবে সংরক্ষিত';

  @override
  String get batchSaveAllStarting => 'ফাইল সংরক্ষণ করা হচ্ছে...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'সংরক্ষণ $current/$total';
  }

  @override
  String get retryFailed => 'পুনরায় চেষ্টা করুন';

  @override
  String get clearCompleted => 'সম্পন্ন মুছুন';

  @override
  String get clearCompletedTooltip => 'এই তালিকা থেকে সংরক্ষিত আইটেমগুলি সরান';

  @override
  String get clearBatchQueue => 'কিউ পরিষ্কার করুন';

  @override
  String get batchStatusQueued => 'কিউতে';

  @override
  String get batchStatusConverting => 'রূপান্তর হচ্ছে';

  @override
  String get batchStatusDone => 'সম্পন্ন';

  @override
  String get batchStatusFailed => 'ব্যর্থ';

  @override
  String get batchStatusSaving => 'সংরক্ষণ হচ্ছে';

  @override
  String get batchStatusSaved => 'সংরক্ষিত';

  @override
  String get batchStatusCancelled => 'বাতিল';

  @override
  String get appNameWebSuffix => '(ওয়েব)';

  @override
  String get download => 'ডাউনলোড';

  @override
  String get language => 'ভাষা';

  @override
  String get systemLanguage => 'সিস্টেম ডিফল্ট';

  @override
  String get errorDialogTitle => 'ত্রুটি';

  @override
  String get pickedFileCaption => 'নির্বাচিত ফাইল';

  @override
  String get keepScreenOn => 'স্ক্রিন চালু রাখুন';

  @override
  String get keepScreenOnTooltip =>
      'অ্যাপ চলাকালে ডিভাইসের ডিসপ্লে বন্ধ হওয়া থেকে রোধ করুন।';
}
