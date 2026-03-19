import 'package:flutter/material.dart';

import '../models/image_format.dart';

class FormatDropdown extends StatelessWidget {
  const FormatDropdown({
    super.key,
    required this.selectedFormat,
    required this.onChanged,
  });

  final ImageFormat selectedFormat;
  final ValueChanged<ImageFormat> onChanged;

  @override
  Widget build(BuildContext context) {
    final items = ImageFormat.values.where((format) {
      // webp/heic/avif пока не поддерживаются core-конвертером
      return switch (format) {
        ImageFormat.webp => false,
        ImageFormat.heic => false,
        ImageFormat.avif => false,
        _ => true,
      };
    }).toList();

    return DropdownButtonFormField<ImageFormat>(
      initialValue: selectedFormat,
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
