// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appName => 'Penukar Umum';

  @override
  String get pickImage => 'Pilih fail';

  @override
  String get pickFromGallery => 'Galeri';

  @override
  String get pickFromFiles => 'Fail';

  @override
  String get pickManyFiles => 'Fail batch';

  @override
  String get pickFolder => 'Folder';

  @override
  String get pickFileTitle => 'Pilih sumber';

  @override
  String get targetFormat => 'Format sasaran';

  @override
  String get convert => 'Tukar';

  @override
  String get convertBatch => 'Tukar batch';

  @override
  String get converting => 'Menukar...';

  @override
  String get cancel => 'Batal';

  @override
  String get fileTooLarge => 'Fail terlalu besar';

  @override
  String get largeFileWarning =>
      'Fail besar dikesan. Penukaran mungkin mengurangkan saiz imej untuk kestabilan.';

  @override
  String get notEnoughMemory =>
      'Memori tidak mencukupi untuk memproses fail ini. Cuba imej yang lebih kecil atau tutup aplikasi lain.';

  @override
  String get memoryGuardTriggered =>
      'Fail terlalu berat untuk penukaran selamat pada peranti ini.';

  @override
  String get batchMemoryGuardTriggered =>
      'Terlalu banyak fail berat dipilih sekaligus. Bahagikan batch kepada bahagian yang lebih kecil.';

  @override
  String get save => 'Simpan';

  @override
  String get saving => 'Menyimpan...';

  @override
  String get saved => 'Disimpan';

  @override
  String get share => 'Kongsi';

  @override
  String get rename => 'Tukar nama';

  @override
  String get renameOutput => 'Tukar nama output';

  @override
  String get renameHint => 'Nama fail tanpa sambungan';

  @override
  String get apply => 'Terapkan';

  @override
  String get dismiss => 'Tutup';

  @override
  String get emptyStateHint => 'Ketuk + untuk memilih dari galeri atau fail';

  @override
  String get conversionFailed => 'Penukaran gagal';

  @override
  String get batchConversionFailed => 'Penukaran batch gagal';

  @override
  String get saveFailed => 'Gagal menyimpan';

  @override
  String get pickFailed => 'Gagal memilih';

  @override
  String get tapToPick => 'Ketuk untuk memilih fail';

  @override
  String get invalidOrCorruptImage =>
      'Fail bukan imej yang sah atau kelihatan rosak.';

  @override
  String get invalidImageDimensions =>
      'Imej mempunyai saiz tidak sah (kosong atau sifar).';

  @override
  String get failedToDecodeHeic => 'Gagal menyahkod HEIC';

  @override
  String get failedToEncodeHeic => 'Gagal menyandikan HEIC';

  @override
  String get previewNotAvailable => 'Pratonton tidak tersedia untuk format ini';

  @override
  String get batchPreviewNoThumbnail => 'Tiada lakaran kecil';

  @override
  String get batchPreviewWaiting => 'Lakaran kecil selepas penukaran';

  @override
  String get failedToEncodeAvif => 'Gagal menyandikan AVIF';

  @override
  String get formatPairNotSupported => 'Pasangan format ini tidak disokong';

  @override
  String get pdfRenderUnavailable =>
      'PDF tidak dapat dipaparkan pada peranti ini';

  @override
  String get savePdfFailed => 'Gagal menyimpan PDF';

  @override
  String get unsupportedInputFormat => 'Format input tidak disokong';

  @override
  String get open => 'Buka';

  @override
  String get openFileFailed => 'Tidak dapat membuka fail dengan aplikasi lain';

  @override
  String get openFileUnavailableWeb =>
      'Membuka fail dalam aplikasi lain tidak tersedia di web';

  @override
  String get outputFileEmpty => 'Fail output kosong';

  @override
  String get outputEncodeRoundTripFailed =>
      'Fail output tidak dapat dibaca selepas menyimpan';

  @override
  String get toggleTheme => 'Toggle theme';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Tidak dapat menyediakan ruang sementara untuk fail ini. Cuba sumber lain atau ruang kosong.';

  @override
  String get conversionHintQuick => 'Biasanya selesai dalam beberapa saat.';

  @override
  String get conversionHintHeavy =>
      'Fail besar — penukaran mungkin memakan waktu ~10–30 saat.';

  @override
  String get conversionHintPdf =>
      'Paparan PDF mungkin memakan waktu lebih lama (~10–30 saat).';

  @override
  String get batchReady => 'Kumpulan batch siap';

  @override
  String get batchDone => 'Penukaran batch selesai';

  @override
  String get noBatchFiles => 'Tiada fail dipilih untuk penukaran batch';

  @override
  String get progressFiles => 'fail';

  @override
  String get batchModeTitle => 'Penukaran batch';

  @override
  String get batchModeSubtitle =>
      'Pilih format sasaran, lalu tukar semua fail. Tampilan fail tunggal tersembunyi dalam mod ini.';

  @override
  String get batchSummaryTotal => 'Total';

  @override
  String get batchSummaryDone => 'Selesai';

  @override
  String get batchSummaryFailed => 'Gagal';

  @override
  String get batchSummaryQueued => 'Queued';

  @override
  String get saveAllSuccessful => 'Simpan semua berjaya';

  @override
  String get batchSaveAllStarting => 'Menyimpan fail...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Menyimpan $current/$total';
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
  String get pickedFileCaption => 'Fail yang dipilih';

  @override
  String get keepScreenOn => 'Keep screen on';

  @override
  String get keepScreenOnTooltip =>
      'Prevent the device display from turning off while the app is active.';
}
