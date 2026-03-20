import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/app_strings.dart';

class ResultPreviewCard extends StatelessWidget {
  const ResultPreviewCard({
    super.key,
    required this.file,
    required this.formatLabel,
    required this.onSave,
    this.onShare,
    this.isSaving = false,
    this.isSaved = false,
  });

  final File file;
  final String formatLabel;
  final VoidCallback onSave;
  final VoidCallback? onShare;
  final bool isSaving;
  final bool isSaved;

  @override
  Widget build(BuildContext context) {
    final details = kIsWeb
        ? formatLabel
        : '$formatLabel · ${(file.lengthSync() / 1024).toStringAsFixed(1)} KB';

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 240),
            child: kIsWeb
                ? Image.network(
                    file.path,
                    fit: BoxFit.contain,
                    errorBuilder: (_, error, stack) => const SizedBox(
                      height: 120,
                      child: Center(child: Icon(Icons.broken_image, size: 48)),
                    ),
                  )
                : Image.file(
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
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    details,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                if (onShare != null)
                  IconButton(
                    onPressed: onShare,
                    icon: const Icon(Icons.share),
                    tooltip: AppStrings.share,
                  ),
                const SizedBox(width: 8),
                if (isSaved)
                  const Chip(
                    avatar: Icon(Icons.check_circle, size: 18),
                    label: Text(AppStrings.saved),
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
                    label: Text(
                      isSaving ? AppStrings.saving : AppStrings.save,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
