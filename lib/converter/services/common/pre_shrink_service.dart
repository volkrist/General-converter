import 'dart:typed_data';

import '../../models/image_format.dart';
import 'conversion_policy.dart';
import 'image_pure_worker.dart';

/// Pre-shrink после decode в PNG (общий путь в памяти, в т.ч. Web).
abstract final class PreShrinkService {
  static Uint8List applyIfNeeded({
    required Uint8List pngBytes,
    required int inputFileLengthBytes,
    required ImageFormat inputFormat,
    required ImageFormat targetFormat,
  }) {
    if (!ConversionPolicy.shouldUsePreShrink(
      inputBytes: inputFileLengthBytes,
      inputFormat: inputFormat,
      targetFormat: targetFormat,
    )) {
      return pngBytes;
    }
    final longSide = ConversionPolicy.preShrinkLongSide(
      inputBytes: inputFileLengthBytes,
      inputFormat: inputFormat,
      targetFormat: targetFormat,
    );
    return workerDownscalePngMaxSide(pngBytes, longSide);
  }
}
