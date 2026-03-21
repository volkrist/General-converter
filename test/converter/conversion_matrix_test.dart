import 'package:flutter_test/flutter_test.dart';
import 'package:general_converter/converter/conversion_matrix.dart';
import 'package:general_converter/converter/models/image_format.dart';

void main() {
  test('PDF → PDF blocked before any heavy work', () {
    expect(
      ConversionMatrix.isAllowed(ImageFormat.pdf, ImageFormat.pdf),
      isFalse,
    );
  });

  test('AVIF → PDF blocked', () {
    expect(
      ConversionMatrix.isAllowed(ImageFormat.avif, ImageFormat.pdf),
      isFalse,
    );
  });

  test('HEIC → JPG allowed', () {
    expect(
      ConversionMatrix.isAllowed(ImageFormat.heic, ImageFormat.jpg),
      isTrue,
    );
  });

  test('allowedOutputsFor excludes blocked targets', () {
    final forPdf = ConversionMatrix.allowedOutputsFor(ImageFormat.pdf);
    expect(forPdf, isNot(contains(ImageFormat.pdf)));
    expect(forPdf, contains(ImageFormat.png));
  });
}
