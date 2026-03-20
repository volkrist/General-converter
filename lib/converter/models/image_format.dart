/// Целевые и исходные форматы конвертера.
///
/// Используется и в UI, и в [ImageConverterService]. Список «честной»
/// поддержки см. [ConverterCapabilities].
enum ImageFormat {
  jpg('JPG', 'jpg', 'image/jpeg'),
  png('PNG', 'png', 'image/png'),
  webp('WebP', 'webp', 'image/webp'),
  heic('HEIC', 'heic', 'image/heic'),
  gif('GIF', 'gif', 'image/gif'),
  tiff('TIFF', 'tiff', 'image/tiff'),
  avif('AVIF', 'avif', 'image/avif'),
  bmp('BMP', 'bmp', 'image/bmp'),
  pdf('PDF', 'pdf', 'application/pdf');

  const ImageFormat(this.label, this.extension, this.mimeType);

  final String label;
  final String extension;
  final String mimeType;

  static const _aliases = {
    'jpeg': 'jpg',
    'tif': 'tiff',
    'heif': 'heic',
  };

  /// Нормализует расширение без точки и возвращает соответствующий формат.
  static ImageFormat? fromExtension(String ext) {
    var normalized = ext.toLowerCase().replaceAll('.', '');
    normalized = _aliases[normalized] ?? normalized;
    return ImageFormat.values.cast<ImageFormat?>().firstWhere(
          (f) => f!.extension == normalized,
          orElse: () => null,
        );
  }

  /// Определяет формат по пути (последнее расширение).
  static ImageFormat? fromPath(String path) {
    final lower = path.toLowerCase();
    if (lower.endsWith('.jpg') || lower.endsWith('.jpeg')) {
      return ImageFormat.jpg;
    }
    if (lower.endsWith('.png')) return ImageFormat.png;
    if (lower.endsWith('.webp')) return ImageFormat.webp;
    if (lower.endsWith('.heic') || lower.endsWith('.heif')) {
      return ImageFormat.heic;
    }
    if (lower.endsWith('.gif')) return ImageFormat.gif;
    if (lower.endsWith('.tif') || lower.endsWith('.tiff')) {
      return ImageFormat.tiff;
    }
    if (lower.endsWith('.avif')) return ImageFormat.avif;
    if (lower.endsWith('.bmp')) return ImageFormat.bmp;
    if (lower.endsWith('.pdf')) return ImageFormat.pdf;
    return null;
  }
}
