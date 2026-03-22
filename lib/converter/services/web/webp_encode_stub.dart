import 'dart:typed_data';

/// Заглушка: WebP encode только в браузере ([webp_encode_web.dart]).
Uint8List encodeWebPFromPngBytes(Uint8List pngBytes) {
  throw UnsupportedError('WebP encoding is only available in the browser build');
}
