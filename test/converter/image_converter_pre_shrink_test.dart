import 'package:flutter_test/flutter_test.dart';
import 'package:general_converter/converter/models/image_format.dart';
import 'package:general_converter/converter/services/image_converter_service.dart';

void main() {
  test('pre-shrink applies for large raster, not PDF/AVIF', () {
    const big = 11 * 1024 * 1024;
    expect(
      ImageConverterService.preShrinkWouldApply(big, ImageFormat.jpg),
      isTrue,
    );
    expect(
      ImageConverterService.preShrinkWouldApply(big, ImageFormat.pdf),
      isFalse,
    );
    expect(
      ImageConverterService.preShrinkWouldApply(big, ImageFormat.avif),
      isFalse,
    );
    expect(
      ImageConverterService.preShrinkWouldApply(1024, ImageFormat.jpg),
      isFalse,
    );
  });
}
