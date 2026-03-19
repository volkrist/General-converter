import 'dart:io';

import 'package:flutter/material.dart';

class ResultPreviewCard extends StatelessWidget {
  const ResultPreviewCard({
    super.key,
    required this.file,
    required this.onSave,
  });

  final File file;
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
              file,
              fit: BoxFit.contain,
              errorBuilder: (_, error, stack) => const SizedBox(
                height: 120,
                child: Center(child: Icon(Icons.broken_image, size: 48)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.centerRight,
              child: FilledButton.tonalIcon(
                onPressed: onSave,
                icon: const Icon(Icons.save_alt),
                label: const Text('Save'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
