import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

class SelectedFileCard extends StatelessWidget {
  const SelectedFileCard({super.key, required this.file});

  final File file;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPdf = file.path.toLowerCase().endsWith('.pdf');

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            color: theme.colorScheme.surfaceContainerHighest,
            child: isPdf
                ? Icon(
                    Icons.picture_as_pdf,
                    size: 40,
                    color: theme.colorScheme.error,
                  )
                : kIsWeb
                    ? Image.network(
                        file.path,
                        fit: BoxFit.cover,
                        errorBuilder: (_, error, stack) =>
                            const Icon(Icons.broken_image),
                      )
                    : Image.file(
                        file,
                        fit: BoxFit.cover,
                        cacheWidth: 216,
                        filterQuality: FilterQuality.low,
                        gaplessPlayback: true,
                        errorBuilder: (_, error, stack) =>
                            const Icon(Icons.broken_image),
                      ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                p.basename(file.path),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleSmall,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              Icons.check_circle,
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
