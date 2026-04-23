// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => '汎用コンバータ';

  @override
  String get pickImage => 'ファイルを選択';

  @override
  String get pickFromGallery => 'ギャラリー';

  @override
  String get pickFromFiles => 'ファイル';

  @override
  String get pickManyFiles => 'バッチファイル';

  @override
  String get pickFolder => 'フォルダ';

  @override
  String get pickFileTitle => 'ソースを選択';

  @override
  String get targetFormat => '出力形式';

  @override
  String get convert => '変換';

  @override
  String get convertBatch => '一括変換';

  @override
  String get converting => '変換中...';

  @override
  String get cancel => 'キャンセル';

  @override
  String get fileTooLarge => 'ファイルが大きすぎます';

  @override
  String get largeFileWarning =>
      '大きなファイルが検出されました。安定性のために変換で画像サイズが縮小される場合があります。';

  @override
  String get notEnoughMemory =>
      'このファイルを処理するのにメモリが不足しています。小さい画像を試すか他のアプリを閉じてください。';

  @override
  String get memoryGuardTriggered => 'このデバイスでは安全に変換するにはファイルが重すぎます。';

  @override
  String get batchMemoryGuardTriggered => '一度に重いファイルが多すぎます。バッチを分割してください。';

  @override
  String get save => '保存';

  @override
  String get saving => '保存中...';

  @override
  String get saved => '保存されました';

  @override
  String get share => '共有';

  @override
  String get rename => '名前を変更';

  @override
  String get renameOutput => '出力名を変更';

  @override
  String get renameHint => '拡張子を除いたファイル名';

  @override
  String get apply => '適用';

  @override
  String get dismiss => '閉じる';

  @override
  String get emptyStateHint => 'ギャラリーやファイルから選択するには + をタップしてください';

  @override
  String get conversionFailed => '変換に失敗しました';

  @override
  String get batchConversionFailed => '一括変換に失敗しました';

  @override
  String get saveFailed => '保存に失敗しました';

  @override
  String get pickFailed => '選択に失敗しました';

  @override
  String get tapToPick => '選択するにはタップしてください';

  @override
  String get invalidOrCorruptImage => 'ファイルは有効な画像ではないか、破損している可能性があります。';

  @override
  String get invalidImageDimensions => '画像のサイズが無効です（空またはゼロ）。';

  @override
  String get failedToDecodeHeic => 'HEIC のデコードに失敗しました';

  @override
  String get failedToEncodeHeic => 'HEIC のエンコードに失敗しました';

  @override
  String get previewNotAvailable => 'この形式のプレビューは利用できません';

  @override
  String get batchPreviewNoThumbnail => 'サムネイルなし';

  @override
  String get batchPreviewWaiting => '変換後のサムネイル';

  @override
  String get failedToEncodeAvif => 'AVIF のエンコードに失敗しました';

  @override
  String get formatPairNotSupported => 'この形式の組み合わせはサポートされていません';

  @override
  String get pdfRenderUnavailable => 'このデバイスでは PDF をレンダリングできません';

  @override
  String get savePdfFailed => 'PDF の保存に失敗しました';

  @override
  String get unsupportedInputFormat => 'サポートされていない入力形式';

  @override
  String get open => '開く';

  @override
  String get openFileFailed => '別のアプリでファイルを開けませんでした';

  @override
  String get openFileUnavailableWeb => 'ウェブでは別のアプリでファイルを開くことはできません';

  @override
  String get outputFileEmpty => '出力ファイルが空です';

  @override
  String get outputEncodeRoundTripFailed => '保存後に出力ファイルが読み取れませんでした';

  @override
  String get toggleTheme => 'テーマ切替';

  @override
  String get policyPreShrinkNoWritableDir =>
      'このファイルの一時作業領域を準備できません。別のソースを試すか、ストレージを空けてください。';

  @override
  String get conversionHintQuick => '通常数秒で完了します。';

  @override
  String get conversionHintHeavy => '大きなファイル — 変換に約10〜30秒かかる場合があります。';

  @override
  String get conversionHintPdf => 'PDF のエクスポートは時間がかかる場合があります（~10〜30秒）。';

  @override
  String get batchReady => 'バッチキューが準備できました';

  @override
  String get batchDone => 'バッチ変換が完了しました';

  @override
  String get noBatchFiles => 'バッチ変換のためにファイルが選択されていません';

  @override
  String get progressFiles => 'ファイル';

  @override
  String get batchModeTitle => 'バッチ変換';

  @override
  String get batchModeSubtitle =>
      '出力形式を選択し、すべてのファイルを変換します。このモードでは単一ファイルビューは非表示です。';

  @override
  String get batchSummaryTotal => '合計';

  @override
  String get batchSummaryDone => '完了';

  @override
  String get batchSummaryFailed => '失敗';

  @override
  String get batchSummaryQueued => 'キュー済み';

  @override
  String get saveAllSuccessful => 'すべて正常に保存されました';

  @override
  String get batchSaveAllStarting => 'ファイルを保存しています...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return '保存中 $current/$total';
  }

  @override
  String get retryFailed => '再試行';

  @override
  String get clearCompleted => '完了をクリア';

  @override
  String get clearCompletedTooltip => 'このリストから保存済みとしてマークされた項目を削除します';

  @override
  String get clearBatchQueue => 'キューをクリア';

  @override
  String get batchStatusQueued => 'キュー済み';

  @override
  String get batchStatusConverting => '変換中';

  @override
  String get batchStatusDone => '完了';

  @override
  String get batchStatusFailed => '失敗';

  @override
  String get batchStatusSaving => '保存中';

  @override
  String get batchStatusSaved => '保存済み';

  @override
  String get batchStatusCancelled => 'キャンセルされました';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'ダウンロード';

  @override
  String get language => '言語';

  @override
  String get systemLanguage => 'システムのデフォルト';

  @override
  String get errorDialogTitle => 'エラー';

  @override
  String get pickedFileCaption => '選択されたファイル';

  @override
  String get keepScreenOn => '画面をオンに保つ';

  @override
  String get keepScreenOnTooltip => 'アプリがアクティブな間、デバイスのディスプレイがオフになるのを防ぎます。';
}
