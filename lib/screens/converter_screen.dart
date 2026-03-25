import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../converter/models/batch_item_state.dart';
import '../converter/models/conversion_time_hint.dart';
import '../converter/viewmodels/converter_view_model.dart';
import '../l10n/l10n_extensions.dart';
import '../localization/language_names.dart';
import '../localization/locale_controller.dart';
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
      builder: (ctx) {
        final l = ctx.l10n;
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text(
                  l.pickFileTitle,
                  style: Theme.of(ctx).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: Text(l.pickFromGallery),
                onTap: () {
                  Navigator.pop(ctx);
                  vm.pickFromGallery();
                },
              ),
              ListTile(
                leading: const Icon(Icons.folder_open_outlined),
                title: Text(l.pickFromFiles),
                onTap: () {
                  Navigator.pop(ctx);
                  vm.pickFromFiles();
                },
              ),
              ListTile(
                leading: const Icon(Icons.layers_outlined),
                title: Text(l.pickManyFiles),
                onTap: () {
                  Navigator.pop(ctx);
                  vm.pickBatchFromFiles();
                },
              ),
              ListTile(
                leading: const Icon(Icons.folder_copy_outlined),
                title: Text(l.pickFolder),
                onTap: () {
                  Navigator.pop(ctx);
                  vm.pickBatchFromFolder();
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
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
          title: Text(ctx.l10n.errorDialogTitle),
          content: Text(current),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                vm.clearError();
                setState(() => _scheduledDialogForMessage = null);
              },
              child: Text(ctx.l10n.dismiss),
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

    return Consumer2<ConverterViewModel, LocaleController>(
      builder: (context, vm, localeVm, _) {
        _scheduleErrorDialogIfNeeded(context, vm);
        final l10n = context.l10n;

        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.appName),
            centerTitle: true,
            actions: [
              PopupMenuButton<String>(
                icon: const Icon(Icons.language_outlined),
                tooltip: l10n.language,
                onSelected: (code) {
                  if (code == '_system') {
                    localeVm.setLocaleOverride(null);
                  } else {
                    localeVm.setLocaleOverride(Locale(code));
                  }
                },
                itemBuilder: (ctx) {
                  final l = ctx.l10n;
                  final entries = <PopupMenuEntry<String>>[
                    CheckedPopupMenuItem<String>(
                      value: '_system',
                      checked: localeVm.localeOverride == null,
                      child: Text(l.systemLanguage),
                    ),
                    const PopupMenuDivider(),
                  ];
                  for (final loc in sortedSupportedLocales()) {
                    entries.add(
                      CheckedPopupMenuItem<String>(
                        value: loc.languageCode,
                        checked:
                            localeVm.localeOverride?.languageCode ==
                                loc.languageCode,
                        child: Text(localePickerLabel(loc)),
                      ),
                    );
                  }
                  return entries;
                },
              ),
              if (vm.isConverting || vm.isBatchConverting)
                TextButton.icon(
                  onPressed: vm.cancelConvert,
                  icon: const Icon(Icons.close),
                  label: Text(l10n.cancel),
                ),
              IconButton(
                icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                onPressed: () {
                  context.read<ThemeViewModel>().toggleTheme();
                },
                tooltip: l10n.toggleTheme,
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

String? _localizedConversionHint(
  BuildContext context,
  ConversionTimeHint? kind,
) {
  if (kind == null) return null;
  final l = context.l10n;
  switch (kind) {
    case ConversionTimeHint.quick:
      return l.conversionHintQuick;
    case ConversionTimeHint.heavy:
      return l.conversionHintHeavy;
    case ConversionTimeHint.pdf:
      return l.conversionHintPdf;
  }
}

Widget _buildBody(BuildContext context, ConverterViewModel vm) {
  final theme = Theme.of(context);
  final l10n = context.l10n;
  final convertingLine =
      '${l10n.converting} ${vm.conversionElapsedLabel}'.trim();

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
                  vm.progressLabel.isEmpty ? convertingLine : vm.progressLabel,
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
  final l10n = context.l10n;
  final hint = _localizedConversionHint(context, vm.conversionTimeHintKind);
  final convertingLine =
      '${l10n.converting} ${vm.conversionElapsedLabel}'.trim();

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
        if (hint != null) ...[
          const SizedBox(height: 8),
          Text(
            hint,
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
          loadingLabel: convertingLine,
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
  final l10n = context.l10n;

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
        l10n.batchModeSubtitle,
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
          label: Text(l10n.clearBatchQueue),
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
          '${l10n.convertBatch} (${vm.batchSummary})',
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
            context.l10n.tapToPick,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
