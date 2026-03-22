import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:saver_gallery/saver_gallery.dart';

import '../../../constants/app_strings.dart';
import '../../models/image_format.dart';
import 'image_save_policy.dart';

/// Сохранение результата конвертации: стратегия **только по [ImageFormat]**,
/// без ветвления по размеру файла.
class ImageSaveService {
  /// Сохраняет [file] в галерею / хранилище в зависимости от [format].
  Future<void> save({
    required File file,
    required ImageFormat format,
  }) async {
    final fileName = p.basename(file.path);

    if (kDebugMode) {
      debugPrint('[GC] save start: ${file.path}');
      debugPrint(
        '[GC] save mode: ${ImageSavePolicy.useGalleryImageApi(format) ? "galleryImage(saveImage)" : "fileExport(saveFile)"} format=$format',
      );
    }

    try {
      if (ImageSavePolicy.useGalleryImageApi(format)) {
        final bytes = await file.readAsBytes();
        if (bytes.isEmpty) {
          throw Exception(AppStrings.outputFileEmpty);
        }
        final result = await SaverGallery.saveImage(
          Uint8List.fromList(bytes),
          fileName: fileName,
          quality: 100,
          skipIfExists: false,
        );
        if (!result.isSuccess) {
          throw Exception(result.errorMessage ?? AppStrings.saveFailed);
        }
        return;
      }

      final result = await SaverGallery.saveFile(
        filePath: file.path,
        fileName: fileName,
        skipIfExists: false,
      );
      if (!result.isSuccess) {
        throw Exception(
          format == ImageFormat.pdf
              ? AppStrings.savePdfFailed
              : (result.errorMessage ?? AppStrings.saveFailed),
        );
      }
    } catch (e) {
      if (e is Exception) rethrow;
      throw Exception(AppStrings.saveFailed);
    }
  }
}
