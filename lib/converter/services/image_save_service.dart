import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:saver_gallery/saver_gallery.dart';

import '../../constants/app_strings.dart';

class ImageSaveService {
  @visibleForTesting
  static bool useFilePathApi(String fileName, int lengthBytes) {
    final lower = fileName.toLowerCase();
    final isPdf = lower.endsWith('.pdf');
    return isPdf || lengthBytes > 5 * 1024 * 1024;
  }

  /// Сохраняет результат в галерею / файлы устройства.
  ///
  /// PDF и очень большие файлы — через [SaverGallery.saveFile] (без дублирования
  /// всего файла в памяти как у `saveImage`).
  Future<void> save(File file) async {
    final fileName = p.basename(file.path);
    final lower = fileName.toLowerCase();
    final length = await file.length();

    final isPdf = lower.endsWith('.pdf');
    final useFileApi = useFilePathApi(fileName, length);

    try {
      if (useFileApi) {
        final result = await SaverGallery.saveFile(
          filePath: file.path,
          fileName: fileName,
          skipIfExists: false,
        );
        if (!result.isSuccess) {
          throw Exception(
            isPdf ? AppStrings.savePdfFailed : (result.errorMessage ?? AppStrings.saveFailed),
          );
        }
        return;
      }

      final bytes = await file.readAsBytes();
      if (bytes.isEmpty) {
        throw Exception(AppStrings.outputFileEmpty);
      }
      final result = await SaverGallery.saveImage(
        Uint8List.fromList(bytes),
        fileName: fileName,
        skipIfExists: false,
      );

      if (!result.isSuccess) {
        throw Exception(result.errorMessage ?? AppStrings.saveFailed);
      }
    } catch (e) {
      if (e is Exception) rethrow;
      throw Exception(AppStrings.saveFailed);
    }
  }
}
