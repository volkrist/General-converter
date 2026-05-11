# Sync & Build Report — 2026-05-11

## Branch state
- HEAD: `72132e0` (upstream main, fast-forwarded from `bef1f8d`).
- Version bumped: **1.2.0+5 → 1.2.1+6** (`pubspec.yaml`).
- applicationId/namespace: `com.tfd.general_converter` — already in repo, no change needed (matches phone install).

## Upstream commits pulled (14)
```
72132e0 feat: implement system window insets handling in MainActivity
8ec0a1d fix: update app version to 1.2.0+5 and wrap IncomingSharedFilesListener in SafeArea
1481133 Add translations and metadata propagation script
6ef0da5 Localize app strings for Ukrainian, Vietnamese, and Chinese languages
f32575c refactor: improve code formatting and organization in localization and provider files
3c8a818 feat: add wakelock functionality to keep screen on
85ab2f2 fix: update wakelock package to wakelock_plus and adjust imports
d95b20c Refactor code structure for improved readability and maintainability
08d6a92 fix: standardize quotes in pubspec.yaml
02576dd feat: update app icons and improve conversion button functionality
6eaeb9a close testing release
ff8e66a chore: rename app to Generic Converter and clean up manifest and plist
f134f37 bump version to 1.0.1+3 and update Windows company metadata
4ac1196 update application ID and package name to com.tfd.general_converter
```

## Improvements applied (stash → new base)

| File | Action | Why |
|---|---|---|
| `lib/app_theme.dart` | APPLY | Полный M3 редизайн (карточки, инпуты, кнопки, диалоги, banner, snackbar, predictive back) — upstream был тривиальный `colorSchemeSeed`. |
| `lib/theme_view_model.dart` | APPLY | Персист тёмы через `SharedPreferences` (default = dark). |
| `lib/converter/models/converted_file.dart` | APPLY | `copyWith(clearCustomBaseName: true)` для очистки кастомного имени. |
| `lib/converter/services/android/image_converter_service.dart` | APPLY | (1) Outputs в `tempDir/gc_outputs/` с writable-probe → safe на SAF/OTG; (2) `++_outputCounter` для уникальных имён в батче (исправляет коллизии при ms-таймстампе); (3) `PdfPage` закрывается в `finally`; (4) кэш writable-probe. |
| `lib/converter/services/common/preview_thumbnail_service.dart` | APPLY | Decode+resize+encode JPG переехал в `Isolate.run` — UI больше не лочится. |
| `lib/converter/services/image_picker_service.dart` | APPLY | `pickFolderImages`: `dir.listSync` → `await dir.list().toList()`. |
| `lib/converter/viewmodels/converter_view_model.dart` | APPLY | (1) Локализованные status-строки (`statusPreparing/Converting/Done/Cancelled/BatchProgress`); (2) `saveBatchItem` при ошибке сохраняет `status=done` и пишет в `saveError` (раньше затирался успешный результат конверсии); (3) пустой `renameOutputBase` чистит `customBaseName`; (4) `File.copy()` вместо read+write; (5) убраны два `Future.delayed(50ms)` симуляции прогресса. |
| `lib/widgets/selected_file_card.dart` | APPLY | `p.basename` вместо `Platform.pathSeparator` (работает на web); убран лишний `ClipRRect`, перевод на padding. |
| `lib/widgets/result_preview_card.dart` | APPLY | Кэш `lengthSync()` (раньше синхронный I/O в build); `Image.file(cacheWidth: 1080)`. |
| `lib/widgets/batch_result_tile.dart` | APPLY | `Image.file(cacheWidth: 720, filterQuality: low, gaplessPlayback: true)`. |
| `lib/widgets/convert_button.dart` | APPLY (merged) | `AnimatedSwitcher` на иконке; `scheme.onPrimary` вместо хардкод `Colors.white`. **Сохранил** upstream-фичу с `onCancel`/`showCancelWhileLoading`. |
| `lib/widgets/conversion_status_banner.dart` | APPLY | Редизайн: округлая Material-карточка с иконкой и контекстным цветом (error / warning / info), кнопка закрытия. |
| `lib/widgets/batch_summary_card.dart` | APPLY | Plain chips → плашки с borders, `tabularFigures`, акцент для Done/Failed. |
| `lib/screens/converter_screen.dart` | APPLY (точечно) | (1) Convert/Batch кнопки отключаются при `allowedTargetFormats.isEmpty`; (2) `AnimatedSwitcher` на иконке темы (rotation+fade); (3) `_EmptyState` — карточка с круглым акцентом + сабтайтл `emptyStateHint`. **НЕ менял**: leading icon (wakelock), language popup, PickImageFab. |
| `lib/l10n/app_en.arb` | APPLY | Новые ключи: `statusPreparing`, `statusPreparingBatch`, `statusConverting`, `statusDone`, `statusCancelled`, `statusBatchProgress(current,total,name)`. |
| `lib/constants/app_strings.dart` | APPLY | Геттеры `statusXxx` поверх `AppLocalizationsEn`. |
| `test/converter/capability_matrix_test.dart` | APPLY | Новый host-only тест: матрица allowed/blocked input→target для синтетических JPG/PNG/GIF/BMP/TIFF. |
| `lib/utils/*.dart`, `lib/widgets/{app_dropdown,app_scaffold,primary_button}.dart`, `lib/constants/app_sizes.dart`, `lib/models/image_format.dart`, `test/utils/file_name_helper_test.dart` | **NOT_APPLIED** | upstream-код всё ещё ссылается на эти файлы (`format_dropdown`, `incoming_shared_files_listener`, многие сервисы и тесты). Удалять нельзя. |
| `pubspec.yaml` | APPLY | Версия `1.2.0+5` → `1.2.1+6`. |

