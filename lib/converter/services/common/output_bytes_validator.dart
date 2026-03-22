import 'dart:typed_data';

import '../../../constants/app_strings.dart';

/// Проверка результата в памяти (Web и общие пути без [dart:io]).
abstract final class OutputBytesValidator {
  static void assertNonEmpty(Uint8List bytes) {
    if (bytes.isEmpty) {
      throw Exception(AppStrings.outputFileEmpty);
    }
  }
}
