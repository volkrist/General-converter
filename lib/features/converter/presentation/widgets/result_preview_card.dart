import 'dart:io';

import 'package:flutter/material.dart';

import '../../domain/entities/conversion_result.dart';

class ResultPreviewCard extends StatelessWidget {
  const ResultPreviewCard({
    super.key,
    required this.result,
    required this.onSave,
  });

  final ConversionResult result;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 240),
            child: Image.file(
              File(result.outputPath),
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${result.format.label} · ${(result.sizeBytes / 1024).toStringAsFixed(1)} KB',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                FilledButton.tonalIcon(
                  onPressed: onSave,
                  icon: const Icon(Icons.save_alt),
                  label: const Text('Save'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
