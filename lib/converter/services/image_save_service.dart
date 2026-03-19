import 'dart:io';
import 'dart:typed_data';

import 'package:saver_gallery/saver_gallery.dart';

class ImageSaveService {
  Future<void> save(File file) async {
    final bytes = await file.readAsBytes();
    final baseName = file.path.split(Platform.pathSeparator).last;

    final result = await SaverGallery.saveImage(
      Uint8List.fromList(bytes),
      fileName: baseName,
      skipIfExists: false,
    );

    if (!result.isSuccess) {
      throw Exception('Failed to save image to gallery');
    }
  }
}

