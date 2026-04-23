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
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton.icon(
        onPressed: isLoading
            ? (onCancel)
            : (enabled && !isLoading ? onPressed : null),
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

// if (vm.isConverting || vm.isBatchConverting)
//                 TextButton.icon(
//                   onPressed: vm.cancelConvert,
//                   icon: const Icon(Icons.close),
//                   label: Text(l10n.cancel),
//                 )
