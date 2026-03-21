import 'converter_capabilities.dart';
import 'models/image_format.dart';

// Keep blocked pairs minimal. Add only combinations confirmed unstable on real Android.

/// Минимальный список **подтверждённо плохих** пар вход → выход (ключ `input.name->target.name`).
abstract final class ConversionMatrix {
  static const Set<String> _blockedPairs = {
    'pdf->pdf',
    'avif->pdf',
    'avif->tiff',
    'avif->gif',
    'avif->bmp',
  };

  static bool isAllowed({
    required ImageFormat input,
    required ImageFormat target,
  }) {
    final key = '${input.name}->${target.name}';
    return !_blockedPairs.contains(key);
  }

  /// Цели для UI — пересечение [ConverterCapabilities.supportedOutputFormats] с матрицей.
  static List<ImageFormat> allowedOutputsFor(ImageFormat input) {
    return ConverterCapabilities.supportedOutputFormats
        .where((t) => isAllowed(input: input, target: t))
        .toList(growable: false);
  }
}
