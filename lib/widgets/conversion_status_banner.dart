import 'package:flutter/material.dart';

import '../constants/app_strings.dart';

class ConversionStatusBanner extends StatelessWidget {
  const ConversionStatusBanner({
    super.key,
    required this.message,
    this.isError = false,
    this.isWarning = false,
    this.onDismiss,
  });

  final String message;
  final bool isError;
  final bool isWarning;
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final Color? bg = isError
        ? scheme.errorContainer
        : isWarning
            ? scheme.tertiaryContainer
            : null;

    return MaterialBanner(
      content: Text(message),
      backgroundColor: bg,
      actions: [
        TextButton(
          onPressed: onDismiss,
          child: const Text(AppStrings.dismiss),
        ),
      ],
    );
  }
}
