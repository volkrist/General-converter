import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:general_converter/app.dart';
import 'package:general_converter/converter/converter_capabilities.dart';
import 'package:general_converter/models/image_format.dart';

void main() {
  group('ConverterScreen after refactoring', () {
    testWidgets('app starts and shows title', (tester) async {
      await tester.pumpWidget(const GeneralConverterApp());
      expect(find.text('General Converter'), findsOneWidget);
    });

    testWidgets('FAB is present with correct icon', (tester) async {
      await tester.pumpWidget(const GeneralConverterApp());
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('empty state hint is shown when no image selected',
        (tester) async {
      await tester.pumpWidget(const GeneralConverterApp());
      expect(find.text('Tap to pick a file'), findsOneWidget);
    });

    testWidgets('format dropdown is present with all formats', (tester) async {
      await tester.pumpWidget(const GeneralConverterApp());

      final dropdownFinder = find.byType(DropdownButton<ImageFormat>);
      expect(dropdownFinder, findsOneWidget);
    });

    testWidgets('convert button is present and initially disabled',
        (tester) async {
      await tester.pumpWidget(const GeneralConverterApp());

      final buttonFinder = find.widgetWithText(FilledButton, 'Convert');
      expect(buttonFinder, findsOneWidget);

      final button = tester.widget<FilledButton>(buttonFinder);
      expect(button.onPressed, isNull);
    });

    testWidgets('dropdown opens and shows all format options', (tester) async {
      await tester.pumpWidget(const GeneralConverterApp());

      await tester.tap(find.byType(DropdownButton<ImageFormat>));
      await tester.pumpAndSettle();

      for (final format in ConverterCapabilities.supportedOutputFormats) {
        expect(find.text(format.label), findsWidgets);
      }
    });

    testWidgets('tapping FAB opens pick source sheet', (tester) async {
      await tester.pumpWidget(const GeneralConverterApp());

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.text('Choose source'), findsOneWidget);
      expect(find.text('Gallery'), findsOneWidget);
      expect(find.text('Files'), findsOneWidget);
    });
  });
}
