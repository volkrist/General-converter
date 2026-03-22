import '../../models/image_format.dart';

/// Как сохранять результат: только **JPG/PNG** через gallery image API (`saveImage`),
/// всё остальное — через путь файла (`saveFile`), без эвристик по размеру.
abstract final class ImageSavePolicy {
  /// `true` → [SaverGallery.saveImage]; `false` → [SaverGallery.saveFile].
  static bool useGalleryImageApi(ImageFormat format) {
    switch (format) {
      case ImageFormat.jpg:
      case ImageFormat.png:
        return true;
      case ImageFormat.pdf:
      case ImageFormat.heic:
      case ImageFormat.avif:
      case ImageFormat.tiff:
      case ImageFormat.bmp:
      case ImageFormat.gif:
      case ImageFormat.webp:
        return false;
    }
  }
}
