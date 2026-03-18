import 'dart:io';

import 'package:flutter/material.dart';

import '../../domain/entities/image_asset.dart';

class SelectedFileCard extends StatelessWidget {
  const SelectedFileCard({super.key, required this.image});

  final ImageAsset image;

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
              child: Image.file(
                File(image.path),
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
                  image.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall,
                ),
                const SizedBox(height: 4),
                Text(
                  '${image.format?.label ?? 'Unknown'} · ${image.sizeLabel}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
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
