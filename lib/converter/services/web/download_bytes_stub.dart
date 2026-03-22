import 'dart:typed_data';

/// Заглушка для не-web платформ (сборка Android/iOS/tests).
void downloadBytes({
  required Uint8List bytes,
  required String fileName,
}) {
  throw UnsupportedError(
    'downloadBytes is only available on Flutter Web',
  );
}

/// Совместимость со старым API.
void downloadOutputBytes(Uint8List bytes, String fileName) {
  downloadBytes(bytes: bytes, fileName: fileName);
}
