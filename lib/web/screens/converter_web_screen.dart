import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_strings.dart';
import '../../converter/converter_capabilities.dart';
import '../../converter/models/image_format.dart';
import '../../converter/services/common/conversion_matrix.dart';
import '../../converter/services/web/download_bytes.dart';
import '../../converter/services/web/web_image_converter_service.dart';
import '../../l10n/l10n_extensions.dart';
import '../../localization/language_names.dart';
import '../../localization/locale_controller.dart';

/// Web: Upload → Convert (общий pipeline) → Preview → Download.
class ConverterWebScreen extends StatefulWidget {
  const ConverterWebScreen({super.key});

  @override
  State<ConverterWebScreen> createState() => _ConverterWebScreenState();
}

class _ConverterWebScreenState extends State<ConverterWebScreen> {
  final WebImageConverterService _converterService = WebImageConverterService();

  Uint8List? _inputBytes;
  Uint8List? _outputBytes;

  String _inputName = '';
  ImageFormat _targetFormat =
      ConverterCapabilities.outputFormatsForPlatform.first;

  bool _isPicking = false;
  bool _isConverting = false;
  String? _errorMessage;

  Future<void> _pickFile() async {
    setState(() {
      _isPicking = true;
      _errorMessage = null;
      _outputBytes = null;
    });

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ConverterCapabilities.inputFormatsForPlatform
            .map((f) => f.extension)
            .toSet()
            .toList(),
        withData: true,
      );

      if (result == null || result.files.isEmpty) {
        return;
      }

      final file = result.files.first;
      final bytes = file.bytes;

      if (bytes == null || bytes.isEmpty) {
        throw Exception(AppStrings.pickFailed);
      }

      setState(() {
        _inputBytes = bytes;
        _inputName = file.name;
        _clampTargetToAllowed();
      });
    } catch (e) {
      setState(() {
        _errorMessage = '${AppStrings.pickFailed}: $e';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isPicking = false;
        });
      }
    }
  }

  List<ImageFormat> get _allowedTargetFormats {
    if (_inputName.isEmpty) {
      return List<ImageFormat>.from(
        ConverterCapabilities.outputFormatsForPlatform,
      );
    }
    final inFmt = ImageFormat.fromPath(_inputName);
    if (inFmt == null) {
      return List<ImageFormat>.from(
        ConverterCapabilities.outputFormatsForPlatform,
      );
    }
    return ConversionMatrix.allowedOutputsFor(inFmt);
  }

  void _clampTargetToAllowed() {
    final allowed = _allowedTargetFormats;
    if (allowed.isEmpty) {
      return;
    }
    if (!allowed.contains(_targetFormat)) {
      _targetFormat = allowed.first;
    }
  }

  Future<void> _convert() async {
    if (_inputBytes == null) return;

    setState(() {
      _clampTargetToAllowed();
      _isConverting = true;
      _errorMessage = null;
      _outputBytes = null;
    });

    try {
      final result = await _converterService.convert(
        inputBytes: _inputBytes!,
        inputFileName: _inputName.isNotEmpty
            ? _inputName
            : 'upload.${_targetFormat.extension}',
        targetFormat: _targetFormat,
      );

      if (!mounted) return;
      setState(() {
        _outputBytes = result;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = '${AppStrings.conversionFailed}: $e';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isConverting = false;
        });
      }
    }
  }

  void _download() {
    if (_outputBytes == null) return;

    final outputName = _buildOutputFileName(
      inputName: _inputName,
      targetFormat: _targetFormat,
    );

    downloadBytes(
      bytes: _outputBytes!,
      fileName: outputName,
    );
  }

  String _getExtension(String name) {
    final parts = name.split('.');
    if (parts.length < 2) return '';
    return parts.last.toLowerCase();
  }

  String _buildOutputFileName({
    required String inputName,
    required ImageFormat targetFormat,
  }) {
    final dotIndex = inputName.lastIndexOf('.');
    final baseName =
        dotIndex > 0 ? inputName.substring(0, dotIndex) : inputName;
    if (baseName.isEmpty) {
      return 'converted.${targetFormat.extension}';
    }
    return '${baseName}_converted.${targetFormat.extension}';
  }

  bool _canPreviewAsImage(ImageFormat format) {
    switch (format) {
      case ImageFormat.jpg:
      case ImageFormat.png:
      case ImageFormat.gif:
      case ImageFormat.bmp:
      case ImageFormat.webp:
        return true;
      case ImageFormat.tiff:
      case ImageFormat.heic:
      case ImageFormat.avif:
      case ImageFormat.pdf:
        return false;
    }
  }

  Widget _buildPreview(BuildContext context) {
    final l10n = context.l10n;
    if (_outputBytes == null) {
      return const SizedBox.shrink();
    }

    if (_canPreviewAsImage(_targetFormat)) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.memory(
          _outputBytes!,
          height: 280,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return _buildPlaceholder(context, l10n.previewNotAvailable);
          },
        ),
      );
    }

    return _buildPlaceholder(
      context,
      '${_targetFormat.label}: ${l10n.previewNotAvailable}',
    );
  }

  Widget _buildPlaceholder(BuildContext context, String text) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 180),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final localeVm = context.watch<LocaleController>();
    final inputSelected = _inputBytes != null;
    final allowedTargets = _allowedTargetFormats;
    final canConvert = inputSelected && !_isConverting && !_isPicking;
    final canDownload = _outputBytes != null && !_isConverting;

    return Scaffold(
      appBar: AppBar(
        title: Text('${l10n.appName} ${l10n.appNameWebSuffix}'),
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
                    checked: localeVm.localeOverride?.languageCode ==
                        loc.languageCode,
                    child: Text(localePickerLabel(loc)),
                  ),
                );
              }
              return entries;
            },
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              ElevatedButton(
                onPressed: _isPicking || _isConverting ? null : _pickFile,
                child: Text(
                  _isPicking ? l10n.pickFileTitle : l10n.pickImage,
                ),
              ),
              const SizedBox(height: 12),
              if (_inputName.isNotEmpty) ...[
                Text(
                  l10n.pickedFileCaption,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 4),
                Text(
                  '$_inputName · ${_getExtension(_inputName)}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
              const SizedBox(height: 20),
              InputDecorator(
                decoration: InputDecoration(
                  labelText: l10n.targetFormat,
                  border: const OutlineInputBorder(),
                ),
                child: allowedTargets.isEmpty
                    ? const SizedBox(
                        height: 48,
                        child: Center(child: Text('—')),
                      )
                    : DropdownButtonHideUnderline(
                        child: DropdownButton<ImageFormat>(
                          isExpanded: true,
                          value: allowedTargets.contains(_targetFormat)
                              ? _targetFormat
                              : allowedTargets.first,
                          items: allowedTargets
                              .map(
                                (format) => DropdownMenuItem<ImageFormat>(
                                  value: format,
                                  child: Text(format.label),
                                ),
                              )
                              .toList(),
                          onChanged: _isConverting
                              ? null
                              : (v) {
                                  if (v == null) return;
                                  setState(() {
                                    _targetFormat = v;
                                  });
                                },
                        ),
                      ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: canConvert ? _convert : null,
                child: Text(
                  _isConverting ? l10n.converting : l10n.convert,
                ),
              ),
              if (_errorMessage != null) ...[
                const SizedBox(height: 12),
                Text(
                  _errorMessage!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ],
              const SizedBox(height: 24),
              _buildPreview(context),
              if (_outputBytes != null) ...[
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: canDownload ? _download : null,
                  child: Text(l10n.download),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
