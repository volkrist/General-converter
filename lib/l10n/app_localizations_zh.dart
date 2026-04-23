// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => '通用转换器';

  @override
  String get pickImage => '选择文件';

  @override
  String get pickFromGallery => '图库';

  @override
  String get pickFromFiles => '文件';

  @override
  String get pickManyFiles => '批量文件';

  @override
  String get pickFolder => '文件夹';

  @override
  String get pickFileTitle => '选择来源';

  @override
  String get targetFormat => '目标格式';

  @override
  String get convert => '转换';

  @override
  String get convertBatch => '批量转换';

  @override
  String get converting => '正在转换...';

  @override
  String get cancel => '取消';

  @override
  String get fileTooLarge => '文件太大';

  @override
  String get largeFileWarning => '检测到大文件。为稳定性，转换可能会减小图像尺寸。';

  @override
  String get notEnoughMemory => '处理此文件的内存不足。请尝试更小的图像或关闭其他应用。';

  @override
  String get memoryGuardTriggered => '该文件对于在此设备上安全转换来说过大。';

  @override
  String get batchMemoryGuardTriggered => '一次选择了太多大文件。请将批次拆分为更小的部分。';

  @override
  String get save => '保存';

  @override
  String get saving => '保存中...';

  @override
  String get saved => '已保存';

  @override
  String get share => '分享';

  @override
  String get rename => '重命名';

  @override
  String get renameOutput => '重命名输出';

  @override
  String get renameHint => '不带扩展名的文件名';

  @override
  String get apply => '应用';

  @override
  String get dismiss => '关闭';

  @override
  String get emptyStateHint => '点击 + 从图库或文件中选择';

  @override
  String get conversionFailed => '转换失败';

  @override
  String get batchConversionFailed => '批量转换失败';

  @override
  String get saveFailed => '保存失败';

  @override
  String get pickFailed => '选择失败';

  @override
  String get tapToPick => '点击以选择文件';

  @override
  String get invalidOrCorruptImage => '该文件不是有效图像或似乎已损坏。';

  @override
  String get invalidImageDimensions => '图像尺寸无效（为空或为零）。';

  @override
  String get failedToDecodeHeic => 'HEIC 解码失败';

  @override
  String get failedToEncodeHeic => 'HEIC 编码失败';

  @override
  String get previewNotAvailable => '此格式的预览不可用';

  @override
  String get batchPreviewNoThumbnail => '无缩略图';

  @override
  String get batchPreviewWaiting => '转换后缩略图';

  @override
  String get failedToEncodeAvif => 'AVIF 编码失败';

  @override
  String get formatPairNotSupported => '此格式对不受支持';

  @override
  String get pdfRenderUnavailable => '此设备无法渲染 PDF';

  @override
  String get savePdfFailed => '保存 PDF 失败';

  @override
  String get unsupportedInputFormat => '不支持的输入格式';

  @override
  String get open => '打开';

  @override
  String get openFileFailed => '无法用其他应用打开文件';

  @override
  String get openFileUnavailableWeb => '在网络上无法在其他应用中打开文件';

  @override
  String get outputFileEmpty => '输出文件为空';

  @override
  String get outputEncodeRoundTripFailed => '保存后输出文件不可读';

  @override
  String get toggleTheme => '切换主题';

  @override
  String get policyPreShrinkNoWritableDir => '无法为此文件准备临时工作区。请尝试其他来源或释放存储空间。';

  @override
  String get conversionHintQuick => '通常在几秒内完成。';

  @override
  String get conversionHintHeavy => '大文件 — 转换可能需要约 10–30 秒。';

  @override
  String get conversionHintPdf => 'PDF 导出可能需要更长时间（约 10–30 秒）。';

  @override
  String get batchReady => '批处理队列已就绪';

  @override
  String get batchDone => '批量转换已完成';

  @override
  String get noBatchFiles => '未选择用于批量转换的文件';

  @override
  String get progressFiles => '文件';

  @override
  String get batchModeTitle => '批量转换';

  @override
  String get batchModeSubtitle => '选择目标格式，然后转换所有文件。此模式下隐藏单文件视图。';

  @override
  String get batchSummaryTotal => '总计';

  @override
  String get batchSummaryDone => '完成';

  @override
  String get batchSummaryFailed => '失败';

  @override
  String get batchSummaryQueued => '已排队';

  @override
  String get saveAllSuccessful => '全部保存成功';

  @override
  String get batchSaveAllStarting => '正在保存文件...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return '正在保存 $current/$total';
  }

  @override
  String get retryFailed => '重试失败';

  @override
  String get clearCompleted => '清除已完成';

  @override
  String get clearCompletedTooltip => '从此列表中移除标记为已保存的项目';

  @override
  String get clearBatchQueue => '清除队列';

  @override
  String get batchStatusQueued => '已排队';

  @override
  String get batchStatusConverting => '转换中';

  @override
  String get batchStatusDone => '完成';

  @override
  String get batchStatusFailed => '失败';

  @override
  String get batchStatusSaving => '保存中';

  @override
  String get batchStatusSaved => '已保存';

  @override
  String get batchStatusCancelled => '已取消';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => '下载';

  @override
  String get language => '语言';

  @override
  String get systemLanguage => '系统默认';

  @override
  String get errorDialogTitle => '错误';

  @override
  String get pickedFileCaption => '已选择的文件';

  @override
  String get keepScreenOn => '保持屏幕常亮';

  @override
  String get keepScreenOnTooltip => '在应用处于活动状态时阻止设备显示器关闭。';
}
