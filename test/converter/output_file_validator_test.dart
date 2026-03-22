import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:general_converter/constants/app_strings.dart';
import 'package:general_converter/converter/services/common/output_file_validator.dart';
import 'package:path/path.dart' as p;

void main() {
  test('zero-length file throws outputFileEmpty', () async {
    final f = File(
      p.join(
        Directory.systemTemp.path,
        'out_zero_${DateTime.now().microsecondsSinceEpoch}.bin',
      ),
    );
    await f.writeAsBytes(<int>[0]);
    final raf = await f.open(mode: FileMode.write);
    await raf.truncate(0);
    await raf.close();
    expect(
      () => OutputFileValidator.assertValid(f),
      throwsA(
        isA<Exception>().having(
          (e) => e.toString(),
          'toString',
          contains(AppStrings.outputFileEmpty),
        ),
      ),
    );
    await f.delete();
  });

  test('non-existent file throws outputFileEmpty', () async {
    final f = File('/nonexistent/path/result_${DateTime.now().millisecondsSinceEpoch}.bin');
    expect(
      () => OutputFileValidator.assertValid(f),
      throwsA(
        isA<Exception>().having(
          (e) => e.toString(),
          'msg',
          contains(AppStrings.outputFileEmpty),
        ),
      ),
    );
  });
}
