import 'package:flutter/material.dart';

import '../constants/app_strings.dart';
import '../converter/models/image_format.dart';

/// Список целей задаёт только ViewModel ([ConverterViewModel.allowedTargetFormats]),
/// сюда не дублировать свою логику матрицы/форматов.
class FormatDropdown extends StatelessWidget {
  const FormatDropdown({
    super.key,
    required this.value,
    required this.onChanged,
    required this.allowedFormats,
  });

  final ImageFormat value;
  final ValueChanged<ImageFormat> onChanged;
  final List<ImageFormat> allowedFormats;

  @override
  Widget build(BuildContext context) {
    final items = allowedFormats;
    if (items.isEmpty) {
      return const InputDecorator(
        decoration: InputDecoration(
          labelText: AppStrings.targetFormat,
          border: OutlineInputBorder(),
        ),
        child: SizedBox(height: 48, child: Center(child: Text('—'))),
      );
    }

    return InputDecorator(
      decoration: const InputDecoration(
        labelText: AppStrings.targetFormat,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<ImageFormat>(
          isExpanded: true,
          value: items.contains(value) ? value : items.first,
          items: items.map((format) {
            return DropdownMenuItem<ImageFormat>(
              value: format,
              child: Text(format.label),
            );
          }).toList(),
          onChanged: (v) {
            if (v != null) onChanged(v);
          },
        ),
      ),
    );
  }
}
