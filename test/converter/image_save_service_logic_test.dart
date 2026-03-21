import 'package:flutter_test/flutter_test.dart';
import 'package:general_converter/converter/services/image_save_service.dart';

void main() {
  test('PDF always uses file-path API branch', () {
    expect(ImageSaveService.useFilePathApi('doc.pdf', 100), isTrue);
  });

  test('large non-PDF uses file-path API', () {
    expect(
      ImageSaveService.useFilePathApi('huge.jpg', 6 * 1024 * 1024),
      isTrue,
    );
  });

  test('small JPG uses saveImage branch', () {
    expect(ImageSaveService.useFilePathApi('a.jpg', 1024), isFalse);
  });
}
