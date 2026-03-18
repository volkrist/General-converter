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
  main.dart                         # Entry point
  app/                              # App-level setup
    app.dart                        # MaterialApp widget
    bootstrap.dart                  # Initialization
    router.dart                     # Route definitions
    theme/app_theme.dart            # Material 3 theme
    di/providers.dart               # Dependency injection (provider)
  features/
    converter/                      # Core feature
      domain/                       # Business logic contracts
        entities/                   # ImageAsset, ConversionResult
        enums/                      # ImageFormat enum
        repositories/               # Abstract ConverterRepository
        usecases/                   # PickImage, ConvertImage, SaveResult
      data/                         # Implementation layer
        services/                   # ImagePicker, Converter, Save services
        repositories/               # ConverterRepositoryImpl
        mappers/                    # Data mapping helpers
      presentation/                 # UI layer
        viewmodels/                 # ConverterViewModel (ChangeNotifier)
        screens/                    # ConverterScreen
        widgets/                    # FAB, dropdown, convert button, cards
  shared/                           # Reusable across features
    constants/                      # Sizes, strings
    utils/                          # File helpers, logger, Result type
    widgets/                        # Generic UI components
```

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
- **Architecture:** feature-first with data / domain / presentation layers
- **Key packages:** image_picker, image, path_provider, saver_gallery
