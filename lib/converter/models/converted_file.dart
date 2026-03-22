import 'dart:io';

import 'image_format.dart';

class ConvertedFile {
  const ConvertedFile({
    required this.file,
    required this.format,
    this.customBaseName,
  });

  final File file;
  final ImageFormat format;
  final String? customBaseName;

  String get extension => format.name;

  String get displayName {
    final base = customBaseName;
    if (base == null || base.trim().isEmpty) {
      return file.uri.pathSegments.isNotEmpty
          ? file.uri.pathSegments.last
          : file.path.split(Platform.pathSeparator).last;
    }
    return '$base.$extension';
  }

  ConvertedFile copyWith({
    File? file,
    ImageFormat? format,
    String? customBaseName,
  }) {
    return ConvertedFile(
      file: file ?? this.file,
      format: format ?? this.format,
      customBaseName: customBaseName ?? this.customBaseName,
    );
  }
}
