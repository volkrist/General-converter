import 'dart:typed_data';

import '../../models/image_format.dart';
import 'image_pure_worker.dart';

/// Нормализация рабочего PNG (память / размеры). Для PDF-источника пропускать.
abstract final class NormalizeService {
  static Uint8List applyUnlessPdfSource({
    required Uint8List pngBytes,
    required int sourceFileLengthBytes,
    required ImageFormat sourceFormat,
  }) {
    if (sourceFormat == ImageFormat.pdf) return pngBytes;
    return workerNormalizeWorkingPng(pngBytes, sourceFileLengthBytes);
  }
}
