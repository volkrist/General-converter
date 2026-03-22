import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as p;
import 'package:share_plus/share_plus.dart';

import '../../constants/app_strings.dart';
import '../converter_capabilities.dart';
import '../models/converted_file.dart';
import '../models/image_format.dart';
import '../services/android/image_converter_service.dart';
import '../services/android/image_save_service.dart';
import '../services/common/conversion_matrix.dart';
import '../services/common/conversion_policy.dart';
import '../services/image_picker_service.dart';
import '../user_error_mapper.dart';

class ConverterViewModel extends ChangeNotifier {
  ConverterViewModel(
    this._picker,
    this._converter,
    this._saver,
  );

  final ImagePickerService _picker;
  final ImageConverterService _converter;
  final ImageSaveService _saver;

  static const int _memoryGuardFileLimitBytes = 50 * 1024 * 1024;
  static const int _batchHeavyFilesSoftLimit = 8;

  File? selectedImage;
  ImageFormat selectedFormat = ImageFormat.png;

  bool isPicking = false;
  bool isConverting = false;
  bool isSaving = false;
  bool isSaved = false;
  bool isBatchConverting = false;
  bool isCancelled = false;

  ConvertedFile? result;
  String? error;
  String? dialogError;

  bool isLargeFile = false;
  String? warningMessage;

  int conversionElapsedSeconds = 0;
  Timer? _conversionTimer;

  double progress = 0.0;
  String progressLabel = '';

  int _runId = 0;

  final List<File> batchFiles = <File>[];
  final List<ConvertedFile> batchResults = <ConvertedFile>[];

  String? outputBaseName;

  String get convertingProgressLabel =>
      '${AppStrings.converting} $conversionElapsedLabel';

  String get conversionElapsedLabel {
    final minutes = conversionElapsedSeconds ~/ 60;
    final seconds = conversionElapsedSeconds % 60;
    final mm = minutes.toString().padLeft(2, '0');
    final ss = seconds.toString().padLeft(2, '0');
    return '$mm:$ss';
  }

  String? get conversionTimeHint {
    if (selectedImage == null) return null;
    if (selectedFormat == ImageFormat.pdf) {
      return AppStrings.conversionHintPdf;
    }
    if (isLargeFile) {
      return AppStrings.conversionHintHeavy;
    }
    return AppStrings.conversionHintQuick;
  }

  ImageFormat? get selectedInputFormat =>
      selectedImage == null ? null : ImageFormat.fromPath(selectedImage!.path);

  List<ImageFormat> get allowedTargetFormats {
    final inFmt = selectedInputFormat;
    if (inFmt == null) {
      return List<ImageFormat>.from(
        ConverterCapabilities.outputFormatsForPlatform,
      );
    }
    return ConversionMatrix.allowedOutputsFor(inFmt);
  }

  String get batchSummary {
    if (batchFiles.isEmpty) return '';
    return '${batchFiles.length} ${AppStrings.progressFiles}';
  }

  Future<void> pickFromGallery() async {
    await _pickWith(_picker.pickFromGallery);
  }

  Future<void> pickFromFiles() async {
    await _pickWith(_picker.pickFromFiles);
  }

  Future<void> pickBatchFromFiles() async {
    isPicking = true;
    error = null;
    dialogError = null;
    notifyListeners();

    try {
      final files = await _picker.pickManyFromFiles();
      if (files.isEmpty) return;

      final heavyCount = files
          .where(
            (f) => f.existsSync() && f.lengthSync() > _memoryGuardFileLimitBytes,
          )
          .length;
      if (heavyCount >= _batchHeavyFilesSoftLimit) {
        throw Exception(AppStrings.batchMemoryGuardTriggered);
      }

      batchFiles
        ..clear()
        ..addAll(files);
      batchResults.clear();
      warningMessage = AppStrings.batchReady;
    } catch (e) {
      error = UserErrorMapper.message(e, fallback: AppStrings.pickFailed);
      dialogError = error;
    } finally {
      isPicking = false;
      notifyListeners();
    }
  }

  void applyIncomingFile(File file) {
    try {
      _discardResultFileBestEffort();
      _updateFileWarnings(file);
      selectedImage = file;
      outputBaseName = _defaultBaseNameFor(file);
      result = null;
      isSaved = false;
      error = null;
      dialogError = null;
      _clampFormatToAllowed();
    } catch (e) {
      error = UserErrorMapper.message(e, fallback: AppStrings.pickFailed);
      dialogError = error;
    }
    notifyListeners();
  }

