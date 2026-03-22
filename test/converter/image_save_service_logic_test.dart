import 'package:flutter_test/flutter_test.dart';
import 'package:general_converter/converter/models/image_format.dart';
import 'package:general_converter/converter/services/android/image_save_policy.dart';

void main() {
  test('JPG and PNG use gallery image API', () {
    expect(ImageSavePolicy.useGalleryImageApi(ImageFormat.jpg), isTrue);
    expect(ImageSavePolicy.useGalleryImageApi(ImageFormat.png), isTrue);
  });

  test('PDF, HEIC, AVIF, TIFF, WebP, GIF, BMP use file export', () {
    expect(ImageSavePolicy.useGalleryImageApi(ImageFormat.pdf), isFalse);
    expect(ImageSavePolicy.useGalleryImageApi(ImageFormat.heic), isFalse);
    expect(ImageSavePolicy.useGalleryImageApi(ImageFormat.avif), isFalse);
    expect(ImageSavePolicy.useGalleryImageApi(ImageFormat.tiff), isFalse);
    expect(ImageSavePolicy.useGalleryImageApi(ImageFormat.webp), isFalse);
    expect(ImageSavePolicy.useGalleryImageApi(ImageFormat.gif), isFalse);
    expect(ImageSavePolicy.useGalleryImageApi(ImageFormat.bmp), isFalse);
  });
}
