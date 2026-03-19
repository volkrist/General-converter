import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_strings.dart';
import '../theme_view_model.dart';
import '../converter/viewmodels/converter_view_model.dart';
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

class _ConverterView extends StatelessWidget {
  const _ConverterView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Consumer<ConverterViewModel>(
      builder: (context, vm, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.appName),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                onPressed: () {
                  context.read<ThemeViewModel>().toggleTheme();
                },
                tooltip: AppStrings.toggleTheme,
              ),
            ],
          ),
          body: _buildBody(vm),
          floatingActionButton: PickImageFab(
            onPressed: vm.pickImage,
            isLoading: vm.isPicking,
          ),
        );
      },
    );
  }
}

Widget _buildBody(ConverterViewModel vm) {
  return Column(
    children: [
      if (vm.error != null)
        ConversionStatusBanner(
          message: vm.error!,
          isError: true,
          onDismiss: vm.clearError,
        ),
      Expanded(
        child: Padding(
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
                onChanged: vm.setFormat,
              ),
              const SizedBox(height: 24),
              ConvertButton(
                onPressed:
                    vm.selectedImage != null ? () => vm.convert() : null,
                isLoading: vm.isConverting,
                enabled: vm.selectedImage != null && !vm.isConverting,
              ),
              if (vm.result != null) ...[
                const SizedBox(height: 24),
                ResultPreviewCard(
                  file: vm.result!.file,
                  onSave: vm.save,
                ),
              ],
            ],
          ),
        ),
      ),
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
