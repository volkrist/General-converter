import 'package:flutter/material.dart';
import 'package:general_converter/constants/app_strings.dart';

class PickImageFab extends StatelessWidget {
  const PickImageFab({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: isLoading ? null : onPressed,
      tooltip: AppStrings.pickImage,
      shape: const CircleBorder(),
      child: isLoading
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2.5),
            )
          : const Icon(Icons.add),
    );
  }
}
