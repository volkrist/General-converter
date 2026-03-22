// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use
// Каркас Web: позже можно перевести на package:web + dart:js_interop.
import 'dart:html' as html;
import 'dart:typed_data';

/// Скачивание через Blob URL (только браузер).
void downloadBytes({
  required Uint8List bytes,
  required String fileName,
}) {
  final mime = _mimeFromFileName(fileName);

  final blob = html.Blob(
    [bytes],
    mime,
  );

  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..download = fileName
    ..style.display = 'none';

  html.document.body?.children.add(anchor);
  anchor.click();
  anchor.remove();
  html.Url.revokeObjectUrl(url);
}

String _mimeFromFileName(String name) {
  final lower = name.toLowerCase();

  if (lower.endsWith('.png')) return 'image/png';
  if (lower.endsWith('.jpg') || lower.endsWith('.jpeg')) return 'image/jpeg';
  if (lower.endsWith('.gif')) return 'image/gif';
  if (lower.endsWith('.bmp')) return 'image/bmp';
  if (lower.endsWith('.tiff') || lower.endsWith('.tif')) return 'image/tiff';
  if (lower.endsWith('.pdf')) return 'application/pdf';
  if (lower.endsWith('.webp')) return 'image/webp';

  return 'application/octet-stream';
}

/// Совместимость со старым API.
void downloadOutputBytes(Uint8List bytes, String fileName) {
  downloadBytes(bytes: bytes, fileName: fileName);
}
