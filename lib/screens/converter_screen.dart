import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_strings.dart';
import '../converter/models/batch_item_state.dart';
import '../converter/viewmodels/converter_view_model.dart';
import '../theme_view_model.dart';
import '../widgets/batch_result_tile.dart';
import '../widgets/batch_summary_card.dart';
import '../widgets/conversion_status_banner.dart';
import '../widgets/convert_button.dart';
import '../widgets/format_dropdown.dart';
import '../widgets/pick_image_fab.dart';
import '../widgets/result_preview_card.dart';
import '../widgets/selected_file_card.dart';

class ConverterScreen extends StatelessWidget {
  const ConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ConverterView();
  }
}

class _ConverterView extends StatefulWidget {
  const _ConverterView();

  @override
  State<_ConverterView> createState() => _ConverterViewState();
}

class _ConverterViewState extends State<_ConverterView> {
  String? _scheduledDialogForMessage;

  void _showPickSourceSheet(BuildContext context, ConverterViewModel vm) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Text(
                AppStrings.pickFileTitle,
                style: Theme.of(ctx).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: Text(AppStrings.pickFromGallery),
              onTap: () {
                Navigator.pop(ctx);
                vm.pickFromGallery();
              },
            ),
            ListTile(
              leading: const Icon(Icons.folder_open_outlined),
              title: Text(AppStrings.pickFromFiles),
              onTap: () {
                Navigator.pop(ctx);
                vm.pickFromFiles();
              },
            ),
            ListTile(
              leading: const Icon(Icons.layers_outlined),
              title: Text(AppStrings.pickManyFiles),
              onTap: () {
                Navigator.pop(ctx);
                vm.pickBatchFromFiles();
              },
            ),
            ListTile(
              leading: const Icon(Icons.folder_copy_outlined),
              title: Text(AppStrings.pickFolder),
              onTap: () {
                Navigator.pop(ctx);
                vm.pickBatchFromFolder();
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _scheduleErrorDialogIfNeeded(
    BuildContext context,
    ConverterViewModel vm,
  ) {
    final message = vm.dialogError;
    if (message == null) {
      _scheduledDialogForMessage = null;
      return;
    }
    if (message == _scheduledDialogForMessage) return;
    _scheduledDialogForMessage = message;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!context.mounted) return;
      final current = vm.dialogError;
      if (current == null || current != message) return;

      await showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error'),
          content: Text(current),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                vm.clearError();
                setState(() => _scheduledDialogForMessage = null);
              },
              child: const Text(AppStrings.dismiss),
            ),
          ],
        ),
      );
      if (mounted && vm.dialogError == null) {
        setState(() => _scheduledDialogForMessage = null);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Consumer<ConverterViewModel>(
      builder: (context, vm, _) {
        _scheduleErrorDialogIfNeeded(context, vm);

        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.appName),
            centerTitle: true,
            actions: [
              if (vm.isConverting || vm.isBatchConverting)
                TextButton.icon(
                  onPressed: vm.cancelConvert,
                  icon: const Icon(Icons.close),
                  label: const Text(AppStrings.cancel),
                ),
              IconButton(
                icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                onPressed: () {
                  context.read<ThemeViewModel>().toggleTheme();
                },
                tooltip: AppStrings.toggleTheme,
              ),
            ],
          ),
          body: _buildBody(context, vm),
          floatingActionButton: PickImageFab(
            onPressed: () => _showPickSourceSheet(context, vm),
            isLoading: vm.isPicking,
          ),
        );
      },
    );
  }
}

Widget _buildBody(BuildContext context, ConverterViewModel vm) {
  final theme = Theme.of(context);

  return Column(
    children: [
      if (vm.error != null)
        ConversionStatusBanner(
          message: vm.error!,
          isError: true,
          onDismiss: vm.clearError,
        ),
      if (vm.warningMessage != null)
        ConversionStatusBanner(
          message: vm.warningMessage!,
          isWarning: true,
          onDismiss: vm.clearWarning,
        ),
      if (vm.isConverting || vm.isBatchConverting)
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: vm.progress <= 0 || vm.progress >= 1 ? null : vm.progress,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  vm.progressLabel.isEmpty
                      ? vm.convertingProgressLabel
                      : vm.progressLabel,
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      Expanded(
        child: vm.screenMode == ConverterScreenMode.batch && vm.hasBatchItems
            ? _buildBatchSection(context, vm)
            : _buildSingleSection(context, vm),
      ),
    ],
  );
}

