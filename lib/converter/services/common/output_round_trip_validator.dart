import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter_avif_platform_interface/flutter_avif_platform_interface.dart';

import 'package:general_converter/constants/app_strings.dart';
import 'package:general_converter/converter/models/image_format.dart';

import 'image_pure_worker.dart';

/// После encode для «капризных» форматов — убедиться, что файл реально декодится.
///
/// **Только AVIF и TIFF** (JPG/PNG/GIF/BMP не проверяем — лишняя задержка).
/// HEIC при необходимости можно добавить отдельным путём декода.
abstract final class OutputRoundTripValidator {
  /// Web / in-memory: проверка по байтам (без удаления файла).
  static Future<void> assertDecodesFromBytes(
    Uint8List bytes,
    ImageFormat format,
  ) async {
    if (format != ImageFormat.avif && format != ImageFormat.tiff) {
      return;
    }
    try {
      switch (format) {
        case ImageFormat.avif:
          await _assertAvifBytes(bytes);
          break;
        case ImageFormat.tiff:
          await _assertTiffBytes(bytes);
          break;
        default:
          break;
      }
    } catch (_) {
      throw Exception(AppStrings.outputEncodeRoundTripFailed);
    }
  }

  /// При ошибке: удаляет [file] и бросает [AppStrings.outputEncodeRoundTripFailed].
  static Future<void> assertDecodesAfterWrite(
    File file,
    ImageFormat format,
  ) async {
    if (format != ImageFormat.avif && format != ImageFormat.tiff) {
      return;
    }
    try {
      final bytes = await file.readAsBytes();
      await assertDecodesFromBytes(bytes, format);
    } catch (_) {
      try {
        if (await file.exists()) await file.delete();
      } catch (_) {}
      throw Exception(AppStrings.outputEncodeRoundTripFailed);
    }
  }

  static Future<void> _assertAvifBytes(Uint8List bytes) async {
    if (bytes.isEmpty) {
      throw StateError('empty');
    }
    final frame =
        await FlutterAvifPlatform.api.decodeSingleFrameImage(avifBytes: bytes);
    if (frame.width <= 0 ||
        frame.height <= 0 ||
        frame.data.isEmpty) {
      throw StateError('bad_avif_frame');
    }
  }

  static Future<void> _assertTiffBytes(Uint8List bytes) async {
    if (bytes.isEmpty) {
      throw StateError('empty');
    }
    if (kIsWeb) {
      workerAssertTiffReadable(bytes);
    } else {
      await Isolate.run(() => workerAssertTiffReadable(bytes));
    }
  }
}
