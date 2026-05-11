import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

import '../l10n/l10n_extensions.dart';

class ResultPreviewCard extends StatefulWidget {
  const ResultPreviewCard({
    super.key,
    required this.file,
    required this.fileName,
    required this.formatLabel,
    required this.onSave,
    required this.onRename,
    this.onShare,
    this.onOpen,
    this.isSaving = false,
    this.isSaved = false,
  });

  final File file;
  final String fileName;
  final String formatLabel;
  final VoidCallback onSave;
  final ValueChanged<String> onRename;
  final VoidCallback? onShare;
  final VoidCallback? onOpen;
  final bool isSaving;
  final bool isSaved;

  @override
  State<ResultPreviewCard> createState() => _ResultPreviewCardState();
}

class _ResultPreviewCardState extends State<ResultPreviewCard> {
  late final TextEditingController _nameController;
  int? _cachedFileSize;
  String? _cachedFileSizePath;

  bool get _usePlatformImagePreview {
    if (kIsWeb) return false;
    final ext = p.extension(widget.file.path).toLowerCase();
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

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: p.basenameWithoutExtension(widget.fileName));
  }

  @override
  void didUpdateWidget(covariant ResultPreviewCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    final nextBase = p.basenameWithoutExtension(widget.fileName);
    if (_nameController.text != nextBase) {
      _nameController.text = nextBase;
    }
    if (oldWidget.file.path != widget.file.path) {
      _cachedFileSize = null;
      _cachedFileSizePath = null;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  int _fileSizeBytes() {
    final cached = _cachedFileSize;
    if (cached != null && _cachedFileSizePath == widget.file.path) {
      return cached;
    }
    try {
      final size = widget.file.lengthSync();
      _cachedFileSize = size;
      _cachedFileSizePath = widget.file.path;
      return size;
    } catch (_) {
      return 0;
    }
  }

  String _humanSize(int bytes) {
    if (bytes <= 0) return '0 KB';
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    }
    return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final details = kIsWeb
        ? widget.formatLabel
        : '${widget.formatLabel} · ${_humanSize(_fileSizeBytes())}';

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 240),
            child: kIsWeb
                ? _NoPreviewPlaceholder(formatLabel: widget.formatLabel)
                : _usePlatformImagePreview
                    ? Image.file(
                        widget.file,
                        fit: BoxFit.contain,
                        cacheWidth: 1080,
                        filterQuality: FilterQuality.medium,
                        gaplessPlayback: true,
                        errorBuilder: (context, err, st) =>
                            _NoPreviewPlaceholder(
                                formatLabel: widget.formatLabel),
                      )
                    : _NoPreviewPlaceholder(formatLabel: widget.formatLabel),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: l10n.renameOutput,
                    hintText: l10n.renameHint,
                    border: const OutlineInputBorder(),
                    isDense: true,
                  ),
                  onChanged: widget.onRename,
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.fileName,
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
                    if (widget.onOpen != null)
                      IconButton(
                        onPressed: widget.onOpen,
                        icon: const Icon(Icons.open_in_new),
                        tooltip: l10n.open,
                      ),
                    if (widget.onShare != null)
                      IconButton(
                        onPressed: widget.onShare,
                        icon: const Icon(Icons.share),
                        tooltip: l10n.share,
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: widget.isSaved
                      ? Chip(
                          avatar: const Icon(Icons.check_circle, size: 18),
                          label: Text(l10n.saved),
                        )
                      : FilledButton.tonalIcon(
                          onPressed: widget.isSaving ? null : widget.onSave,
                          icon: widget.isSaving
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2),
                                )
                              : const Icon(Icons.save_alt),
                          label: Text(
                            widget.isSaving ? l10n.saving : l10n.save,
                          ),
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
    final l10n = context.l10n;
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
                l10n.previewNotAvailable,
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