Widget _buildSingleSection(BuildContext context, ConverterViewModel vm) {
  final theme = Theme.of(context);

  return Padding(
    padding: const EdgeInsets.all(16),
    child: ListView(
      children: [
        if (vm.selectedImage != null)
          SelectedFileCard(file: vm.selectedImage!)
        else
          const _EmptyState(),
        const SizedBox(height: 16),
        FormatDropdown(
          value: vm.selectedFormat,
          allowedFormats: vm.allowedTargetFormats,
          onChanged: vm.setFormat,
        ),
        if (vm.conversionTimeHint != null) ...[
          const SizedBox(height: 8),
          Text(
            vm.conversionTimeHint!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
        const SizedBox(height: 24),
        ConvertButton(
          onPressed: vm.selectedImage != null && !vm.isBatchConverting
              ? () => vm.convert()
              : null,
          isLoading: vm.isConverting,
          enabled: vm.selectedImage != null && !vm.isBatchConverting,
          loadingLabel: vm.convertingProgressLabel,
        ),
        if (vm.result != null) ...[
          const SizedBox(height: 24),
          ResultPreviewCard(
            file: vm.result!.file,
            fileName: vm.result!.displayName,
            formatLabel: vm.result!.format.label,
            onSave: vm.save,
            onOpen: vm.openResultExternally,
            onShare: vm.shareResult,
            onRename: vm.renameOutputBase,
            isSaving: vm.isSaving,
            isSaved: vm.isSaved,
          ),
        ],
      ],
    ),
  );
}

Widget _buildBatchSection(BuildContext context, ConverterViewModel vm) {
  final theme = Theme.of(context);

  final saveAllEnabled = !vm.isBatchConverting &&
      !vm.isBatchSavingAll &&
      vm.batchItems.any((e) => e.status == BatchItemStatus.done);
  final retryFailedEnabled = !vm.isBatchConverting &&
      !vm.isBatchSavingAll &&
      vm.batchFailedCount > 0;

  return ListView(
    padding: const EdgeInsets.all(16),
    children: [
      Text(
        AppStrings.batchModeSubtitle,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
      const SizedBox(height: 8),
      Align(
        alignment: Alignment.centerLeft,
        child: TextButton.icon(
          onPressed: vm.isBatchConverting || vm.isBatchSavingAll
              ? null
              : () => vm.clearBatch(deleteOutputs: true),
          icon: const Icon(Icons.clear_all),
          label: Text(AppStrings.clearBatchQueue),
        ),
      ),
      const SizedBox(height: 8),
      FormatDropdown(
        value: vm.selectedFormat,
        allowedFormats: vm.allowedTargetFormats,
        onChanged: vm.setFormat,
      ),
      const SizedBox(height: 16),
      FilledButton.tonalIcon(
        onPressed: vm.batchItems.isEmpty ||
                vm.isConverting ||
                vm.isBatchConverting ||
                vm.isBatchSavingAll
            ? null
            : () => vm.convertBatch(),
        icon: const Icon(Icons.layers),
        label: Text(
          '${AppStrings.convertBatch} (${vm.batchSummary})',
        ),
      ),
      const SizedBox(height: 16),
      BatchSummaryCard(
        total: vm.batchTotal,
        done: vm.batchDoneCount,
        failed: vm.batchFailedCount,
        queued: vm.batchQueuedCount,
        onSaveAll: () => vm.saveAllBatchSuccessful(),
        onRetryFailed: () => vm.retryFailedBatchItems(),
        saveAllEnabled: saveAllEnabled,
        retryFailedEnabled: retryFailedEnabled,
        isSavingAll: vm.isBatchSavingAll,
        saveProgress: vm.batchSaveProgress,
        saveLabel: vm.batchSaveLabel,
      ),
      const SizedBox(height: 16),
      ...List.generate(vm.batchItems.length, (index) {
        final item = vm.batchItems[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: BatchResultTile(
            item: item,
            onSave: () => vm.saveBatchItem(index),
            onRename: (value) => vm.renameBatchItem(index, value),
            onShare: () => vm.shareBatchItem(index),
          ),
        );
      }),
    ],
  );
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48),
      alignment: Alignment.center,
      child: Column(
        children: [
          Icon(
            Icons.add_photo_alternate_outlined,
            size: 64,
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
          ),
          const SizedBox(height: 12),
          Text(
            AppStrings.tapToPick,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
