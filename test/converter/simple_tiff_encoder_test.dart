import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:general_converter/converter/services/simple_tiff_encoder.dart';

void main() {
  test('encodeRgbTiffUncompressed produces non-empty TIFF header and strip', () {
    const w = 4;
    const h = 3;
    final rgb = Uint8List(w * h * 3);
    for (var i = 0; i < rgb.length; i++) {
      rgb[i] = (i * 17) & 0xff;
    }
    final tiff = encodeRgbTiffUncompressed(
      width: w,
      height: h,
      rgbInterleaved: rgb,
    );
    expect(tiff.isNotEmpty, true);
    expect(tiff[0], 0x49); // I
    expect(tiff[1], 0x49); // I
    expect(tiff.length, greaterThan(rgb.length));
  });
}
