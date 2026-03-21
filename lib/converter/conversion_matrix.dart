import 'models/image_format.dart';

/// Минимальный список **подтверждённо плохих** пар вход → выход.
/// Остальное не перечисляем: иначе таблица разрастается и ломается от любого нового формата.
abstract final class ConversionMatrix {
  static const _blockedPairs = <({ImageFormat in_, ImageFormat out})>{
    (in_: ImageFormat.pdf, out: ImageFormat.pdf),
    (in_: ImageFormat.avif, out: ImageFormat.pdf),
  };

  static bool isAllowed(ImageFormat input, ImageFormat output) {
    for (final p in _blockedPairs) {
      if (p.in_ == input && p.out == output) {
        return false;
      }
    }
    return true;
  }

  static List<ImageFormat> allowedOutputsFor(ImageFormat input) {
    return ImageFormat.values
        .where((o) => isAllowed(input, o))
        .toList(growable: false);
  }
}