## Локализации
- В `app_en.arb` добавлено 6 ключей со статусами.
- `flutter gen-l10n` прогнан → во все остальные локали ключи добавлены с английским фоллбэком. **Перевод (ru/ja/zh/uk/vi и т.д.) требует ручной правки `app_*.arb` потом**.

## Тесты и анализ (Flutter 3.41.4, channel stable)
- `flutter analyze` → **No issues found.**
- `flutter test` → **All tests passed (+103).** `capability_matrix_test.dart` отрабатывает на host.
- `integration_test/...` — НЕ запускал (нет надёжного `--device` варианта без `flutter run`, был приоритет на сборку и установку).

## Сборка
- `flutter build apk --release` — **успех.** Дебаг-keystore (release-keystore в репо нет, есть автофоллбэк в `build.gradle.kts`).
- Путь: `build/app/outputs/flutter-apk/app-release.apk` — **70.7 MB**.
- Гредл сначала падал из-за кириллицы в `flutter.sdk` (мангелизация кодировки JVM ↔ Windows CP). Обошёл: junction `C:\flutter` → `C:\Users\Volkr\Desktop\проекты\flutter`, и `flutter.sdk=C:\\flutter` в `android/local.properties`.

## Установка на телефон — **БЛОКЕР**
```
adb -s R5CX4237R4D install -r build\app\outputs\flutter-apk\app-release.apk
→ INSTALL_FAILED_UPDATE_INCOMPATIBLE: Existing package com.tfd.general_converter
   signatures do not match newer version
```
Подпись существующей сборки на телефоне: `signatures=[8dc9d72c]`.
Это **debug-keystore** другой машины (не текущей). В этом репозитории release-keystore тоже нет (`android/key.properties` отсутствует).

### Варианты для решения (нужно ваше слово)
1. `adb uninstall com.tfd.general_converter` → переустановить (потеря данных приложения / SharedPreferences темы/wakelock).
2. Если у вас сохранён keystore от прошлой сборки (на другой машине / в CI / в облаке) — подложить его как `android/key.properties` + `*.jks`, и пересобрать.
3. Сменить applicationId (например, `com.tfd.general_converter.dev`) — поставится рядом, прошлая останется.

## Что осталось руками
- Решить вопрос с подписью / переустановкой.
- При желании — ручной перевод 6 новых ключей в `app_*.arb` для ru/uk/ja/zh/vi/de/fr/es/it/pt/pl/ko и т.д. (сейчас английский фоллбэк).
- `git stash list` — stash `local-improvements-2026-05-11` сохранён, не трогал.

## Коммит — НЕ делал (без подтверждения)
Готовое сообщение:
```
chore: sync local improvements onto 1.2.x base; bump to 1.2.1+6

- Material 3 theme rebuild + persisted dark mode via SharedPreferences
- Localized progress/status strings (statusPreparing/Converting/Done/Cancelled/BatchProgress)
- Image converter: gc_outputs/ temp dir with writable-probe + unique output counter
- PDF decode: close PdfPage in finally
- saveBatchItem: keep status=done on save error, surface via saveError instead of overwriting
- ConvertedFile.copyWith(clearCustomBaseName)
- File.copy() in _materializeRenamedCopy
- pickFolderImages: async Directory.list()
- PreviewThumbnailService: run decode/resize/encode in Isolate
- Image.file with cacheWidth/filterQuality across batch tile, result card, selected card
- Result card: cache lengthSync to avoid sync I/O in build
- p.basename instead of Platform.pathSeparator splits
- Disable Convert/ConvertBatch when allowedTargetFormats is empty
- _EmptyState polish + emptyStateHint subtitle
- ConvertButton: AnimatedSwitcher icon, scheme.onPrimary indicator color, keeps upstream onCancel
- conversion_status_banner + batch_summary_card polish (M3 chips/banners)
- Added test/converter/capability_matrix_test.dart for synthetic input→target matrix coverage
```

`git diff --stat HEAD` — см. `.sync-plan/final-diff-stat.txt`.
