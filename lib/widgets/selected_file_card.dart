import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SelectedFileCard extends StatelessWidget {
  const SelectedFileCard({super.key, required this.file});

  final File file;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Container(
              width: 72,
              height: 72,
              color: theme.colorScheme.surfaceContainerHighest,
              child: kIsWeb
                  ? Image.network(
                      file.path,
                      fit: BoxFit.cover,
                      errorBuilder: (_, error, stack) =>
                          const Icon(Icons.broken_image),
                    )
                  : Image.file(
                      file,
                      fit: BoxFit.cover,
                      errorBuilder: (_, error, stack) =>
                          const Icon(Icons.broken_image),
                    ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  file.path.split(Platform.pathSeparator).last,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall,
                ),
              ],
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
