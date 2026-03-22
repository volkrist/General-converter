import 'package:flutter_test/flutter_test.dart';
import 'package:general_converter/converter/services/common/conversion_matrix.dart';
import 'package:general_converter/converter/models/image_format.dart';

void main() {
  test('PDF → PDF blocked (same format)', () {
    expect(
      ConversionMatrix.isAllowed(input: ImageFormat.pdf, target: ImageFormat.pdf),
      isFalse,
    );
  });

  test('JPG → JPG blocked (same format)', () {
    expect(
      ConversionMatrix.isAllowed(input: ImageFormat.jpg, target: ImageFormat.jpg),
      isFalse,
    );
  });

  test('AVIF → PDF blocked', () {
    expect(
      ConversionMatrix.isAllowed(input: ImageFormat.avif, target: ImageFormat.pdf),
      isFalse,
    );
  });

  test('HEIC → TIFF allowed', () {
    expect(
      ConversionMatrix.isAllowed(input: ImageFormat.heic, target: ImageFormat.tiff),
      isTrue,
    );
  });

  test('HEIC → HEIC blocked', () {
    expect(
      ConversionMatrix.isAllowed(input: ImageFormat.heic, target: ImageFormat.heic),
      isFalse,
    );
  });

  test('HEIC → PDF blocked', () {
    expect(
      ConversionMatrix.isAllowed(input: ImageFormat.heic, target: ImageFormat.pdf),
      isFalse,
    );
  });

  test('AVIF → GIF blocked', () {
    expect(
      ConversionMatrix.isAllowed(input: ImageFormat.avif, target: ImageFormat.gif),
      isFalse,
    );
  });

  test('HEIC → JPG allowed', () {
    expect(
      ConversionMatrix.isAllowed(input: ImageFormat.heic, target: ImageFormat.jpg),
      isTrue,
    );
  });

  test('allowedOutputsFor excludes blocked targets', () {
    final forPdf = ConversionMatrix.allowedOutputsFor(ImageFormat.pdf);
    expect(forPdf, isNot(contains(ImageFormat.pdf)));
    expect(forPdf, contains(ImageFormat.png));
  });
}
