import 'package:flutter/material.dart';

import '../l10n/l10n_extensions.dart';

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
    final theme = Theme.of(context);

    final Color bg;
    final Color fg;
    final IconData icon;
    if (isError) {
      bg = scheme.errorContainer;
      fg = scheme.onErrorContainer;
      icon = Icons.error_outline;
    } else if (isWarning) {
      bg = scheme.tertiaryContainer;
      fg = scheme.onTertiaryContainer;
      icon = Icons.warning_amber_outlined;
    } else {
      bg = scheme.surfaceContainerHigh;
      fg = scheme.onSurface;
      icon = Icons.info_outline;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: Material(
        color: bg,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 4, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 20, color: fg),
              const SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Text(
                    message,
                    style: theme.textTheme.bodyMedium?.copyWith(color: fg),
                  ),
                ),
              ),
              if (onDismiss != null)
                IconButton(
                  visualDensity: VisualDensity.compact,
                  iconSize: 18,
                  tooltip: context.l10n.dismiss,
                  onPressed: onDismiss,
                  icon: Icon(Icons.close, color: fg),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
