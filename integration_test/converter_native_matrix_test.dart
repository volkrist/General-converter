import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:image/image.dart' as img;

import 'package:general_converter/converter/models/image_format.dart';
import 'package:general_converter/converter/services/image_converter_service.dart';

import '../test/converter/synthetic_raster_files.dart';

/// Запуск **на Android** (телефон / эмулятор):
/// `flutter test integration_test/converter_native_matrix_test.dart -d <deviceId>`
///
/// На хосте Windows/macOS/Linux без `-d` тесты пропускаются: нативные WebP/HEIC
/// и часть AVIF проверяются только в Android-процессе.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final service = ImageConverterService();

  group('native output matrix (Android device)', () {
    late Directory tempDir;

    setUp(() async {
      tempDir = await Directory.systemTemp
          .createTemp('converter_matrix_native_');
    });

    tearDown(() async {
      if (await tempDir.exists()) {
        await tempDir.delete(recursive: true);
      }
    });

    for (final src in syntheticRasterFormats) {
      for (final tgt in ImageFormat.values) {
        testWidgets('$src -> $tgt', (tester) async {
          final input =
              await writeSyntheticRaster(dir: tempDir, format: src);
          try {
            final out = await service.convert(
              inputFile: input,
              targetFormat: tgt,
            );
            expect(await out.file.exists(), isTrue, reason: out.file.path);
            expect(out.format, tgt);
            final bytes = await out.file.readAsBytes();
            expect(bytes, isNotEmpty);
            // AVIF/WebP/HEIC бинарники — проверяем только размер; остальное — decode
            if (tgt == ImageFormat.jpg ||
                tgt == ImageFormat.png ||
                tgt == ImageFormat.gif ||
                tgt == ImageFormat.bmp ||
                tgt == ImageFormat.tiff) {
              expect(img.decodeImage(bytes), isNotNull);
            }
          } catch (e, st) {
            fail(
              '$src -> $tgt failed: $e\n'
              '(HEIC/WebP зависят от железа и API; AVIF — от libavif)\n$st',
            );
          }
        });
      }
    }
  }, skip: !Platform.isAndroid
      ? 'Только Android: flutter test integration_test/converter_native_matrix_test.dart -d <deviceId>'
      : null);
}
