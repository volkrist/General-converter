import 'package:flutter/material.dart';

import '../converter/converter_capabilities.dart';
import '../converter/models/image_format.dart';

class FormatDropdown extends StatelessWidget {
  const FormatDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final ImageFormat value;
  final ValueChanged<ImageFormat> onChanged;

  @override
  Widget build(BuildContext context) {
    final items = ConverterCapabilities.supportedOutputFormats;

    return DropdownButtonFormField<ImageFormat>(
      initialValue: value,
      decoration: const InputDecoration(
        labelText: 'Target format',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      items: items.map((format) {
        return DropdownMenuItem(
          value: format,
          child: Text(format.label),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) onChanged(value);
      },
    );
  }
}
