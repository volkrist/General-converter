import 'package:flutter_test/flutter_test.dart';

import 'package:general_converter/shared/utils/file_name_helper.dart';

void main() {
  group('FileNameHelper', () {
    test('replaceExtension swaps extension', () {
      expect(FileNameHelper.replaceExtension('photo.jpg', 'png'), 'photo.png');
    });

    test('replaceExtension handles no extension', () {
      expect(FileNameHelper.replaceExtension('photo', 'png'), 'photo.png');
    });

    test('extractExtension returns lowercase extension', () {
      expect(FileNameHelper.extractExtension('photo.JPG'), 'jpg');
    });

    test('extractExtension returns empty for no extension', () {
      expect(FileNameHelper.extractExtension('photo'), '');
    });

    test('extractBaseName returns filename from path', () {
      expect(FileNameHelper.extractBaseName('/storage/photos/pic.jpg'), 'pic.jpg');
    });

    test('extractBaseName handles backslashes', () {
      expect(FileNameHelper.extractBaseName('C:\\photos\\pic.jpg'), 'pic.jpg');
    });
  });
}
