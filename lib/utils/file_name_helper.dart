class FileNameHelper {
  static String replaceExtension(String fileName, String newExtension) {
    final dotIndex = fileName.lastIndexOf('.');
    final baseName = dotIndex != -1 ? fileName.substring(0, dotIndex) : fileName;
    return '$baseName.$newExtension';
  }

  static String extractExtension(String fileName) {
    final dotIndex = fileName.lastIndexOf('.');
    if (dotIndex == -1 || dotIndex == fileName.length - 1) return '';
    return fileName.substring(dotIndex + 1).toLowerCase();
  }

  static String extractBaseName(String path) {
    return path.split(RegExp(r'[/\\]')).last;
  }
}
