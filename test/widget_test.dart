import 'package:flutter_test/flutter_test.dart';

import 'package:general_converter/app/app.dart';

void main() {
  testWidgets('App renders converter screen', (WidgetTester tester) async {
    await tester.pumpWidget(const GeneralConverterApp());
    expect(find.text('General Converter'), findsOneWidget);
  });
}
