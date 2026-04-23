// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'Bộ chuyển đổi tổng quát';

  @override
  String get pickImage => 'Chọn tệp';

  @override
  String get pickFromGallery => 'Thư viện';

  @override
  String get pickFromFiles => 'Tệp';

  @override
  String get pickManyFiles => 'Tệp hàng loạt';

  @override
  String get pickFolder => 'Thư mục';

  @override
  String get pickFileTitle => 'Chọn nguồn';

  @override
  String get targetFormat => 'Định dạng đích';

  @override
  String get convert => 'Chuyển đổi';

  @override
  String get convertBatch => 'Chuyển đổi hàng loạt';

  @override
  String get converting => 'Đang chuyển đổi...';

  @override
  String get cancel => 'Hủy';

  @override
  String get fileTooLarge => 'Tệp quá lớn';

  @override
  String get largeFileWarning =>
      'Phát hiện tệp lớn. Việc chuyển đổi có thể giảm kích thước ảnh để đảm bảo ổn định.';

  @override
  String get notEnoughMemory =>
      'Không đủ bộ nhớ để xử lý tệp này. Thử ảnh nhỏ hơn hoặc đóng các ứng dụng khác.';

  @override
  String get memoryGuardTriggered =>
      'Tệp quá nặng để chuyển đổi an toàn trên thiết bị này.';

  @override
  String get batchMemoryGuardTriggered =>
      'Chọn quá nhiều tệp nặng cùng lúc. Chia nhỏ lô.';

  @override
  String get save => 'Lưu';

  @override
  String get saving => 'Đang lưu...';

  @override
  String get saved => 'Đã lưu';

  @override
  String get share => 'Chia sẻ';

  @override
  String get rename => 'Đổi tên';

  @override
  String get renameOutput => 'Đổi tên đầu ra';

  @override
  String get renameHint => 'Tên tệp không có phần mở rộng';

  @override
  String get apply => 'Áp dụng';

  @override
  String get dismiss => 'Đóng';

  @override
  String get emptyStateHint => 'Chạm + để chọn từ thư viện hoặc tệp';

  @override
  String get conversionFailed => 'Chuyển đổi thất bại';

  @override
  String get batchConversionFailed => 'Chuyển đổi hàng loạt thất bại';

  @override
  String get saveFailed => 'Lưu thất bại';

  @override
  String get pickFailed => 'Chọn thất bại';

  @override
  String get tapToPick => 'Chạm để chọn tệp';

  @override
  String get invalidOrCorruptImage =>
      'Tệp không phải là hình ảnh hợp lệ hoặc có vẻ bị hỏng.';

  @override
  String get invalidImageDimensions =>
      'Hình ảnh có kích thước không hợp lệ (trống hoặc bằng không).';

  @override
  String get failedToDecodeHeic => 'Giải mã HEIC thất bại';

  @override
  String get failedToEncodeHeic => 'Mã hóa HEIC thất bại';

  @override
  String get previewNotAvailable =>
      'Xem trước không khả dụng cho định dạng này';

  @override
  String get batchPreviewNoThumbnail => 'Không có hình thu nhỏ';

  @override
  String get batchPreviewWaiting => 'Hình thu nhỏ sau khi chuyển đổi';

  @override
  String get failedToEncodeAvif => 'Mã hóa AVIF thất bại';

  @override
  String get formatPairNotSupported => 'Cặp định dạng này không được hỗ trợ';

  @override
  String get pdfRenderUnavailable => 'Không thể kết xuất PDF trên thiết bị này';

  @override
  String get savePdfFailed => 'Lưu PDF thất bại';

  @override
  String get unsupportedInputFormat => 'Định dạng đầu vào không được hỗ trợ';

  @override
  String get open => 'Mở';

  @override
  String get openFileFailed => 'Không thể mở tệp bằng ứng dụng khác';

  @override
  String get openFileUnavailableWeb =>
      'Mở tệp trong ứng dụng khác không có sẵn trên web';

  @override
  String get outputFileEmpty => 'Tệp đầu ra trống';

  @override
  String get outputEncodeRoundTripFailed =>
      'Tệp đầu ra không thể đọc được sau khi lưu';

  @override
  String get toggleTheme => 'Chuyển chủ đề';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Không thể chuẩn bị không gian làm việc tạm thời cho tệp này. Thử nguồn khác hoặc giải phóng bộ nhớ.';

  @override
  String get conversionHintQuick => 'Thường hoàn thành trong vài giây.';

  @override
  String get conversionHintHeavy =>
      'Tệp lớn — chuyển đổi có thể mất ~10–30 giây.';

  @override
  String get conversionHintPdf =>
      'Xuất PDF có thể mất nhiều thời gian hơn (~10–30 giây).';

  @override
  String get batchReady => 'Hàng đợi lô sẵn sàng';

  @override
  String get batchDone => 'Chuyển đổi hàng loạt hoàn tất';

  @override
  String get noBatchFiles => 'Không có tệp được chọn cho chuyển đổi hàng loạt';

  @override
  String get progressFiles => 'tệp';

  @override
  String get batchModeTitle => 'Chuyển đổi hàng loạt';

  @override
  String get batchModeSubtitle =>
      'Chọn định dạng đích, sau đó chuyển đổi tất cả tệp. Chế độ xem tệp đơn bị ẩn trong chế độ này.';

  @override
  String get batchSummaryTotal => 'Tổng';

  @override
  String get batchSummaryDone => 'Hoàn thành';

  @override
  String get batchSummaryFailed => 'Thất bại';

  @override
  String get batchSummaryQueued => 'Đang chờ';

  @override
  String get saveAllSuccessful => 'Lưu tất cả thành công';

  @override
  String get batchSaveAllStarting => 'Đang lưu tệp...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Đang lưu $current/$total';
  }

  @override
  String get retryFailed => 'Thử lại thất bại';

  @override
  String get clearCompleted => 'Xóa hoàn thành';

  @override
  String get clearCompletedTooltip =>
      'Xóa các mục được đánh dấu là đã lưu khỏi danh sách này';

  @override
  String get clearBatchQueue => 'Xóa hàng đợi';

  @override
  String get batchStatusQueued => 'Đang chờ';

  @override
  String get batchStatusConverting => 'Đang chuyển đổi';

  @override
  String get batchStatusDone => 'Hoàn thành';

  @override
  String get batchStatusFailed => 'Thất bại';

  @override
  String get batchStatusSaving => 'Đang lưu';

  @override
  String get batchStatusSaved => 'Đã lưu';

  @override
  String get batchStatusCancelled => 'Đã hủy';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'Tải xuống';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get systemLanguage => 'Mặc định hệ thống';

  @override
  String get errorDialogTitle => 'Lỗi';

  @override
  String get pickedFileCaption => 'Tệp đã chọn';

  @override
  String get keepScreenOn => 'Giữ màn hình sáng';

  @override
  String get keepScreenOnTooltip =>
      'Ngăn màn hình thiết bị tắt khi ứng dụng đang hoạt động.';
}
