import 'dart:io';

import 'package:flutter/material.dart';

import '../models/conversion_result.dart';

class ResultPreviewCard extends StatelessWidget {
  const ResultPreviewCard({
    super.key,
    required this.result,
    required this.onSave,
    this.isSaving = false,
    this.isSaved = false,
  });

  final ConversionResult result;
  final VoidCallback onSave;
  final bool isSaving;
  final bool isSaved;

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
              errorBuilder: (_, error, stack) => const SizedBox(
                height: 120,
                child: Center(child: Icon(Icons.broken_image, size: 48)),
              ),
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
                if (isSaved)
                  const Chip(
                    avatar: Icon(Icons.check_circle, size: 18),
                    label: Text('Saved'),
                  )
                else
                  FilledButton.tonalIcon(
                    onPressed: isSaving ? null : onSave,
                    icon: isSaving
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.save_alt),
                    label: Text(isSaving ? 'Saving...' : 'Save'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
