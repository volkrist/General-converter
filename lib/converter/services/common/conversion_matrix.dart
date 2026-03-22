import '../../converter_capabilities.dart';
import '../../models/image_format.dart';
// Keep blocked pairs minimal. Add only combinations confirmed unstable on real Android.

/// Минимальный список **подтверждённо плохих** пар вход → выход (ключ `input.name->target.name`).
///
/// Пары «тот же формат» (jpg→jpg, heic→heic, …) всегда запрещены — см. [isAllowed].
abstract final class ConversionMatrix {
  static const Set<String> _blockedPairs = {
    'heic->pdf',
    'avif->pdf',
    'avif->tiff',
    'avif->gif',
    'avif->bmp',
  };

  static bool isAllowed({
    required ImageFormat input,
    required ImageFormat target,
  }) {
    if (input == target) {
      return false;
    }
    final key = '${input.name}->${target.name}';
    return !_blockedPairs.contains(key);
  }

  /// Цели для UI — пересечение платформенного списка выходов с матрицей.
  static List<ImageFormat> allowedOutputsFor(ImageFormat input) {
    return ConverterCapabilities.outputFormatsForPlatform
        .where((t) => isAllowed(input: input, target: t))
        .toList(growable: false);
  }
}