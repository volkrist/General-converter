import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

import 'package:general_converter/constants/app_strings.dart';
import 'package:general_converter/converter/converter_capabilities.dart';
import 'package:general_converter/converter/models/image_format.dart';
import 'package:general_converter/converter/services/android/image_converter_service.dart';
import 'package:general_converter/converter/services/common/conversion_matrix.dart';

import 'synthetic_raster_files.dart';

/// Полная матрица **поддерживаемых** пар вход → выход.
///
/// Для каждой пары ниже:
/// 1. Если пара явно запрещена матрицей ([ConversionMatrix.isAllowed]) —
///    проверяем, что сервис бросает [AppStrings.formatPairNotSupported].
/// 2. Если входной формат можно собрать без нативных кодеков
///    (см. [syntheticRasterFormats]) и выход в наборе «basic» / PDF —
///    проверяем успешную конверсию + валидность файла.
/// 3. Остальные пары (HEIC/AVIF/WebP вход или выход) помечены как
///    **known-limitation** в хосте: их можно проверить только в
///    `integration_test/converter_native_matrix_test.dart` на устройстве.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late ImageConverterService service;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('cap_matrix_');
    service = ImageConverterService();
  });

  tearDown(() async {
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  // Цели, которые проверяемы без нативных плагинов.
  const dartTargets = <ImageFormat>{
    ImageFormat.jpg,
    ImageFormat.png,
    ImageFormat.gif,
    ImageFormat.bmp,
    ImageFormat.tiff,
    ImageFormat.pdf,
  };

  // Входы, которые мы можем создать pure-Dart.
  final syntheticInputs = syntheticRasterFormats.toSet();

  // Сводный перебор всех пар входа и выхода.
  for (final input in ImageFormat.values) {
    for (final target in ImageFormat.values) {
      final pairLabel = '${input.name} -> ${target.name}';
      final isAllowed =
          ConversionMatrix.isAllowed(input: input, target: target);
      final isSyntheticInput = syntheticInputs.contains(input);
      final isDartTarget = dartTargets.contains(target);

      if (!isAllowed) {
        // Запрещённые пары: матрица должна отсечь до тяжёлой работы.
        if (isSyntheticInput) {
          test('blocked $pairLabel throws formatPairNotSupported', () async {
            final file = await writeSyntheticRaster(
              dir: tempDir,
              format: input,
              basename: 'src_${input.name}_${target.name}',
            );
            await expectLater(
              service.convert(inputFile: file, targetFormat: target),
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
        // Для невозможных без нативки входов пропускаем явно — это не баг,
        // а ограничение host-тестов; покрыто в integration_test/.
        continue;
      }

      if (!isSyntheticInput) {
        // HEIC / AVIF / WebP / PDF вход требует нативки на host — отдельный
        // путь в integration_test/converter_native_matrix_test.dart.
        continue;
      }

      if (!isDartTarget) {
        // HEIC / AVIF / WebP выход требует FlutterImageCompress + libavif —
        // покрывается только integration_test/converter_native_matrix_test.dart.
        continue;
      }

      test('convert $pairLabel produces a valid decodable file', () async {
        final file = await writeSyntheticRaster(
          dir: tempDir,
          format: input,
          basename: 'src_${input.name}_${target.name}',
        );

        final out = await service.convert(
          inputFile: file,
          targetFormat: target,
        );

        expect(out.format, target);
        expect(await out.file.exists(), isTrue, reason: out.file.path);
        expect(
          out.file.path.toLowerCase().endsWith('.${target.extension}'),
          isTrue,
        );

        final bytes = await out.file.readAsBytes();
        expect(bytes.length, greaterThan(0));

        if (target == ImageFormat.pdf) {
          // %PDF\n
          expect(bytes.length, greaterThan(8));
          expect(String.fromCharCodes(bytes.take(4)), '%PDF');
        } else {
          final decoded = img.decodeImage(bytes);
          expect(decoded, isNotNull, reason: pairLabel);
          expect(decoded!.width, greaterThan(0));
          expect(decoded.height, greaterThan(0));
        }
      });
    }
  }

  // Защита от расхождения UI-списка и фактических разрешённых пар.
  test('platform output list aligns with matrix for synthetic inputs', () {
    final platformOutputs = ConverterCapabilities.outputFormatsForPlatform;
    for (final src in syntheticRasterFormats) {
      final allowed = ConversionMatrix.allowedOutputsFor(src);
      // Все «allowed» цели должны входить в platform list.
      for (final t in allowed) {
        expect(platformOutputs.contains(t), isTrue, reason: '$src -> $t');
      }
      // А вход равен выходу — не должен быть в allowed.
      expect(allowed.contains(src), isFalse);
    }
  });
}
