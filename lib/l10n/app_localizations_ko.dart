// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => '일반 변환기';

  @override
  String get pickImage => '파일 선택';

  @override
  String get pickFromGallery => '갤러리';

  @override
  String get pickFromFiles => '파일';

  @override
  String get pickManyFiles => '배치 파일';

  @override
  String get pickFolder => '폴더';

  @override
  String get pickFileTitle => '소스 선택';

  @override
  String get targetFormat => '대상 형식';

  @override
  String get convert => '변환';

  @override
  String get convertBatch => '배치 변환';

  @override
  String get converting => '변환 중...';

  @override
  String get cancel => '취소';

  @override
  String get fileTooLarge => '파일이 너무 큽니다';

  @override
  String get largeFileWarning =>
      '큰 파일이 감지되었습니다. 안정성을 위해 변환 중 이미지 크기가 줄어들 수 있습니다.';

  @override
  String get notEnoughMemory =>
      '이 파일을 처리할 메모리가 부족합니다. 더 작은 이미지를 시도하거나 다른 앱을 닫으십시오.';

  @override
  String get memoryGuardTriggered => '이 장치에서 안전하게 변환하기에는 파일이 너무 큽니다.';

  @override
  String get batchMemoryGuardTriggered =>
      '한 번에 너무 많은 무거운 파일이 선택되었습니다. 배치를 더 작은 부분으로 나누십시오.';

  @override
  String get save => '저장';

  @override
  String get saving => '저장 중...';

  @override
  String get saved => '저장됨';

  @override
  String get share => '공유';

  @override
  String get rename => '이름 변경';

  @override
  String get renameOutput => '출력 이름 변경';

  @override
  String get renameHint => '확장자가 없는 파일 이름';

  @override
  String get apply => '적용';

  @override
  String get dismiss => '닫기';

  @override
  String get emptyStateHint => '갤러리 또는 파일에서 선택하려면 +를 누르십시오';

  @override
  String get conversionFailed => '변환 실패';

  @override
  String get batchConversionFailed => '배치 변환 실패';

  @override
  String get saveFailed => '저장 실패';

  @override
  String get pickFailed => '선택 실패';

  @override
  String get tapToPick => '파일을 선택하려면 누르십시오';

  @override
  String get invalidOrCorruptImage => '파일이 유효한 이미지가 아니거나 손상된 것으로 보입니다.';

  @override
  String get invalidImageDimensions => '이미지 크기가 유효하지 않습니다 (비어 있거나 0).';

  @override
  String get failedToDecodeHeic => 'HEIC 디코딩 실패';

  @override
  String get failedToEncodeHeic => 'HEIC 인코딩 실패';

  @override
  String get previewNotAvailable => '이 형식에 대한 미리보기를 사용할 수 없습니다';

  @override
  String get batchPreviewNoThumbnail => '썸네일 없음';

  @override
  String get batchPreviewWaiting => '변환 후 썸네일';

  @override
  String get failedToEncodeAvif => 'AVIF 인코딩 실패';

  @override
  String get formatPairNotSupported => '이 형식 쌍은 지원되지 않습니다';

  @override
  String get pdfRenderUnavailable => '이 장치에서 PDF를 렌더링할 수 없습니다';

  @override
  String get savePdfFailed => 'PDF 저장 실패';

  @override
  String get unsupportedInputFormat => '지원되지 않는 입력 형식';

  @override
  String get open => '열기';

  @override
  String get openFileFailed => '다른 앱으로 파일을 열 수 없습니다';

  @override
  String get openFileUnavailableWeb => '웹에서는 다른 앱에서 파일을 열 수 없습니다';

  @override
  String get outputFileEmpty => '출력 파일이 비어 있습니다';

  @override
  String get outputEncodeRoundTripFailed => '저장 후 읽기 실패';

  @override
  String get toggleTheme => '테마 전환';

  @override
  String get policyPreShrinkNoWritableDir =>
      '이 파일에 대한 임시 작업 공간을 준비할 수 없습니다. 다른 소스나 자유로운 저장소를 시도하십시오.';

  @override
  String get conversionHintQuick => '보통 몇 초 안에 끝납니다.';

  @override
  String get conversionHintHeavy => '큰 파일 — 변환은 약 10~30초가 걸릴 수 있습니다.';

  @override
  String get conversionHintPdf => 'PDF 출력은 더 오래 걸릴 수 있습니다 (~10~30초).';

  @override
  String get batchReady => '배치 대기열이 준비됨';

  @override
  String get batchDone => '배치 변환 완료';

  @override
  String get noBatchFiles => '배치 변환에 파일이 없습니다';

  @override
  String get progressFiles => 'files';

  @override
  String get batchModeTitle => '배치 변환';

  @override
  String get batchModeSubtitle =>
      '대상 형식을 선택한 후 모든 파일을 변환합니다. 단일 파일 보기 모드는 이 모드에서 숨겨져 있습니다.';

  @override
  String get batchSummaryTotal => '총';

  @override
  String get batchSummaryDone => '완료';

  @override
  String get batchSummaryFailed => '실패';

  @override
  String get batchSummaryQueued => '대기열';

  @override
  String get saveAllSuccessful => '모든 파일 저장 성공';

  @override
  String get batchSaveAllStarting => '파일 저장 중...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Saving $current/$total';
  }

  @override
  String get retryFailed => 'Retry failed';

  @override
  String get clearCompleted => 'Clear completed';

  @override
  String get clearCompletedTooltip =>
      'Remove items marked as saved from this list';

  @override
  String get clearBatchQueue => 'Clear queue';

  @override
  String get batchStatusQueued => 'Queued';

  @override
  String get batchStatusConverting => 'Converting';

  @override
  String get batchStatusDone => 'Done';

  @override
  String get batchStatusFailed => 'Failed';

  @override
  String get batchStatusSaving => 'Saving';

  @override
  String get batchStatusSaved => 'Saved';

  @override
  String get batchStatusCancelled => 'Cancelled';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'Download';

  @override
  String get language => 'Language';

  @override
  String get systemLanguage => 'System default';

  @override
  String get errorDialogTitle => 'Error';

  @override
  String get pickedFileCaption => '선택한 파일';

  @override
  String get keepScreenOn => 'Keep screen on';

  @override
  String get keepScreenOnTooltip =>
      'Prevent the device display from turning off while the app is active.';
}
