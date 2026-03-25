import 'package:flutter/material.dart';

import '../converter/models/image_format.dart';
import '../l10n/l10n_extensions.dart';

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
      return InputDecorator(
        decoration: InputDecoration(
          labelText: context.l10n.targetFormat,
          border: const OutlineInputBorder(),
        ),
        child: const SizedBox(height: 48, child: Center(child: Text('—'))),
      );
    }

    return InputDecorator(
      decoration: InputDecoration(
        labelText: context.l10n.targetFormat,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
