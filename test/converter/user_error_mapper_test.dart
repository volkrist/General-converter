import 'package:flutter_test/flutter_test.dart';
import 'package:general_converter/constants/app_strings.dart';
import 'package:general_converter/converter/user_error_mapper.dart';

void main() {
  test('known app Exception passes exact message', () {
    expect(
      UserErrorMapper.message(
        Exception(AppStrings.fileTooLarge),
        fallback: AppStrings.conversionFailed,
      ),
      AppStrings.fileTooLarge,
    );
  });

  test('unknown Exception uses fallback', () {
    expect(
      UserErrorMapper.message(
        Exception('SomePluginError: code 42'),
        fallback: AppStrings.saveFailed,
      ),
      AppStrings.saveFailed,
    );
  });

  test('FormatException uses fallback', () {
    expect(
      UserErrorMapper.message(
        const FormatException('bad'),
        fallback: AppStrings.conversionFailed,
      ),
      AppStrings.conversionFailed,
    );
  });
}
