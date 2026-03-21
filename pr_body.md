## Summary
- Restructured lib/ from nested app/features/shared to flat template-style layout (models/, services/, repositories/, usecases/, viewmodels/, screens/, widgets/, utils/, constants/)
- Moved 35 files with all imports updated
- Added 7 converter screen widget tests verifying FAB, dropdown, convert button, empty state

## What changed
- lib/app/ -> root-level app.dart, bootstrap.dart, router.dart, app_theme.dart, providers.dart
- lib/features/converter/domain/ -> lib/models/, lib/repositories/, lib/usecases/
- lib/features/converter/data/ -> lib/services/, lib/repositories/
- lib/features/converter/presentation/ -> lib/screens/, lib/viewmodels/, lib/widgets/
- lib/shared/ -> lib/constants/, lib/utils/, lib/widgets/
- test/ restructured to mirror new lib/ layout

## Verification
- flutter analyze: 0 issues
- flutter test: 21/21 passed
- flutter build apk --debug: builds successfully
- Tested on Android emulator (Pixel 7, API 35): app starts and renders correctly
