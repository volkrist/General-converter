// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'Pengonversi Umum';

  @override
  String get pickImage => 'Pilih file';

  @override
  String get pickFromGallery => 'Galeri';

  @override
  String get pickFromFiles => 'Berkas';

  @override
  String get pickManyFiles => 'File batch';

  @override
  String get pickFolder => 'Folder';

  @override
  String get pickFileTitle => 'Pilih sumber';

  @override
  String get targetFormat => 'Format tujuan';

  @override
  String get convert => 'Konversi';

  @override
  String get convertBatch => 'Konversi batch';

  @override
  String get converting => 'Sedang mengonversi...';

  @override
  String get cancel => 'Batal';

  @override
  String get fileTooLarge => 'File terlalu besar';

  @override
  String get largeFileWarning =>
      'Terdeteksi file besar. Konversi mungkin mengurangi ukuran gambar demi stabilitas.';

  @override
  String get notEnoughMemory =>
      'Memori tidak cukup untuk memproses file ini. Coba gambar yang lebih kecil atau tutup aplikasi lain.';

  @override
  String get memoryGuardTriggered =>
      'File terlalu berat untuk konversi aman di perangkat ini.';

  @override
  String get batchMemoryGuardTriggered =>
      'Terlalu banyak file berat dipilih sekaligus. Bagi batch menjadi bagian yang lebih kecil.';

  @override
  String get save => 'Simpan';

  @override
  String get saving => 'Menyimpan...';

  @override
  String get saved => 'Tersimpan';

  @override
  String get share => 'Bagikan';

  @override
  String get rename => 'Ganti nama';

  @override
  String get renameOutput => 'Ganti nama keluaran';

  @override
  String get renameHint => 'Nama file tanpa ekstensi';

  @override
  String get apply => 'Terapkan';

  @override
  String get dismiss => 'Tutup';

  @override
  String get emptyStateHint => 'Ketuk + untuk memilih dari galeri atau berkas';

  @override
  String get conversionFailed => 'Konversi gagal';

  @override
  String get batchConversionFailed => 'Konversi batch gagal';

  @override
  String get saveFailed => 'Gagal menyimpan';

  @override
  String get pickFailed => 'Gagal memilih';

  @override
  String get tapToPick => 'Ketuk untuk memilih file';

  @override
  String get invalidOrCorruptImage =>
      'File bukan gambar yang valid atau tampak rusak.';

  @override
  String get invalidImageDimensions =>
      'Gambar memiliki ukuran tidak valid (kosong atau nol).';

  @override
  String get failedToDecodeHeic => 'Gagal mendekode HEIC';

  @override
  String get failedToEncodeHeic => 'Gagal mengenkripsi HEIC';

  @override
  String get previewNotAvailable => 'Pratinjau tidak tersedia untuk format ini';

  @override
  String get batchPreviewNoThumbnail => 'Tidak ada thumbnail';

  @override
  String get batchPreviewWaiting => 'Thumbnail setelah konversi';

  @override
  String get failedToEncodeAvif => 'Gagal mengenkripsi AVIF';

  @override
  String get formatPairNotSupported => 'Pasangan format ini tidak didukung';

  @override
  String get pdfRenderUnavailable =>
      'PDF tidak dapat dirender di perangkat ini';

  @override
  String get savePdfFailed => 'Gagal menyimpan PDF';

  @override
  String get unsupportedInputFormat => 'Format input tidak didukung';

  @override
  String get open => 'Buka';

  @override
  String get openFileFailed => 'Tidak dapat membuka file dengan aplikasi lain';

  @override
  String get openFileUnavailableWeb =>
      'Membuka file di aplikasi lain tidak tersedia di web';

  @override
  String get outputFileEmpty => 'File keluaran kosong';

  @override
  String get outputEncodeRoundTripFailed =>
      'File keluaran tidak dapat dibaca setelah disimpan';

  @override
  String get toggleTheme => 'Ubah tema';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Tidak dapat menyiapkan workspace sementara untuk file ini. Coba sumber lain atau kosongkan penyimpanan.';

  @override
  String get conversionHintQuick => 'Biasanya selesai dalam beberapa detik.';

  @override
  String get conversionHintHeavy =>
      'File besar — konversi mungkin memakan waktu ~10–30 detik.';

  @override
  String get conversionHintPdf =>
      'Ekspor PDF mungkin memakan waktu lebih lama (~10–30 detik).';

  @override
  String get batchReady => 'Antrian batch siap';

  @override
  String get batchDone => 'Konversi batch selesai';

  @override
  String get noBatchFiles => 'Tidak ada file yang dipilih untuk konversi batch';

  @override
  String get progressFiles => 'file';

  @override
  String get batchModeTitle => 'Konversi batch';

  @override
  String get batchModeSubtitle =>
      'Pilih format tujuan, lalu konversi semua file. Tampilan satu file disembunyikan dalam mode ini.';

  @override
  String get batchSummaryTotal => 'Total';

  @override
  String get batchSummaryDone => 'Selesai';

  @override
  String get batchSummaryFailed => 'Gagal';

  @override
  String get batchSummaryQueued => 'Dalam antrean';

  @override
  String get saveAllSuccessful => 'Semua berhasil disimpan';

  @override
  String get batchSaveAllStarting => 'Menyimpan file...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Menyimpan $current/$total';
  }

  @override
  String get retryFailed => 'Coba lagi';

  @override
  String get clearCompleted => 'Bersihkan selesai';

  @override
  String get clearCompletedTooltip =>
      'Hapus item yang ditandai sebagai tersimpan dari daftar ini';

  @override
  String get clearBatchQueue => 'Bersihkan antrean';

  @override
  String get batchStatusQueued => 'Dalam antrean';

  @override
  String get batchStatusConverting => 'Sedang mengonversi';

  @override
  String get batchStatusDone => 'Selesai';

  @override
  String get batchStatusFailed => 'Gagal';

  @override
  String get batchStatusSaving => 'Menyimpan';

  @override
  String get batchStatusSaved => 'Tersimpan';

  @override
  String get batchStatusCancelled => 'Dibatalkan';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'Unduh';

  @override
  String get language => 'Bahasa';

  @override
  String get systemLanguage => 'Default sistem';

  @override
  String get errorDialogTitle => 'Error';

  @override
  String get pickedFileCaption => 'File yang dipilih';

  @override
  String get keepScreenOn => 'Pertahankan layar menyala';

  @override
  String get keepScreenOnTooltip =>
      'Mencegah layar perangkat mati saat aplikasi aktif.';
}
