import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../constants/app_strings.dart';
import '../theme_view_model.dart';
import '../viewmodels/converter_view_model.dart';
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

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
      body: Consumer<ConverterViewModel>(
        builder: (context, vm, _) {
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
                        SelectedFileCard(image: vm.selectedImage!)
                      else
                        _EmptyState(),
                      const SizedBox(height: 16),
                      FormatDropdown(
                        selectedFormat: vm.targetFormat,
                        onChanged: vm.setTargetFormat,
                      ),
                      const SizedBox(height: 24),
                      ConvertButton(
                        onPressed: vm.convert,
                        isLoading: vm.isConverting,
                        enabled: vm.canConvert,
                      ),
                      if (vm.result != null) ...[
                        const SizedBox(height: 24),
                        ResultPreviewCard(
                          result: vm.result!,
                          onSave: vm.saveResult,
                          onShare: () {
                            SharePlus.instance.share(
                              ShareParams(
                                files: [XFile(vm.result!.outputPath)],
                                subject: 'Converted with General Converter',
                              ),
                            );
                          },
                          isSaving: vm.isSaving,
                          isSaved: vm.savedPath != null,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Consumer<ConverterViewModel>(
        builder: (context, vm, _) {
          return PickImageFab(
            onPressed: vm.pickImage,
            isLoading: vm.isPicking,
          );
        },
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
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
