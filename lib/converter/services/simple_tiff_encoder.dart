import 'dart:typed_data';

/// Минимальный **baseline TIFF 6.0**: RGB, 8 бит/канал, без сжатия.
///
/// [rgbInterleaved] — порядок `RGBRGB…`, длина `width * height * 3`.
/// Нужен из‑за ненадёжного [img.encodeTiff] в `package:image` (в т.ч. пустой файл).
Uint8List encodeRgbTiffUncompressed({
  required int width,
  required int height,
  required Uint8List rgbInterleaved,
}) {
  final expected = width * height * 3;
  if (rgbInterleaved.length != expected) {
    throw ArgumentError(
      'TIFF RGB buffer: expected $expected bytes, got ${rgbInterleaved.length}',
    );
  }

  const short = 3;
  const long = 4;

  // Теги IFD (без Tile*, только Strip — совместимо с просмотрщиками).
  // Номера тегов по TIFF 6.0 (десятичные = 0x0100 + …).
  const numEntries = 10;
  final ifdStart = 8;
  final ifdSize = 2 + numEntries * 12 + 4;
  final bitsPerSampleOffset = ifdStart + ifdSize;
  final bitsPerSampleSize = 6; // 3 × uint16
  final imageDataOffset = _align4(bitsPerSampleOffset + bitsPerSampleSize);
  final stripSize = expected;

  final totalSize = imageDataOffset + stripSize;
  final out = Uint8List(totalSize);
  final bd = ByteData.sublistView(out);

  // TIFF header (little-endian)
  bd.setUint16(0, 0x4949, Endian.little); // "II"
  bd.setUint16(2, 42, Endian.little);
  bd.setUint32(4, ifdStart, Endian.little);

  var o = ifdStart;
  bd.setUint16(o, numEntries, Endian.little);
  o += 2;

  void entry(int tag, int type, int count, int valueOrOffset) {
    bd.setUint16(o, tag, Endian.little);
    o += 2;
    bd.setUint16(o, type, Endian.little);
    o += 2;
    bd.setUint32(o, count, Endian.little);
    o += 4;
    bd.setUint32(o, valueOrOffset, Endian.little);
    o += 4;
  }

  // 256 ImageWidth
  entry(256, long, 1, width);
  // 257 ImageLength
  entry(257, long, 1, height);
  // 258 BitsPerSample — 3×SHORT вне IFD
  entry(258, short, 3, bitsPerSampleOffset);
  // 259 Compression = 1 (none)
  entry(259, short, 1, 1);
  // 262 PhotometricInterpretation = 2 (RGB)
  entry(262, short, 1, 2);
  // 273 (0x0111) StripOffsets
  entry(273, long, 1, imageDataOffset);
  // 277 (0x0115) SamplesPerPixel = 3
  entry(277, short, 1, 3);
  // 278 (0x0116) RowsPerStrip
  entry(278, long, 1, height);
  // 279 (0x0117) StripByteCounts
  entry(279, long, 1, stripSize);
  // 284 (0x011c) PlanarConfiguration = 1 (chunky)
  entry(284, short, 1, 1);

  bd.setUint32(o, 0, Endian.little); // next IFD
  o += 4;

  // BitsPerSample: 8,8,8
  var bps = bitsPerSampleOffset;
  bd.setUint16(bps, 8, Endian.little);
  bps += 2;
  bd.setUint16(bps, 8, Endian.little);
  bps += 2;
  bd.setUint16(bps, 8, Endian.little);

  out.setRange(imageDataOffset, imageDataOffset + stripSize, rgbInterleaved);
  return out;
}

int _align4(int x) => (x + 3) & ~3;
