import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  ImagePickerService({ImagePicker? galleryPicker})
      : _gallery = galleryPicker ?? ImagePicker();

  final ImagePicker _gallery;

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

  Future<File?> pickFromGallery() async {
    final xFile = await _gallery.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (xFile == null) return null;
    return File(xFile.path);
  }

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

  Future<List<File>> pickManyFromFiles() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
    );
    if (result == null || result.files.isEmpty) return <File>[];

    return result.files
        .map((e) => e.path)
        .whereType<String>()
        .map(File.new)
        .toList();
  }

  Future<List<File>> pickFolderImages() async {
    if (kIsWeb) {
      return pickManyFromFiles();
    }

    final dirPath = await FilePicker.platform.getDirectoryPath();
    if (dirPath == null || dirPath.isEmpty) {
      return <File>[];
    }

    final dir = Directory(dirPath);
    if (!dir.existsSync()) return <File>[];

    final files = dir
        .listSync(recursive: false)
        .whereType<File>()
        .where(_isAllowedFile)
        .toList();

    files.sort((a, b) => a.path.compareTo(b.path));
    return files;
  }

  bool _isAllowedFile(File file) {
    final name = file.path.toLowerCase();
    return allowedExtensions.any((ext) => name.endsWith('.$ext'));
  }
}
