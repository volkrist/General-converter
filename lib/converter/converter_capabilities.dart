import 'models/image_format.dart';

/// Единый источник правды: какие форматы реально обрабатывает конвертер.
///
/// UI (dropdown и т.д.) должен опираться на эти списки, а не на «весь enum»,
/// если когда‑нибудь часть направлений будет отключена на конкретной платформе.
abstract final class ConverterCapabilities {
  /// Форматы, которые мы умеем принимать на вход (после выбора файла).
  static const List<ImageFormat> supportedInputFormats = ImageFormat.values;

  /// Форматы, в которые умеем кодировать результат.
  static const List<ImageFormat> supportedOutputFormats = ImageFormat.values;
}
