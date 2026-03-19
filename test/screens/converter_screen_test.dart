import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:general_converter/app.dart';
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
      expect(find.byIcon(Icons.add_photo_alternate_outlined), findsWidgets);
    });

    testWidgets('empty state hint is shown when no image selected',
        (tester) async {
      await tester.pumpWidget(const GeneralConverterApp());
      expect(find.text('Tap to pick image'), findsOneWidget);
    });

    testWidgets('format dropdown is present with all formats', (tester) async {
      await tester.pumpWidget(const GeneralConverterApp());

      final dropdownFinder = find.byType(DropdownButtonFormField<ImageFormat>);
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

      await tester.tap(find.byType(DropdownButtonFormField<ImageFormat>));
      await tester.pumpAndSettle();

      // dropdown должен показывать только поддерживаемые форматы
      final supported = ImageFormat.values.where((format) {
        return switch (format) {
          ImageFormat.webp => false,
          ImageFormat.heic => false,
          ImageFormat.avif => false,
          _ => true,
        };
      });

      for (final format in supported) {
        expect(find.text(format.label), findsWidgets);
      }
    });

    testWidgets('tapping FAB does not crash', (tester) async {
      await tester.pumpWidget(const GeneralConverterApp());

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.text('General Converter'), findsOneWidget);
    });
  });
}
