import 'dart:io';

import 'image_format.dart';

/// Результат конвертации: файл на диске и целевой формат.
class ConvertedFile {
  const ConvertedFile({
    required this.file,
    required this.format,
  });

  final File file;
  final ImageFormat format;
}
