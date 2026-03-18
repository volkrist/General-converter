import 'package:flutter/material.dart';

class PickImageFab extends StatelessWidget {
  const PickImageFab({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: 'Pick image',
      child: const Icon(Icons.add_photo_alternate_outlined),
    );
  }
}
