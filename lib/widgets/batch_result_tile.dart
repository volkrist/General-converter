import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

import '../converter/models/batch_item_state.dart';
import '../l10n/l10n_extensions.dart';

class BatchResultTile extends StatefulWidget {
  const BatchResultTile({
    super.key,
    required this.item,
    required this.onSave,
    required this.onRename,
    required this.onShare,
  });

  final BatchItemState item;
  final VoidCallback onSave;
  final ValueChanged<String> onRename;
  final VoidCallback onShare;

  @override
  State<BatchResultTile> createState() => _BatchResultTileState();
}

class _BatchResultTileState extends State<BatchResultTile> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.item.customBaseName ??
          p.basenameWithoutExtension(widget.item.sourceFile.path),
    );
  }

  @override
  void didUpdateWidget(covariant BatchResultTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    final nextValue = widget.item.customBaseName ??
        p.basenameWithoutExtension(widget.item.sourceFile.path);
    if (_controller.text != nextValue) {
      _controller.text = nextValue;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.l10n;
    final item = widget.item;
    final result = item.result;

    final subtitle = result == null
        ? item.errorMessage ?? item.status.name
        : '${result.format.label} · ${result.displayName}';

    return Card(
      child: ExpansionTile(
        leading: _buildLeading(context, item),
        title: Text(
          p.basename(item.sourceFile.path),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          subtitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        children: [
          if (item.previewFile != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                item.previewFile!,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) =>
                    _buildPreviewFallback(context, item),
              ),
            ),
            const SizedBox(height: 12),
          ] else ...[
            _buildPreviewFallback(context, item),
            const SizedBox(height: 12),
          ],
          if (result != null) ...[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: l10n.renameOutput,
                border: const OutlineInputBorder(),
                isDense: true,
              ),
              enabled: item.status != BatchItemStatus.saved &&
                  item.status != BatchItemStatus.saving,
              onSubmitted: widget.onRename,
              onEditingComplete: () {
                widget.onRename(_controller.text);
                FocusScope.of(context).unfocus();
              },
            ),
            const SizedBox(height: 12),
          ],
          if (item.errorMessage != null) ...[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                item.errorMessage!,
                style: TextStyle(color: colorScheme.error),
              ),
            ),
            const SizedBox(height: 8),
          ],
          if (item.saveError != null) ...[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                item.saveError!,
                style: TextStyle(color: colorScheme.error),
              ),
            ),
            const SizedBox(height: 8),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: result == null ? null : widget.onShare,
                icon: const Icon(Icons.share),
                tooltip: l10n.share,
              ),
              const SizedBox(width: 8),
              FilledButton.tonalIcon(
                onPressed: result == null ||
                        item.status == BatchItemStatus.saving ||
                        item.status == BatchItemStatus.saved
                    ? null
                    : widget.onSave,
                icon: Icon(
                  item.status == BatchItemStatus.saved
                      ? Icons.check_circle
                      : Icons.save_alt,
                ),
                label: Text(
                  item.status == BatchItemStatus.saved
                      ? l10n.saved
                      : item.status == BatchItemStatus.saving
                          ? l10n.saving
                          : l10n.save,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLeading(BuildContext context, BatchItemState item) {
    return CircleAvatar(
      child: Icon(_iconForStatus(item.status)),
    );
  }

  Widget _buildPreviewFallback(BuildContext context, BatchItemState item) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = context.l10n;
    final message = switch (item.status) {
      BatchItemStatus.failed ||
      BatchItemStatus.cancelled =>
        l10n.batchPreviewNoThumbnail,
      BatchItemStatus.queued || BatchItemStatus.converting =>
        l10n.batchPreviewWaiting,
      BatchItemStatus.done ||
      BatchItemStatus.saving ||
      BatchItemStatus.saved =>
        l10n.previewNotAvailable,
    };
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      alignment: Alignment.center,
      child: Text(
        message,
        style: TextStyle(color: colorScheme.onSurfaceVariant),
        textAlign: TextAlign.center,
      ),
    );
  }

  IconData _iconForStatus(BatchItemStatus status) {
    switch (status) {
      case BatchItemStatus.queued:
        return Icons.schedule;
      case BatchItemStatus.converting:
        return Icons.autorenew;
      case BatchItemStatus.done:
        return Icons.check_circle_outline;
      case BatchItemStatus.failed:
        return Icons.error_outline;
      case BatchItemStatus.saving:
        return Icons.save_alt;
      case BatchItemStatus.saved:
        return Icons.task_alt;
      case BatchItemStatus.cancelled:
        return Icons.cancel_outlined;
    }
  }
}
