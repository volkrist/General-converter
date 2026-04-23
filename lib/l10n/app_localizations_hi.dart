// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'जनरल कन्वर्टर';

  @override
  String get pickImage => 'फ़ाइल चुनें';

  @override
  String get pickFromGallery => 'गैलरी';

  @override
  String get pickFromFiles => 'फ़ाइलें';

  @override
  String get pickManyFiles => 'बैच फ़ाइलें';

  @override
  String get pickFolder => 'फ़ोल्डर';

  @override
  String get pickFileTitle => 'स्रोत चुनें';

  @override
  String get targetFormat => 'लक्ष्य फ़ॉर्मेट';

  @override
  String get convert => 'रूपांतरण';

  @override
  String get convertBatch => 'बैच रूपांतरण';

  @override
  String get converting => 'रूपांतरित हो रहा है...';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get fileTooLarge => 'फ़ाइल बहुत बड़ी है';

  @override
  String get largeFileWarning =>
      'बड़ी फ़ाइल मिली। स्थिरता के लिए रूपांतरण आकार कम कर सकता है।';

  @override
  String get notEnoughMemory =>
      'इस फ़ाइल को संसाधित करने के लिए पर्याप्त मेमोरी नहीं है। एक छोटी छवि आज़माएँ या अन्य ऐप बंद करें।';

  @override
  String get memoryGuardTriggered =>
      'इस डिवाइस पर सुरक्षित रूपांतरण के लिए फ़ाइल बहुत भारी है।';

  @override
  String get batchMemoryGuardTriggered =>
      'एक बार में बहुत सारी भारी फ़ाइलें चयनित हैं। बैच भाग करें।';

  @override
  String get save => 'सहेजें';

  @override
  String get saving => 'सहेजा जा रहा है...';

  @override
  String get saved => 'सहेजा गया';

  @override
  String get share => 'साझा करें';

  @override
  String get rename => 'नाम बदलें';

  @override
  String get renameOutput => 'आउटपुट का नाम बदलें';

  @override
  String get renameHint => 'एक्सटेंशन के बिना फ़ाइल का नाम';

  @override
  String get apply => 'लागू करें';

  @override
  String get dismiss => 'बंद करें';

  @override
  String get emptyStateHint => 'गैलरी या फ़ाइलों से चुनने के लिए + दबाएँ';

  @override
  String get conversionFailed => 'रूपांतरण विफल हुआ';

  @override
  String get batchConversionFailed => 'बैच रूपांतरण विफल हुआ';

  @override
  String get saveFailed => 'सहेजना विफल';

  @override
  String get pickFailed => 'चयन विफल हुआ';

  @override
  String get tapToPick => 'चयन करने के लिए टैप करें';

  @override
  String get invalidOrCorruptImage =>
      'फ़ाइल वैध छवि नहीं है या क्षतिग्रस्त लगती है।';

  @override
  String get invalidImageDimensions => 'छवि का आकार अमान्य है (खाली या शून्य)।';

  @override
  String get failedToDecodeHeic => 'HEIC डिकोड असफल हुआ';

  @override
  String get failedToEncodeHeic => 'HEIC एन्कोड असफल हुआ';

  @override
  String get previewNotAvailable =>
      'इस फ़ॉर्मेट के लिए पूर्वावलोकन उपलब्ध नहीं है';

  @override
  String get batchPreviewNoThumbnail => 'कोई थंबनेल नहीं';

  @override
  String get batchPreviewWaiting => 'रूपांतरण के बाद थंबनेल';

  @override
  String get failedToEncodeAvif => 'AVIF एन्कोड असफल हुआ';

  @override
  String get formatPairNotSupported => 'यह फॉर्मेट जोड़ा समर्थित नहीं है';

  @override
  String get pdfRenderUnavailable => 'इस डिवाइस पर PDF रेंडर नहीं किया जा सकता';

  @override
  String get savePdfFailed => 'PDF सहेजना विफल हुआ';

  @override
  String get unsupportedInputFormat => 'असमर्थित इनपुट फ़ॉर्मेट';

  @override
  String get open => 'खोलें';

  @override
  String get openFileFailed => 'किसी अन्य ऐप से फ़ाइल खोलना असफल हुआ';

  @override
  String get openFileUnavailableWeb =>
      'वेब पर किसी अन्य ऐप में फ़ाइल खोलना उपलब्ध नहीं है';

  @override
  String get outputFileEmpty => 'आउटपुट फ़ाइल खाली है';

  @override
  String get outputEncodeRoundTripFailed =>
      'सहेजने के बाद आउटपुट फ़ाइल पढ़ने योग्य नहीं थी';

  @override
  String get toggleTheme => 'थीम बदलें';

  @override
  String get policyPreShrinkNoWritableDir =>
      'इस फ़ाइल के लिए अस्थायी वर्कस्पेस तैयार नहीं किया जा सकता। किसी अन्य स्रोत का प्रयास करें या स्टोरेज खाली करें।';

  @override
  String get conversionHintQuick => 'आम तौर पर कुछ सेकंड में पूरा होता है।';

  @override
  String get conversionHintHeavy =>
      'बड़ी फ़ाइल — रूपांतरण में ~10–30 सेकंड लग सकते हैं।';

  @override
  String get conversionHintPdf =>
      'PDF निर्यात में अधिक समय लग सकता है (~10–30 सेकंड)।';

  @override
  String get batchReady => 'बैच क्यू तैयार है';

  @override
  String get batchDone => 'बैच रूपांतरण पूरा हुआ';

  @override
  String get noBatchFiles => 'बैच रूपांतरण के लिए कोई फ़ाइल चयनित नहीं है';

  @override
  String get progressFiles => 'फ़ाइलें';

  @override
  String get batchModeTitle => 'बैच रूपांतरण';

  @override
  String get batchModeSubtitle =>
      'लक्ष्य फ़ॉर्मेट चुनें, फिर सभी फ़ाइलों को रूपांतरित करें। इस मोड में एकल फ़ाइल दृश्य छिपा होता है।';

  @override
  String get batchSummaryTotal => 'कुल';

  @override
  String get batchSummaryDone => 'पूर्ण';

  @override
  String get batchSummaryFailed => 'विफल';

  @override
  String get batchSummaryQueued => 'क्यू में';

  @override
  String get saveAllSuccessful => 'सभी सफलतापूर्वक सहेजे गए';

  @override
  String get batchSaveAllStarting => 'फाइलें सहेजी जा रही हैं...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'सहेजा जा रहा है $current/$total';
  }

  @override
  String get retryFailed => 'फिर से प्रयास करें';

  @override
  String get clearCompleted => 'सम्पन्न साफ़ करें';

  @override
  String get clearCompletedTooltip => 'इस सूची से सहेजे गए आइटम निकालें';

  @override
  String get clearBatchQueue => 'क्यू साफ़ करें';

  @override
  String get batchStatusQueued => 'क्यू में';

  @override
  String get batchStatusConverting => 'रूपांतरण हो रहा है';

  @override
  String get batchStatusDone => 'पूर्ण';

  @override
  String get batchStatusFailed => 'विफल';

  @override
  String get batchStatusSaving => 'सहेजा जा रहा है';

  @override
  String get batchStatusSaved => 'सहेजा गया';

  @override
  String get batchStatusCancelled => 'रद्द किया गया';

  @override
  String get appNameWebSuffix => '(वेब)';

  @override
  String get download => 'डाउनलोड';

  @override
  String get language => 'भाषा';

  @override
  String get systemLanguage => 'सिस्टम डिफ़ॉल्ट';

  @override
  String get errorDialogTitle => 'त्रुटि';

  @override
  String get pickedFileCaption => 'चयनित फ़ाइल';

  @override
  String get keepScreenOn => 'स्क्रीन चालू रखें';

  @override
  String get keepScreenOnTooltip =>
      'ऐप सक्रिय रहने पर डिवाइस डिस्प्ले के बंद होने से रोकें।';
}
