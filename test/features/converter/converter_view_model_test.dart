import 'package:flutter_test/flutter_test.dart';

import 'package:general_converter/features/converter/domain/enums/image_format.dart';

void main() {
  group('ImageFormat.fromExtension', () {
    test('resolves jpg', () {
      expect(ImageFormat.fromExtension('jpg'), ImageFormat.jpg);
    });

    test('resolves jpeg alias to jpg', () {
      expect(ImageFormat.fromExtension('jpeg'), ImageFormat.jpg);
    });

    test('resolves png', () {
      expect(ImageFormat.fromExtension('png'), ImageFormat.png);
    });

    test('resolves tif alias to tiff', () {
      expect(ImageFormat.fromExtension('tif'), ImageFormat.tiff);
    });

    test('handles dot prefix', () {
      expect(ImageFormat.fromExtension('.webp'), ImageFormat.webp);
    });

    test('is case-insensitive', () {
      expect(ImageFormat.fromExtension('PNG'), ImageFormat.png);
      expect(ImageFormat.fromExtension('HEIC'), ImageFormat.heic);
    });

    test('returns null for unknown extension', () {
      expect(ImageFormat.fromExtension('xyz'), isNull);
    });
  });
}
