import 'package:flutter/material.dart';

import '../constants/app_strings.dart';

class BatchSummaryCard extends StatelessWidget {
  const BatchSummaryCard({
    super.key,
    required this.total,
    required this.done,
    required this.failed,
    required this.queued,
    required this.onSaveAll,
    required this.onRetryFailed,
    required this.saveAllEnabled,
    required this.retryFailedEnabled,
    required this.isSavingAll,
    required this.saveProgress,
    required this.saveLabel,
  });

  final int total;
  final int done;
  final int failed;
  final int queued;
  final VoidCallback onSaveAll;
  final VoidCallback onRetryFailed;
  final bool saveAllEnabled;
  final bool retryFailedEnabled;
  final bool isSavingAll;
  final double saveProgress;
  final String saveLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppStrings.batchModeTitle,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _StatChip(
                    label: AppStrings.batchSummaryTotal,
                    value: total.toString(),
                  ),
                ),
                Expanded(
                  child: _StatChip(
                    label: AppStrings.batchSummaryDone,
                    value: done.toString(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _StatChip(
                    label: AppStrings.batchSummaryFailed,
                    value: failed.toString(),
                  ),
                ),
                Expanded(
                  child: _StatChip(
                    label: AppStrings.batchSummaryQueued,
                    value: queued.toString(),
                  ),
                ),
              ],
            ),
            if (isSavingAll) ...[
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: saveProgress.clamp(0.0, 1.0),
              ),
              const SizedBox(height: 4),
              Text(
                saveLabel,
                style: theme.textTheme.bodySmall,
              ),
            ],
            const SizedBox(height: 16),
            FilledButton.tonal(
              onPressed: saveAllEnabled ? onSaveAll : null,
              child: Text(AppStrings.saveAllSuccessful),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: retryFailedEnabled ? onRetryFailed : null,
              child: Text(AppStrings.retryFailed),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          Text(
            value,
            style: theme.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
