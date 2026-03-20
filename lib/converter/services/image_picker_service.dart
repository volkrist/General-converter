import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

/// Выбор файла: **галерея** (растровые фото) или **файлы** (все поддерживаемые + PDF).
class ImagePickerService {
  ImagePickerService({ImagePicker? galleryPicker})
      : _gallery = galleryPicker ?? ImagePicker();

  final ImagePicker _gallery;

  /// Расширения, согласованные с [ImageFormat.fromPath].
  static const allowedExtensions = <String>[
    'jpg',
    'jpeg',
    'png',
    'webp',
    'heic',
    'heif',
    'gif',
    'tif',
    'tiff',
    'avif',
    'bmp',
    'pdf',
  ];

  /// Системная галерея / фото (без PDF).
  Future<File?> pickFromGallery() async {
    final xFile = await _gallery.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (xFile == null) return null;
    return File(xFile.path);
  }

  /// Проводник файлов: изображения + PDF.
  Future<File?> pickFromFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
    );
    if (result == null || result.files.isEmpty) return null;
    final path = result.files.single.path;
    if (path == null) return null;
    return File(path);
  }
}
