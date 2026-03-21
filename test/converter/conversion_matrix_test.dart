import 'package:flutter_test/flutter_test.dart';
import 'package:general_converter/converter/conversion_matrix.dart';
import 'package:general_converter/converter/models/image_format.dart';

void main() {
  test('PDF → PDF blocked', () {
    expect(
      ConversionMatrix.isAllowed(input: ImageFormat.pdf, target: ImageFormat.pdf),
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
