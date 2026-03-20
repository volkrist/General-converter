# General Converter

A Flutter Android app for converting images between formats.  
Pick an image, choose a target format, convert, and save the result.

## Supported Formats

| Format | Extension |
|--------|-----------|
| JPEG   | `.jpg`    |
| PNG    | `.png`    |
| WebP   | `.webp`   |
| HEIC   | `.heic`   |
| GIF    | `.gif`    |
| TIFF   | `.tiff`   |
| AVIF   | `.avif`   |
| BMP    | `.bmp`    |

## Project Structure

```
lib/
  main.dart, app.dart, bootstrap.dart, providers.dart
  converter/                        # Core converter (single feature module)
    models/                         # ConvertedFile
    services/                       # ImagePickerService, ImageConverterService, ImageSaveService
    viewmodels/                     # ConverterViewModel (ChangeNotifier)
  models/                           # ImageFormat
  screens/                          # ConverterScreen
  widgets/                          # FAB, dropdown, convert button, cards, …
  constants/, theme, router, utils/
```

UI → `ConverterViewModel` → `lib/converter/services/*`.

## Getting Started

```bash
# Install dependencies
flutter pub get

# Run on Android device/emulator
flutter run

# Run tests
flutter test

# Analyze code
flutter analyze
```

## Git Workflow

We work with branches and pull requests — never push directly to `main`.

```
git checkout main
git pull origin main
git checkout -b feature/<number>-<short-name>

# After work:
git add .
git commit -m "feat: description (#issue)"
git push -u origin feature/<number>-<short-name>

# Then open a Pull Request: base main ← compare feature/...
```

### Branch rules

- Changes to `main` only through PR
- Minimum 1 approval before merge
- No direct pushes to `main`
- No force pushes

## Tech Stack

- **Flutter** 3.41+ / Dart 3.11+
- **State management:** provider + ChangeNotifier
- **Architecture:** UI + `ConverterViewModel` + converter services (no duplicate legacy services under `lib/services/`)
- **Key packages:** `file_picker` (изображения + PDF), `image` (растры), `pdf` (image→PDF), `pdf_render` (PDF→image, 1-я страница), `flutter_avif`, `flutter_image_compress`, `heif_converter`, path_provider, saver_gallery
- **Android `minSdk`:** 28 (HEIC encode через системный HEIF writer)
