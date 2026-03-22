// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:convert';
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:image/image.dart' as img;

/// Кодирует растр в WebP через `canvas.toDataUrl('image/webp')` (поддерживается в Chromium).
Uint8List encodeWebPFromPngBytes(Uint8List pngBytes) {
  final decoded = img.decodeImage(pngBytes);
  if (decoded == null) {
    throw StateError('webp_encode_decode');
  }
  final w = decoded.width;
  final h = decoded.height;
  if (w <= 0 || h <= 0) {
    throw StateError('webp_encode_dimensions');
  }

  final canvas = html.CanvasElement(width: w, height: h);
  final ctx = canvas.context2D;
  final imageData = ctx.createImageData(w, h);
  final data = imageData.data;
  var i = 0;
  for (var y = 0; y < h; y++) {
    for (var x = 0; x < w; x++) {
      final p = decoded.getPixel(x, y);
      data[i++] = p.r.toInt().clamp(0, 255);
      data[i++] = p.g.toInt().clamp(0, 255);
      data[i++] = p.b.toInt().clamp(0, 255);
      data[i++] = p.a.toInt().clamp(0, 255);
    }
  }
  ctx.putImageData(imageData, 0, 0);

  final dataUrl = canvas.toDataUrl('image/webp', 0.9);
  final comma = dataUrl.indexOf(',');
  if (comma < 0) {
    throw StateError('webp_encode_dataurl');
  }
  final b64 = dataUrl.substring(comma + 1);
  return Uint8List.fromList(base64Decode(b64));
}
