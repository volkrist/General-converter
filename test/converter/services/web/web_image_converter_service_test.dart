import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:general_converter/converter/models/image_format.dart';
import 'package:general_converter/converter/services/web/web_image_converter_service.dart';
import 'package:image/image.dart' as img;

void main() {
  late WebImageConverterService service;

  setUp(() {
    service = WebImageConverterService();
  });

  Uint8List makePngBytes({int width = 100, int height = 100}) {
    final image = img.Image(width: width, height: height);
    final filled = img.fill(image, color: img.ColorRgb8(255, 0, 0));
    return Uint8List.fromList(img.encodePng(filled));
  }

  test('png -> jpg converts successfully', () async {
    final inputBytes = makePngBytes();

    final result = await service.convert(
      inputBytes: inputBytes,
      inputFileName: 'test.png',
      targetFormat: ImageFormat.jpg,
    );

    expect(result, isNotEmpty);

    final decoded = img.decodeJpg(result);
    expect(decoded, isNotNull);
    expect(decoded!.width, greaterThan(0));
    expect(decoded.height, greaterThan(0));
  });

  test('invalid bytes throw exception', () async {
    final badBytes = Uint8List.fromList([1, 2, 3, 4, 5]);

    await expectLater(
      service.convert(
        inputBytes: badBytes,
        inputFileName: 'test.png',
        targetFormat: ImageFormat.jpg,
      ),
      throwsA(anything),
    );
  });

  test('large image png -> jpg converts successfully', () async {
    final inputBytes = makePngBytes(width: 3000, height: 2000);

    final result = await service.convert(
      inputBytes: inputBytes,
      inputFileName: 'big.png',
      targetFormat: ImageFormat.jpg,
    );

    expect(result, isNotEmpty);

    final decoded = img.decodeJpg(result);
    expect(decoded, isNotNull);
  });
}
