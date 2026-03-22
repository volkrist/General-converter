import 'package:flutter_test/flutter_test.dart';
import 'package:general_converter/converter/models/image_format.dart';
import 'package:general_converter/converter/services/common/conversion_policy.dart';

void main() {
  test('shouldUsePreShrink for HEIC always', () {
    expect(
      ConversionPolicy.shouldUsePreShrink(
        inputBytes: 1024,
        inputFormat: ImageFormat.heic,
        targetFormat: ImageFormat.jpg,
      ),
      isTrue,
    );
  });

  test('preShrinkLongSide HEIC→PNG scales with size', () {
    expect(
      ConversionPolicy.preShrinkLongSide(
        inputBytes: 5 * 1024 * 1024,
        inputFormat: ImageFormat.heic,
        targetFormat: ImageFormat.png,
      ),
      2560,
    );
    expect(
      ConversionPolicy.preShrinkLongSide(
        inputBytes: 15 * 1024 * 1024,
        inputFormat: ImageFormat.heic,
        targetFormat: ImageFormat.png,
      ),
      2048,
    );
    expect(
      ConversionPolicy.preShrinkLongSide(
        inputBytes: 25 * 1024 * 1024,
        inputFormat: ImageFormat.heic,
        targetFormat: ImageFormat.png,
      ),
      1600,
    );
  });

  test('PDF target caps long side', () {
    expect(
      ConversionPolicy.preShrinkLongSide(
        inputBytes: 25 * 1024 * 1024,
        inputFormat: ImageFormat.heic,
        targetFormat: ImageFormat.pdf,
      ),
      1920,
    );
    expect(
      ConversionPolicy.preShrinkLongSide(
        inputBytes: 5 * 1024 * 1024,
        inputFormat: ImageFormat.jpg,
        targetFormat: ImageFormat.pdf,
      ),
      2048,
    );
  });

  test('isTooLarge disabled for large file testing', () {
    expect(ConversionPolicy.isTooLarge(ConversionPolicy.hardLimitBytes), isFalse);
    expect(ConversionPolicy.isTooLarge(200 * 1024 * 1024), isFalse);
  });
}
