import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
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
        '[GC] save mode: ${format == ImageFormat.pdf ? "pdfDisk(no gallery)" : ImageSavePolicy.useGalleryImageApi(format) ? "galleryImage(saveImage)" : "fileExport(saveFile)"} format=$format',
      );
    }

    try {
      // SaverGallery routes saveFile through the images MediaStore collection;
      // application/pdf crashes with IllegalArgumentException on Android.
      if (format == ImageFormat.pdf) {
        await _savePdfOutsideGallery(file, fileName);
        return;
      }

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

  /// Writes PDF to app-accessible storage. Do not use [SaverGallery] for PDF.
  Future<void> _savePdfOutsideGallery(File file, String fileName) async {
    if (kIsWeb) {
      throw Exception(AppStrings.savePdfFailed);
    }

    final bytes = await file.readAsBytes();
    if (bytes.isEmpty) {
      throw Exception(AppStrings.outputFileEmpty);
    }

    late final File dest;

    if (Platform.isAndroid) {
      final ext = await getExternalStorageDirectory();
      if (ext == null) {
        throw Exception(AppStrings.savePdfFailed);
      }
      final outDir = Directory(p.join(ext.path, 'PDF'));
      await outDir.create(recursive: true);
      dest = File(p.join(outDir.path, fileName));
    } else if (Platform.isIOS) {
      final docs = await getApplicationDocumentsDirectory();
      final outDir = Directory(p.join(docs.path, 'PDF'));
      await outDir.create(recursive: true);
      dest = File(p.join(outDir.path, fileName));
    } else {
      final downloads = await getDownloadsDirectory();
      final dir = downloads ?? await getApplicationDocumentsDirectory();
      dest = File(p.join(dir.path, fileName));
    }

    await dest.writeAsBytes(bytes, flush: true);

    if (kDebugMode) {
      debugPrint('[GC] PDF saved to: ${dest.path}');
    }
  }
}
