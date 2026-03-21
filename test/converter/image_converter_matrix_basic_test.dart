import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

import 'package:general_converter/constants/app_strings.dart';
import 'package:general_converter/converter/models/image_format.dart';
import 'package:general_converter/converter/services/image_converter_service.dart';

import 'synthetic_raster_files.dart';

/// Матрица «чистого Dart»: decode + encode через пакет [image] (без WebP/HEIC/AVIF).
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late ImageConverterService service;

  setUp(() async {
    tempDir =
        await Directory.systemTemp.createTemp('converter_matrix_basic_');
    service = ImageConverterService();
  });

  tearDown(() async {
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  const basicTargets = <ImageFormat>[
    ImageFormat.jpg,
    ImageFormat.png,
    ImageFormat.gif,
    ImageFormat.bmp,
    ImageFormat.tiff,
  ];

  for (final src in syntheticRasterFormats) {
    for (final tgt in basicTargets) {
      test('convert synthetic $src -> $tgt', () async {
        final input = await writeSyntheticRaster(dir: tempDir, format: src);
        final out = await service.convert(
          inputFile: input,
          targetFormat: tgt,
        );

        expect(await out.file.exists(), isTrue);
        expect(
          out.file.path.toLowerCase().endsWith('.${tgt.extension}'),
          isTrue,
        );
        expect(out.format, tgt);

        final roundTrip = await out.file.readAsBytes();
        final decoded = img.decodeImage(roundTrip);
        expect(decoded, isNotNull);
        expect(decoded!.width, greaterThan(0));
        expect(decoded.height, greaterThan(0));
      });
    }
  }

  test('unknown extension throws', () async {
    final bad = File('${tempDir.path}${Platform.pathSeparator}x.unknownext');
    await bad.writeAsBytes([1, 2, 3]);
    expect(
      () => service.convert(
        inputFile: bad,
        targetFormat: ImageFormat.png,
      ),
      throwsA(
        isA<Exception>().having(
          (e) => e.toString(),
          'msg',
          contains(AppStrings.unsupportedInputFormat),
        ),
      ),
    );
  });
}
