import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter_avif/flutter_avif.dart';

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
