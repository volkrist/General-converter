import 'models/image_format.dart';

/// Единый источник правды: какие форматы реально обрабатывает конвертер.
abstract final class ConverterCapabilities {
  /// Форматы, которые мы умеем принимать на вход (после выбора файла).
  static const List<ImageFormat> supportedInputFormats = ImageFormat.values;

  /// Форматы, в которые умеем кодировать результат (dropdown).
  static const List<ImageFormat> supportedOutputFormats = [
    ImageFormat.jpg,
    ImageFormat.png,
    ImageFormat.webp,
    ImageFormat.heic,
    ImageFormat.gif,
    ImageFormat.tiff,
    ImageFormat.avif,
    ImageFormat.bmp,
    ImageFormat.pdf,
  ];
}
