import 'dart:io';

import '../../../constants/app_strings.dart';

/// Проверка результата после записи на диск.
abstract final class OutputFileValidator {
  static Future<void> assertValid(File file) async {
    if (!await file.exists()) {
      throw Exception(AppStrings.outputFileEmpty);
    }
    final int len;
    try {
      len = await file.length();
    } catch (_) {
      throw Exception(AppStrings.outputFileEmpty);
    }
    if (len <= 0) {
      try {
        await file.delete();
      } catch (_) {}
      throw Exception(AppStrings.outputFileEmpty);
    }
  }
}
