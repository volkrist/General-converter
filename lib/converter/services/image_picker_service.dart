import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  ImagePickerService(this._picker);

  final ImagePicker _picker;

  Future<File?> pickImage() async {
    final xFile = await _picker.pickImage(source: ImageSource.gallery);
    if (xFile == null) return null;
    return File(xFile.path);
  }
}

