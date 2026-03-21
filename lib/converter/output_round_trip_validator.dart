import 'dart:io';
import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:flutter_avif/flutter_avif.dart';

import '../constants/app_strings.dart';
import 'models/image_format.dart';
import 'services/image_pure_worker.dart';

/// После encode для «капризных» форматов — убедиться, что файл реально декодится.
///
/// **Только AVIF и TIFF** (JPG/PNG/GIF/BMP не проверяем — лишняя задержка).
/// HEIC при необходимости можно добавить отдельным путём декода.
abstract final class OutputRoundTripValidator {
  /// При ошибке: удаляет [file] и бросает [AppStrings.outputEncodeRoundTripFailed].
  static Future<void> assertDecodesAfterWrite(
    File file,
    ImageFormat format,
  ) async {
    if (format != ImageFormat.avif && format != ImageFormat.tiff) {
      return;
    }
    try {
      switch (format) {
        case ImageFormat.avif:
          await _assertAvif(file);
          break;
        case ImageFormat.tiff:
          await _assertTiff(file);
          break;
        default:
          break;
      }
    } catch (_) {
      try {
        if (await file.exists()) await file.delete();
      } catch (_) {}
      throw Exception(AppStrings.outputEncodeRoundTripFailed);
    }
  }

  static Future<void> _assertAvif(File file) async {
    final bytes = await file.readAsBytes();
    if (bytes.isEmpty) {
      throw StateError('empty');
    }
    final frames = await decodeAvif(bytes);
    if (frames.isEmpty) {
      throw StateError('no_frames');
    }
    final im = frames.first.image;
    try {
      if (im.width <= 0 || im.height <= 0) {
        throw StateError('bad_dims');
      }
    } finally {
      im.dispose();
    }
  }

  static Future<void> _assertTiff(File file) async {
    final bytes = await file.readAsBytes();
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
