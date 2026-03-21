import '../constants/app_strings.dart';

/// Сообщения для баннера: только то, что мы сами кладём в [Exception],
/// иначе — общий [fallback] (без угадывания по substring из плагинов).
abstract final class UserErrorMapper {
  /// При новом `throw Exception(AppStrings.…)` — добавь строку сюда, иначе уйдёт в [fallback].
  static final Set<String> _knownAppMessages = {
    AppStrings.fileTooLarge,
    AppStrings.formatPairNotSupported,
    AppStrings.unsupportedInputFormat,
    AppStrings.notEnoughMemory,
    AppStrings.conversionFailed,
    AppStrings.invalidOrCorruptImage,
    AppStrings.invalidImageDimensions,
    AppStrings.failedToDecodeHeic,
    AppStrings.failedToEncodeHeic,
    AppStrings.failedToEncodeAvif,
    AppStrings.pdfRenderUnavailable,
    AppStrings.outputFileEmpty,
    AppStrings.savePdfFailed,
    AppStrings.saveFailed,
  };

  static String message(Object error, {required String fallback}) {
    final s = error.toString();
    if (s.startsWith('Exception: ')) {
      final inner = s.substring('Exception: '.length).trim();
      if (_knownAppMessages.contains(inner)) {
        return inner;
      }
    }
    return fallback;
  }
}