  Future<void> _pickWith(Future<File?> Function() pick) async {
    isPicking = true;
    error = null;
    dialogError = null;
    notifyListeners();

    try {
      final file = await pick();
      if (file == null) return;

      _discardResultFileBestEffort();
      _updateFileWarnings(file);

      selectedImage = file;
      outputBaseName = _defaultBaseNameFor(file);
      result = null;
      isSaved = false;
      error = null;
      dialogError = null;
      _clampFormatToAllowed();
    } catch (e) {
      error = UserErrorMapper.message(e, fallback: AppStrings.pickFailed);
      dialogError = error;
    } finally {
      isPicking = false;
      notifyListeners();
    }
  }

  Future<void> convert() async {
    if (selectedImage == null) return;
    if (_hitsMemoryGuard(selectedImage!)) {
      error = AppStrings.memoryGuardTriggered;
      dialogError = error;
      notifyListeners();
      return;
    }

    final currentRun = ++_runId;
    isCancelled = false;
    _discardResultFileBestEffort();
    isConverting = true;
    error = null;
    dialogError = null;
    result = null;
    isSaved = false;
    progress = 0.0;
    progressLabel = 'Preparing...';
    _startConversionTimer();
    notifyListeners();

    try {
      _clampFormatToAllowed();

      _setProgress(currentRun, 0.15, 'Checking format...');
      await Future<void>.delayed(const Duration(milliseconds: 50));

      _setProgress(currentRun, 0.35, 'Converting...');
      final converted = await _converter.convert(
        inputFile: selectedImage!,
        targetFormat: selectedFormat,
      );

      if (_isCancelledRun(currentRun)) {
        _safeDelete(converted.file);
        return;
      }

      _setProgress(currentRun, 0.8, 'Finalizing...');
      await Future<void>.delayed(const Duration(milliseconds: 50));

      result = converted.copyWith(
        customBaseName: outputBaseName,
      );

      _setProgress(currentRun, 1.0, 'Done');
    } catch (e) {
      error = UserErrorMapper.message(e, fallback: AppStrings.conversionFailed);
      dialogError = error;
    } finally {
      _stopConversionTimer();
      isConverting = false;
      notifyListeners();
    }
  }

  Future<void> convertBatch() async {
    if (batchFiles.isEmpty) {
      error = AppStrings.noBatchFiles;
      dialogError = error;
      notifyListeners();
      return;
    }

    final currentRun = ++_runId;
    isCancelled = false;
    isBatchConverting = true;
    error = null;
    dialogError = null;
    batchResults.clear();
    progress = 0;
    progressLabel = 'Preparing batch...';
    notifyListeners();

    try {
      for (var i = 0; i < batchFiles.length; i++) {
        if (_isCancelledRun(currentRun)) break;

        final file = batchFiles[i];
        if (_hitsMemoryGuard(file)) {
          continue;
        }

        progress = i / batchFiles.length;
        progressLabel =
            'Converting ${i + 1}/${batchFiles.length}: ${p.basename(file.path)}';
        notifyListeners();

        try {
          final converted = await _converter.convert(
            inputFile: file,
            targetFormat: selectedFormat,
          );

          if (_isCancelledRun(currentRun)) {
            _safeDelete(converted.file);
            break;
          }

          batchResults.add(
            converted.copyWith(customBaseName: _defaultBaseNameFor(file)),
          );
          notifyListeners();
        } catch (_) {
          // batch intentionally skips single-file failure
        }
      }

      progress = 1.0;
      progressLabel = AppStrings.batchDone;
      warningMessage = AppStrings.batchDone;
    } catch (e) {
      error = UserErrorMapper.message(
        e,
        fallback: AppStrings.batchConversionFailed,
      );
      dialogError = error;
    } finally {
      isBatchConverting = false;
      notifyListeners();
    }
  }

  void cancelConvert() {
    if (!isConverting && !isBatchConverting) return;
    isCancelled = true;
    _runId++;
    isConverting = false;
    isBatchConverting = false;
    progressLabel = 'Cancelled';
    _stopConversionTimer();
    notifyListeners();
  }

