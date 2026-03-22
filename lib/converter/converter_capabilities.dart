import 'package:flutter/foundation.dart';

import 'models/image_format.dart';

/// Единый источник правды: какие форматы реально обрабатывает конвертер.
abstract final class ConverterCapabilities {
  /// Все форматы на вход (Android / desktop).
  static const List<ImageFormat> supportedInputFormats = ImageFormat.values;

  /// Вход для Web — без HEIC и AVIF (браузеры нестабильны / нет нормального decode).
  static const List<ImageFormat> supportedInputFormatsWeb = [
    ImageFormat.jpg,
    ImageFormat.png,
    ImageFormat.webp,
    ImageFormat.gif,
    ImageFormat.tiff,
    ImageFormat.bmp,
    ImageFormat.pdf,
  ];

  /// Цели для Web (без HEIC / AVIF).
  static const List<ImageFormat> supportedOutputFormats = [
    ImageFormat.jpg,
    ImageFormat.png,
    ImageFormat.bmp,
    ImageFormat.gif,
    ImageFormat.tiff,
    ImageFormat.webp,
    ImageFormat.pdf,
  ];

  /// Цели для Android (включая HEIC и AVIF).
  static const List<ImageFormat> supportedOutputFormatsAndroid = [
    ImageFormat.jpg,
    ImageFormat.png,
    ImageFormat.bmp,
    ImageFormat.gif,
    ImageFormat.tiff,
    ImageFormat.webp,
    ImageFormat.heic,
    ImageFormat.avif,
    ImageFormat.pdf,
  ];

  static List<ImageFormat> get inputFormatsForPlatform =>
      kIsWeb ? supportedInputFormatsWeb : supportedInputFormats;

  static List<ImageFormat> get outputFormatsForPlatform =>
      kIsWeb ? supportedOutputFormats : supportedOutputFormatsAndroid;
}
