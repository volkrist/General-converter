import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

import '../constants/app_strings.dart';
import '../converter/models/image_format.dart';
import '../converter/services/image_save_policy.dart';

class ResultPreviewCard extends StatelessWidget {
  const ResultPreviewCard({
    super.key,
    required this.file,
    required this.formatLabel,
    required this.resultFormat,
    required this.onSave,
    this.onShare,
    this.onOpen,
    this.isSaving = false,
    this.isSaved = false,
  });

  final File file;
  final String formatLabel;
  /// Формат результата — определяет подпись кнопки (gallery vs export).
  final ImageFormat resultFormat;
  final VoidCallback onSave;
  final VoidCallback? onShare;
  final VoidCallback? onOpen;
  final bool isSaving;
  final bool isSaved;

  /// Android [Image.file] часто не умеет TIFF/HEIC/PDF — показываем заглушку.
  bool get _usePlatformImagePreview {
    if (kIsWeb) return false;
    final ext = p.extension(file.path).toLowerCase();
    const noPreview = {
      '.tiff',
      '.tif',
      '.heic',
      '.heif',
      '.avif',
      '.pdf',
    };
    return !noPreview.contains(ext);
  }

  String get _saveLabel => ImageSavePolicy.useGalleryImageApi(resultFormat)
      ? AppStrings.saveToGallery
      : AppStrings.exportFile;

  String get _savingLabel => ImageSavePolicy.useGalleryImageApi(resultFormat)
      ? AppStrings.saving
      : AppStrings.exporting;

  @override
  Widget build(BuildContext context) {
    final name = p.basename(file.path);
    final details = kIsWeb
        ? formatLabel
        : '$formatLabel · ${(file.lengthSync() / 1024).toStringAsFixed(1)} KB';

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 240),
            child: kIsWeb
                ? Image.network(
                    file.path,
                    fit: BoxFit.contain,
                    errorBuilder: (_, error, stack) => const SizedBox(
                      height: 120,
                      child: Center(child: Icon(Icons.broken_image, size: 48)),
                    ),
                  )
                : _usePlatformImagePreview
                    ? Image.file(
                        file,
                        fit: BoxFit.contain,
                        errorBuilder: (_, error, stack) =>
                            _NoPreviewPlaceholder(formatLabel: formatLabel),
                      )
                    : _NoPreviewPlaceholder(formatLabel: formatLabel),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        details,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                if (onOpen != null)
                  IconButton(
                    onPressed: onOpen,
                    icon: const Icon(Icons.open_in_new),
                    tooltip: AppStrings.open,
                  ),
                if (onShare != null)
                  IconButton(
                    onPressed: onShare,
                    icon: const Icon(Icons.share),
                    tooltip: AppStrings.share,
                  ),
                const SizedBox(width: 8),
                if (isSaved)
                  const Chip(
                    avatar: Icon(Icons.check_circle, size: 18),
                    label: Text(AppStrings.saved),
                  )
                else
                  FilledButton.tonalIcon(
                    onPressed: isSaving ? null : onSave,
                    icon: isSaving
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.save_alt),
                    label: Text(
                      isSaving ? _savingLabel : _saveLabel,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NoPreviewPlaceholder extends StatelessWidget {
  const _NoPreviewPlaceholder({required this.formatLabel});

  final String formatLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 160,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.image_not_supported_outlined,
                size: 48,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              const SizedBox(height: 8),
              Text(
                formatLabel,
                style: theme.textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                AppStrings.previewNotAvailable,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
