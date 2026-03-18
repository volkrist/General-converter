import 'package:flutter/material.dart';

import '../../domain/entities/image_asset.dart';

class SelectedFileCard extends StatelessWidget {
  const SelectedFileCard({super.key, required this.image});

  final ImageAsset image;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: ListTile(
        leading: const Icon(Icons.image_outlined),
        title: Text(
          image.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '${image.format?.label ?? 'Unknown'} · ${image.sizeLabel}',
        ),
        trailing: Icon(
          Icons.check_circle,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}
