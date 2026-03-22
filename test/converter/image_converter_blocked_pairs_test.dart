import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:general_converter/constants/app_strings.dart';
import 'package:general_converter/converter/models/image_format.dart';
import 'package:general_converter/converter/services/android/image_converter_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late ImageConverterService service;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('blocked_pairs_');
    service = ImageConverterService();
  });

  tearDown(() async {
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  test('blocked matrix pair fails before PDF decode', () async {
    final f = File('${tempDir.path}/x.pdf');
    await f.writeAsBytes(<int>[0x25, 0x50, 0x44, 0x46]); // %PDF

    await expectLater(
      service.convert(inputFile: f, targetFormat: ImageFormat.pdf),
      throwsA(
        isA<Exception>().having(
          (e) => e.toString(),
          'msg',
          contains(AppStrings.formatPairNotSupported),
        ),
      ),
    );
  });
}
