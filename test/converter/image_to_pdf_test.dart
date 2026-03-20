import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:general_converter/converter/models/image_format.dart';
import 'package:general_converter/converter/services/image_converter_service.dart';

import 'synthetic_raster_files.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('synthetic PNG -> PDF (one page, valid PDF header)', () async {
    final dir = await Directory.systemTemp.createTemp('img2pdf_');
    addTearDown(() async {
      if (await dir.exists()) await dir.delete(recursive: true);
    });

    final png = await writeSyntheticRaster(dir: dir, format: ImageFormat.png);
    final out = await ImageConverterService().convert(
      inputFile: png,
      targetFormat: ImageFormat.pdf,
    );

    expect(out.format, ImageFormat.pdf);
    expect(out.file.path.toLowerCase().endsWith('.pdf'), isTrue);
    final bytes = await out.file.readAsBytes();
    expect(bytes.length, greaterThan(32));
    expect(String.fromCharCodes(bytes.take(4)), '%PDF');
  });
}
