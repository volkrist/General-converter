import '../../models/image_format.dart';

/// Один служебный pre-shrink до тяжёлого decode/encode — не цепочка пользовательских форматов.
///
/// Keep blocked pairs minimal (см. [ConversionMatrix]).
abstract final class ConversionPolicy {
  static const int warningBytes = 10 * 1024 * 1024; // 10 MB
  static const int heavyBytes = 20 * 1024 * 1024; // 20 MB
  /// Исторический ориентир (50 MB); жёсткий отказ по размеру сейчас отключён — для проверок больших файлов.
  static const int hardLimitBytes = 50 * 1024 * 1024;

  static bool isWarningSize(int bytes) => bytes >= warningBytes;

  static bool isHeavyFile(int bytes) => bytes >= heavyBytes;

  /// Жёсткий лимит размера файла отключён (OOM на слабом железе всё ещё возможен).
  static bool isTooLarge(int bytes) => false;

  static bool shouldUsePreShrink({
    required int inputBytes,
    required ImageFormat inputFormat,
    required ImageFormat targetFormat,
  }) {
    if (inputBytes >= warningBytes) return true;

    if (inputFormat == ImageFormat.heic || inputFormat == ImageFormat.avif) {
      return true;
    }

    if (targetFormat == ImageFormat.png ||
        targetFormat == ImageFormat.tiff ||
        targetFormat == ImageFormat.pdf) {
      return true;
    }

    return false;
  }

  static int preShrinkLongSide({
    required int inputBytes,
    required ImageFormat inputFormat,
    required ImageFormat targetFormat,
  }) {
    if (targetFormat == ImageFormat.pdf) {
      if (inputBytes >= heavyBytes) return 1920;
      return 2048;
    }

    if (inputFormat == ImageFormat.heic && targetFormat == ImageFormat.png) {
      if (inputBytes >= heavyBytes) return 1600;
      if (inputBytes >= warningBytes) return 2048;
      return 2560;
    }

    if (inputFormat == ImageFormat.heic && targetFormat == ImageFormat.jpg) {
      if (inputBytes >= heavyBytes) return 2048;
      if (inputBytes >= warningBytes) return 2560;
      return 3072;
    }

    if (inputFormat == ImageFormat.avif && targetFormat == ImageFormat.png) {
      if (inputBytes >= heavyBytes) return 1600;
      return 2048;
    }

    if (inputFormat == ImageFormat.avif && targetFormat == ImageFormat.jpg) {
      if (inputBytes >= heavyBytes) return 1600;
      return 2048;
    }

    if (targetFormat == ImageFormat.png || targetFormat == ImageFormat.tiff) {
      if (inputBytes >= heavyBytes) return 1920;
      return 2560;
    }

    if (inputBytes >= heavyBytes) return 2048;
    return 3072;
  }
}
