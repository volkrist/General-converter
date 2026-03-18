enum ImageFormat {
  jpg('JPG', 'jpg', 'image/jpeg'),
  png('PNG', 'png', 'image/png'),
  webp('WebP', 'webp', 'image/webp'),
  heic('HEIC', 'heic', 'image/heic'),
  gif('GIF', 'gif', 'image/gif'),
  tiff('TIFF', 'tiff', 'image/tiff'),
  avif('AVIF', 'avif', 'image/avif'),
  bmp('BMP', 'bmp', 'image/bmp');

  const ImageFormat(this.label, this.extension, this.mimeType);

  final String label;
  final String extension;
  final String mimeType;

  static ImageFormat? fromExtension(String ext) {
    final normalized = ext.toLowerCase().replaceAll('.', '');
    return ImageFormat.values.cast<ImageFormat?>().firstWhere(
          (f) => f!.extension == normalized,
          orElse: () => null,
        );
  }
}
