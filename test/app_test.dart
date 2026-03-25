import 'package:flutter_test/flutter_test.dart';

import 'package:general_converter/app.dart';
import 'package:general_converter/screens/converter_screen.dart';

void main() {
  testWidgets('App renders converter screen', (WidgetTester tester) async {
    await tester.pumpWidget(const GeneralConverterApp());
    await tester.pumpAndSettle();
    expect(find.byType(ConverterScreen), findsOneWidget);
  });
}