  Future<void> save() async {
    if (result == null) return;

    try {
      isSaving = true;
      notifyListeners();

      final fileToSave = await _materializeRenamedCopy(result!);
      await _saver.save(file: fileToSave, format: result!.format);
      isSaved = true;
    } catch (e) {
      error = UserErrorMapper.message(e, fallback: AppStrings.saveFailed);
      dialogError = error;
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }

  /// Сохранить один файл из batch (основной [result] не трогаем).
  Future<void> saveConverted(ConvertedFile item) async {
    try {
      isSaving = true;
      notifyListeners();

      final fileToSave = await _materializeRenamedCopy(item);
      await _saver.save(file: fileToSave, format: item.format);
    } catch (e) {
      error = UserErrorMapper.message(e, fallback: AppStrings.saveFailed);
      dialogError = error;
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }

  Future<void> shareResult() async {
    if (result == null) return;
    try {
      final fileToShare = await _materializeRenamedCopy(result!);
      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(fileToShare.path)],
          subject: AppStrings.appName,
        ),
      );
    } catch (e) {
      error = UserErrorMapper.message(e, fallback: AppStrings.saveFailed);
      dialogError = error;
      notifyListeners();
    }
  }

  void setFormat(ImageFormat format) {
    selectedFormat = format;
    notifyListeners();
  }

  void renameOutputBase(String value) {
    final normalized = value.trim();
    outputBaseName = normalized.isEmpty ? null : normalized;
    if (result != null) {
      result = result!.copyWith(customBaseName: outputBaseName);
    }
    notifyListeners();
  }

  Future<void> openResultExternally() async {
    if (result == null) return;
    if (kIsWeb) {
      error = AppStrings.openFileUnavailableWeb;
      dialogError = error;
      notifyListeners();
      return;
    }
    try {
      final file = await _materializeRenamedCopy(result!);
      final r = await OpenFile.open(file.path);
      if (r.type != ResultType.done) {
        error = AppStrings.openFileFailed;
        dialogError = error;
        notifyListeners();
      }
    } catch (e) {
      error = UserErrorMapper.message(e, fallback: AppStrings.openFileFailed);
      dialogError = error;
      notifyListeners();
    }
  }

  void clearError() {
    error = null;
    dialogError = null;
    notifyListeners();
  }

  void clearWarning() {
    _clearFileWarnings();
    notifyListeners();
  }

  void reset() {
    _discardResultFileBestEffort();
    selectedImage = null;
    result = null;
    batchFiles.clear();
    batchResults.clear();
    error = null;
    dialogError = null;
    isPicking = false;
    isConverting = false;
    isBatchConverting = false;
    isSaving = false;
    isSaved = false;
    isCancelled = false;
    progress = 0;
    progressLabel = '';
    outputBaseName = null;
    conversionElapsedSeconds = 0;
    _stopConversionTimer();
    _clearFileWarnings();
    notifyListeners();
  }

  void _updateFileWarnings(File file) {
    final size = file.lengthSync();

    if (ConversionPolicy.isTooLarge(size)) {
      throw Exception(AppStrings.fileTooLarge);
    }

    if (ConversionPolicy.isWarningSize(size)) {
      isLargeFile = true;
      warningMessage = AppStrings.largeFileWarning;
    } else {
      _clearFileWarnings();
    }
  }

  void _clearFileWarnings() {
    isLargeFile = false;
    warningMessage = null;
  }

  void _clampFormatToAllowed() {
    final inFmt = selectedInputFormat;
    if (inFmt == null) return;
    final allowed = ConversionMatrix.allowedOutputsFor(inFmt);
    if (allowed.isEmpty) return;
    if (!allowed.contains(selectedFormat)) {
      selectedFormat = allowed.first;
    }
  }

  bool _hitsMemoryGuard(File file) {
    try {
      return file.existsSync() &&
          file.lengthSync() > _memoryGuardFileLimitBytes;
    } catch (_) {
      return false;
    }
  }

  bool _isCancelledRun(int currentRun) => currentRun != _runId || isCancelled;

  void _setProgress(int currentRun, double value, String label) {
    if (_isCancelledRun(currentRun)) return;
    progress = value;
    progressLabel = label;
    notifyListeners();
  }

  String _defaultBaseNameFor(File file) {
    final base = p.basenameWithoutExtension(file.path);
    return '${base}_converted';
  }

  Future<File> _materializeRenamedCopy(ConvertedFile converted) async {
    final desiredBase = converted.customBaseName?.trim();
    if (desiredBase == null || desiredBase.isEmpty) {
      return converted.file;
    }

    final dir = converted.file.parent;
    final newPath = p.join(dir.path, '$desiredBase.${converted.format.name}');
    if (newPath == converted.file.path) {
      return converted.file;
    }

    final bytes = await converted.file.readAsBytes();
    final renamed = File(newPath);
    await renamed.writeAsBytes(bytes, flush: true);
    return renamed;
  }

  void _discardResultFileBestEffort() {
    final f = result?.file;
    if (f == null) return;
    _safeDelete(f);
  }

  void _safeDelete(File file) {
    try {
      if (file.existsSync()) {
        file.deleteSync();
      }
    } catch (_) {}
  }

  void _startConversionTimer() {
    conversionElapsedSeconds = 0;
    _conversionTimer?.cancel();
    _conversionTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      conversionElapsedSeconds++;
      notifyListeners();
    });
  }

  void _stopConversionTimer() {
    _conversionTimer?.cancel();
    _conversionTimer = null;
  }

  @override
  void dispose() {
    _conversionTimer?.cancel();
    _discardResultFileBestEffort();
    super.dispose();
  }
}
