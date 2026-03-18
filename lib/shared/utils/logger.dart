import 'dart:developer' as dev;

class AppLogger {
  static void info(String message, {String? tag}) {
    dev.log(message, name: tag ?? 'APP');
  }

  static void error(String message, {Object? error, StackTrace? stackTrace}) {
    dev.log(
      message,
      name: 'ERROR',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
