import 'package:flutter/material.dart';

class ConversionStatusBanner extends StatelessWidget {
  const ConversionStatusBanner({
    super.key,
    required this.message,
    required this.isError,
    this.onDismiss,
  });

  final String message;
  final bool isError;
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    return MaterialBanner(
      content: Text(message),
      backgroundColor:
          isError ? Theme.of(context).colorScheme.errorContainer : null,
      actions: [
        TextButton(
          onPressed: onDismiss,
          child: const Text('Dismiss'),
        ),
      ],
    );
  }
}
