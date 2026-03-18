import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../models/image_asset.dart';
import '../models/image_format.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<ImageAsset?> pickImage() async {
    final xFile = await _picker.pickImage(source: ImageSource.gallery);
    if (xFile == null) return null;

    final file = File(xFile.path);
    final bytes = await file.length();
    final ext = xFile.path.split('.').last;

    return ImageAsset(
      name: xFile.name,
      path: xFile.path,
      sizeBytes: bytes,
      format: ImageFormat.fromExtension(ext),
    );
  }
}
