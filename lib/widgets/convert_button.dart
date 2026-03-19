import 'package:flutter/material.dart';

class ConvertButton extends StatelessWidget {
  const ConvertButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
    required this.enabled,
  });

  final VoidCallback? onPressed;
  final bool isLoading;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton.icon(
        onPressed: enabled && !isLoading ? onPressed : null,
        icon: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : const Icon(Icons.transform),
        label: Text(isLoading ? 'Converting...' : 'Convert'),
      ),
    );
  }
}
