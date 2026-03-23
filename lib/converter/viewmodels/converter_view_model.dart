import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../constants/app_strings.dart';
import '../converter_capabilities.dart';
import '../models/batch_item_state.dart';
import '../models/converted_file.dart';
import '../models/image_format.dart';
import '../services/android/image_converter_service.dart';
import '../services/android/image_save_service.dart';
import '../services/common/conversion_matrix.dart';
import '../services/common/conversion_policy.dart';
import '../services/common/preview_thumbnail_service.dart';
import '../services/image_picker_service.dart';
import '../user_error_mapper.dart';

enum ConverterScreenMode {
  single,
  batch,
}

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

  ConverterScreenMode screenMode = ConverterScreenMode.single;

  File? selectedImage;
  ImageFormat selectedFormat =
      ConverterCapabilities.outputFormatsForPlatform.first;

  bool isPicking = false;
  bool isConverting = false;
  bool isSaving = false;
  bool isSaved = false;
  bool isBatchConverting = false;
  bool isBatchSavingAll = false;
  bool isCancelled = false;

  double batchSaveProgress = 0.0;
  String batchSaveLabel = '';

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

  String? outputBaseName;

  final List<BatchItemState> batchItems = <BatchItemState>[];

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

  int get batchTotal => batchItems.length;

  int get batchDoneCount => batchItems
      .where(
        (e) =>
            e.status == BatchItemStatus.done ||
            e.status == BatchItemStatus.saved,
      )
      .length;

  int get batchFailedCount =>
      batchItems.where((e) => e.status == BatchItemStatus.failed).length;

  int get batchQueuedCount =>
      batchItems.where((e) => e.status == BatchItemStatus.queued).length;

  int get batchSavingCount =>
      batchItems.where((e) => e.status == BatchItemStatus.saving).length;

  bool get hasBatchItems => batchItems.isNotEmpty;

  String get batchSummary {
    if (batchItems.isEmpty) return '';
    return '${batchItems.length} ${AppStrings.progressFiles}';
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

      _discardResultFileBestEffort();

      screenMode = ConverterScreenMode.batch;
      result = null;
      selectedImage = null;
      isSaved = false;

      batchItems
        ..clear()
        ..addAll(
          files.asMap().entries.map(
            (entry) => BatchItemState(
              sourceFile: entry.value,
              customBaseName: _defaultBaseNameForBatch(
                entry.value,
                index: entry.key,
                addIndex: false,
              ),
            ),
          ),
        );

      warningMessage = AppStrings.batchReady;
    } catch (e) {
      error = UserErrorMapper.message(e, fallback: AppStrings.pickFailed);
      dialogError = error;
    } finally {
      isPicking = false;
      notifyListeners();
    }
  }

  Future<void> pickBatchFromFolder() async {
    isPicking = true;
    error = null;
    dialogError = null;
    notifyListeners();

    try {
      final files = await _picker.pickFolderImages();
      if (files.isEmpty) return;

      final heavyCount = files
          .where(
            (f) => f.existsSync() && f.lengthSync() > _memoryGuardFileLimitBytes,
          )
          .length;

      if (heavyCount >= _batchHeavyFilesSoftLimit) {
        throw Exception(AppStrings.batchMemoryGuardTriggered);
      }

      _discardResultFileBestEffort();

      screenMode = ConverterScreenMode.batch;
      result = null;
      selectedImage = null;
      isSaved = false;

      batchItems
        ..clear()
        ..addAll(
          files.asMap().entries.map(
            (entry) => BatchItemState(
              sourceFile: entry.value,
              customBaseName: _defaultBaseNameForBatch(
                entry.value,
                index: entry.key,
                addIndex: false,
              ),
            ),
          ),
        );

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
      clearBatch(deleteOutputs: true);
      _discardResultFileBestEffort();
      _updateFileWarnings(file);

      screenMode = ConverterScreenMode.single;
      selectedImage = file;
      outputBaseName = _defaultBaseNameForSingle(file);
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

      clearBatch(deleteOutputs: true);
      _discardResultFileBestEffort();
      _updateFileWarnings(file);

      screenMode = ConverterScreenMode.single;
      selectedImage = file;
      outputBaseName = _defaultBaseNameForSingle(file);
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

    clearBatch(deleteOutputs: true);
    screenMode = ConverterScreenMode.single;

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
    if (batchItems.isEmpty) {
      error = AppStrings.noBatchFiles;
      dialogError = error;
      notifyListeners();
      return;
    }

    final currentRun = ++_runId;
    isCancelled = false;
    isBatchConverting = true;
    screenMode = ConverterScreenMode.batch;

    result = null;
    isSaved = false;
    error = null;
    dialogError = null;
    progress = 0;
    progressLabel = 'Preparing batch...';
    notifyListeners();

    try {
      for (var i = 0; i < batchItems.length; i++) {
        if (_isCancelledRun(currentRun)) {
          final item = batchItems[i];
          batchItems[i] = item.copyWith(
            status: BatchItemStatus.cancelled,
          );
          continue;
        }

        final item = batchItems[i];
        final file = item.sourceFile;

        if (_hitsMemoryGuard(file)) {
          batchItems[i] = item.copyWith(
            status: BatchItemStatus.failed,
            errorMessage: AppStrings.memoryGuardTriggered,
          );
          notifyListeners();
          continue;
        }

        batchItems[i] = item.copyWith(
          status: BatchItemStatus.converting,
          progress: 0.2,
          clearError: true,
          clearSaveError: true,
        );

        progress = i / batchItems.length;
        progressLabel =
            'Converting ${i + 1}/${batchItems.length}: ${item.sourceName}';
        notifyListeners();

        try {
          final converted = await _converter.convert(
            inputFile: file,
            targetFormat: selectedFormat,
          );

          if (_isCancelledRun(currentRun)) {
            _safeDelete(converted.file);
            batchItems[i] = item.copyWith(
              status: BatchItemStatus.cancelled,
            );
            notifyListeners();
            continue;
          }

          final oldPreview = item.previewFile;
          if (oldPreview != null) {
            _safeDelete(oldPreview);
          }
          final preview = await _buildPreviewFile(file);

          batchItems[i] = item.copyWith(
            status: BatchItemStatus.done,
            progress: 1.0,
            result: converted.copyWith(
              customBaseName: item.customBaseName,
            ),
            previewFile: preview,
          );
          notifyListeners();
        } catch (e) {
          batchItems[i] = item.copyWith(
            status: BatchItemStatus.failed,
            errorMessage: UserErrorMapper.message(
              e,
              fallback: AppStrings.batchConversionFailed,
            ),
          );
          notifyListeners();
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

  Future<void> retryFailedBatchItems() async {
    final failedIndexes = <int>[];
    for (var i = 0; i < batchItems.length; i++) {
      if (batchItems[i].status == BatchItemStatus.failed) {
        failedIndexes.add(i);
      }
    }

    if (failedIndexes.isEmpty) return;

    final currentRun = ++_runId;
    isCancelled = false;
    isBatchConverting = true;
    error = null;
    dialogError = null;
    notifyListeners();

    try {
      for (final i in failedIndexes) {
        if (_isCancelledRun(currentRun)) break;

        final item = batchItems[i];
        final file = item.sourceFile;

        if (_hitsMemoryGuard(file)) {
          batchItems[i] = item.copyWith(
            status: BatchItemStatus.failed,
            errorMessage: AppStrings.memoryGuardTriggered,
          );
          notifyListeners();
          continue;
        }

        batchItems[i] = item.copyWith(
          status: BatchItemStatus.converting,
          progress: 0.2,
          clearError: true,
          clearSaveError: true,
        );
        notifyListeners();

        try {
          final converted = await _converter.convert(
            inputFile: file,
            targetFormat: selectedFormat,
          );

          if (_isCancelledRun(currentRun)) {
            _safeDelete(converted.file);
            batchItems[i] = item.copyWith(
              status: BatchItemStatus.cancelled,
            );
            notifyListeners();
            continue;
          }

          final prevPreview = batchItems[i].previewFile;
          if (prevPreview != null) {
            _safeDelete(prevPreview);
          }
          final preview = await _buildPreviewFile(file);

          batchItems[i] = batchItems[i].copyWith(
            status: BatchItemStatus.done,
            progress: 1.0,
            result: converted.copyWith(
              customBaseName: batchItems[i].customBaseName,
            ),
            previewFile: preview,
          );
        } catch (e) {
          batchItems[i] = batchItems[i].copyWith(
            status: BatchItemStatus.failed,
            errorMessage: UserErrorMapper.message(
              e,
              fallback: AppStrings.batchConversionFailed,
            ),
          );
        }

        notifyListeners();
      }
    } finally {
      isBatchConverting = false;
      notifyListeners();
    }
  }

  void renameBatchItem(int index, String value) {
    if (index < 0 || index >= batchItems.length) return;

    final normalized = value.trim();
    final item = batchItems[index];

    batchItems[index] = item.copyWith(
      customBaseName: normalized.isEmpty
          ? _defaultBaseNameForBatch(
              item.sourceFile,
              index: index,
              addIndex: false,
            )
          : normalized,
    );

    final resultFile = batchItems[index].result;
    if (resultFile != null) {
      batchItems[index] = batchItems[index].copyWith(
        result: resultFile.copyWith(
          customBaseName: batchItems[index].customBaseName,
        ),
      );
    }

    notifyListeners();
  }

  Future<void> saveBatchItem(int index) async {
    if (index < 0 || index >= batchItems.length) return;

    final item = batchItems[index];
    if (item.result == null) return;

    try {
      batchItems[index] = item.copyWith(
        status: BatchItemStatus.saving,
        clearSaveError: true,
      );
      notifyListeners();

      final fileToSave = await _materializeRenamedCopy(item.result!);
      await _saver.save(
        file: fileToSave,
        format: item.result!.format,
      );

      batchItems[index] =
          batchItems[index].copyWith(status: BatchItemStatus.saved);
    } catch (e) {
      batchItems[index] = batchItems[index].copyWith(
        status: BatchItemStatus.failed,
        errorMessage: UserErrorMapper.message(
          e,
          fallback: AppStrings.saveFailed,
        ),
      );
    } finally {
      notifyListeners();
    }
  }

  Future<void> shareBatchItem(int index) async {
    if (index < 0 || index >= batchItems.length) return;

    final item = batchItems[index];
    if (item.result == null) return;

    try {
      final fileToShare = await _materializeRenamedCopy(item.result!);
      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(fileToShare.path)],
          subject: AppStrings.appName,
        ),
      );
      batchItems[index] = batchItems[index].copyWith(clearSaveError: true);
      notifyListeners();
    } catch (e) {
      batchItems[index] = batchItems[index].copyWith(
        saveError: UserErrorMapper.message(
          e,
          fallback: AppStrings.saveFailed,
        ),
      );
      notifyListeners();
    }
  }

  Future<void> saveAllBatchSuccessful() async {
    if (batchItems.isEmpty) return;

    final candidates = <int>[];
    for (var i = 0; i < batchItems.length; i++) {
      final item = batchItems[i];
      if (item.result != null &&
          (item.status == BatchItemStatus.done ||
              item.status == BatchItemStatus.saved)) {
        candidates.add(i);
      }
    }

    if (candidates.isEmpty) return;

    isBatchSavingAll = true;
    batchSaveProgress = 0;
    batchSaveLabel = AppStrings.batchSaveAllStarting;
    notifyListeners();

    try {
      for (var j = 0; j < candidates.length; j++) {
        final index = candidates[j];
        batchSaveProgress = j / candidates.length;
        batchSaveLabel = AppStrings.batchSaveAllProgressLabel(
          j + 1,
          candidates.length,
        );
        notifyListeners();

        await saveBatchItem(index);
      }

      batchSaveProgress = 1.0;
      batchSaveLabel = AppStrings.saved;
      notifyListeners();
      await Future<void>.delayed(const Duration(milliseconds: 450));
    } finally {
      isBatchSavingAll = false;
      batchSaveProgress = 0;
      batchSaveLabel = '';
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
      await _saver.save(
        file: fileToSave,
        format: result!.format,
      );

      isSaved = true;
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

  void clearBatch({bool deleteOutputs = false}) {
    if (deleteOutputs) {
      for (final item in batchItems) {
        final file = item.result?.file;
        if (file != null) {
          _safeDelete(file);
        }
        final preview = item.previewFile;
        if (preview != null) {
          _safeDelete(preview);
        }
      }
    }

    batchItems.clear();

    isBatchSavingAll = false;
    batchSaveProgress = 0;
    batchSaveLabel = '';

    if (screenMode == ConverterScreenMode.batch) {
      screenMode = ConverterScreenMode.single;
    }

    notifyListeners();
  }

  void reset() {
    _discardResultFileBestEffort();
    clearBatch(deleteOutputs: true);

    selectedImage = null;
    result = null;
    error = null;
    dialogError = null;
    isPicking = false;
    isConverting = false;
    isBatchConverting = false;
    isBatchSavingAll = false;
    isSaving = false;
    isSaved = false;
    isCancelled = false;
    progress = 0;
    progressLabel = '';
    batchSaveProgress = 0;
    batchSaveLabel = '';
    outputBaseName = null;
    conversionElapsedSeconds = 0;
    screenMode = ConverterScreenMode.single;

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
      return file.existsSync() && file.lengthSync() > _memoryGuardFileLimitBytes;
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

  String _defaultBaseNameForSingle(File file) {
    final base = p.basenameWithoutExtension(file.path);
    return '${base}_converted';
  }

  String _defaultBaseNameForBatch(
    File file, {
    int? index,
    bool addIndex = false,
  }) {
    final base = p.basenameWithoutExtension(file.path);

    if (addIndex && index != null) {
      final suffix = (index + 1).toString().padLeft(3, '0');
      return '${base}_$suffix';
    }

    return base;
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

  Future<File?> _buildPreviewFile(File file) async {
    try {
      final tempDir = await getTemporaryDirectory();
      return PreviewThumbnailService.createPreviewForFile(
        sourceFile: file,
        tempDir: tempDir,
      );
    } catch (_) {
      return null;
    }
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
    clearBatch(deleteOutputs: true);
    super.dispose();
  }
}
