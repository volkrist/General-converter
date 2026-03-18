import 'dart:io';
import 'dart:typed_data';

import 'package:saver_gallery/saver_gallery.dart';

import '../models/conversion_result.dart';

class ImageSaveService {
  Future<String> saveToGallery(ConversionResult result) async {
    final bytes = await File(result.outputPath).readAsBytes();
    final baseName = result.outputPath.split('/').last;

    final saveResult = await SaverGallery.saveImage(
      Uint8List.fromList(bytes),
      fileName: baseName,
      skipIfExists: false,
    );

    if (!saveResult.isSuccess) {
      throw Exception('Failed to save image to gallery');
    }

    return result.outputPath;
  }
}
