import 'package:flutter/material.dart';

import '../l10n/l10n_extensions.dart';

class ConvertButton extends StatelessWidget {
  const ConvertButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
    required this.enabled,
    this.loadingLabel,
    this.onCancel,
    this.showCancelWhileLoading = true,
  });

  final VoidCallback? onPressed;
  final bool isLoading;
  final bool enabled;
  final VoidCallback? onCancel;
  final bool showCancelWhileLoading;

  /// Текст во время конвертации (например с секундомером `Converting... 00:03`).
  final String? loadingLabel;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton.icon(
        onPressed: isLoading
            ? onCancel
            : (enabled && !isLoading ? onPressed : null),
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, anim) =>
              ScaleTransition(scale: anim, child: child),
          child: isLoading
              ? SizedBox(
                  key: const ValueKey('loading'),
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: scheme.onPrimary,
                  ),
                )
              : const Icon(Icons.transform, key: ValueKey('icon')),
        ),
        label: Text(
          isLoading
              ? (showCancelWhileLoading
                    ? context.l10n.cancel
                    : (loadingLabel ?? context.l10n.converting))
              : context.l10n.convert,
        ),
      ),
    );
  }
}
