class MimeHelper {
  static const _mimeMap = {
    'jpg': 'image/jpeg',
    'jpeg': 'image/jpeg',
    'png': 'image/png',
    'webp': 'image/webp',
    'heic': 'image/heic',
    'gif': 'image/gif',
    'tiff': 'image/tiff',
    'tif': 'image/tiff',
    'avif': 'image/avif',
    'bmp': 'image/bmp',
  };

  static String? mimeFromExtension(String ext) {
    return _mimeMap[ext.toLowerCase().replaceAll('.', '')];
  }
}
