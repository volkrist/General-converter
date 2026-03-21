import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';

import '../../constants/app_strings.dart';
import '../converter_capabilities.dart';
import '../conversion_matrix.dart';
import '../models/converted_file.dart';
import '../models/image_format.dart';
import '../services/image_converter_service.dart';
import '../services/image_picker_service.dart';
import '../services/image_save_service.dart';
import '../user_error_mapper.dart';

/// Главный ViewModel для экрана конвертера.
///
/// Отвечает только за связь между UI и "core"‑сервисами:
/// - выбор файла (ImagePickerService)
/// - конвертация (ImageConverterService)
/// - сохранение (ImageSaveService)
class ConverterViewModel extends ChangeNotifier {
  ConverterViewModel(
    this._picker,
    this._converter,
    this._saver,
  );

  static const int warningFileSizeBytes = 20 * 1024 * 1024;

  final ImagePickerService _picker;
  final ImageConverterService _converter;
  final ImageSaveService _saver;

  File? selectedImage;
  ImageFormat selectedFormat = ImageFormat.png;

  bool isPicking = false;
  bool isConverting = false;
  bool isSaving = false;
  bool isSaved = false;

  ConvertedFile? result;
  String? error;

  bool isLargeFile = false;
  String? warningMessage;

  int conversionElapsedSeconds = 0;
  Timer? _conversionTimer;

  String get convertingProgressLabel =>
      '${AppStrings.converting} $conversionElapsedLabel';

  String get conversionElapsedLabel {
    final minutes = conversionElapsedSeconds ~/ 60;
    final seconds = conversionElapsedSeconds % 60;
    final mm = minutes.toString().padLeft(2, '0');
    final ss = seconds.toString().padLeft(2, '0');
    return '$mm:$ss';
  }

  Future<void> pickFromGallery() async {
    await _pickWith(_picker.pickFromGallery);
  }

  Future<void> pickFromFiles() async {
    await _pickWith(_picker.pickFromFiles);
  }

  /// Файл из «Поделиться» / «Открыть в приложении» (Android/iOS).
  void applyIncomingFile(File file) {
    try {
      _updateFileWarnings(file);
      selectedImage = file;
      result = null;
      isSaved = false;
      error = null;
      _clampFormatToAllowed();
    } catch (e) {
      error = UserErrorMapper.message(e, fallback: AppStrings.pickFailed);
    }
    notifyListeners();
  }

  Future<void> _pickWith(Future<File?> Function() pick) async {
    isPicking = true;
    error = null;
    notifyListeners();

    try {
      final file = await pick();
      if (file == null) {
        isPicking = false;
        notifyListeners();
        return;
      }

      _updateFileWarnings(file);

      selectedImage = file;
      result = null;
      isSaved = false;
      error = null;
      _clampFormatToAllowed();
    } catch (e) {
      error = UserErrorMapper.message(e, fallback: AppStrings.pickFailed);
    } finally {
      isPicking = false;
      notifyListeners();
    }
  }

  Future<void> convert() async {
    if (selectedImage == null) return;

    isConverting = true;
    error = null;
    result = null;
    isSaved = false;
    _startConversionTimer();
    notifyListeners();

    try {
      _clampFormatToAllowed();
      result = await _converter.convert(
        inputFile: selectedImage!,
        targetFormat: selectedFormat,
      );
    } catch (e) {
      error = UserErrorMapper.message(e, fallback: AppStrings.conversionFailed);
    } finally {
      _stopConversionTimer();
      isConverting = false;
      notifyListeners();
    }
  }

  Future<void> save() async {
    if (result == null) return;

    try {
      isSaving = true;
      notifyListeners();
      await _saver.save(result!.file);
      isSaved = true;
    } catch (e) {
      error = UserErrorMapper.message(e, fallback: AppStrings.saveFailed);
      notifyListeners();
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }

  void setFormat(ImageFormat format) {
    selectedFormat = format;
    notifyListeners();
  }

  ImageFormat? get selectedInputFormat =>
      selectedImage == null ? null : ImageFormat.fromPath(selectedImage!.path);

  /// Единственный источник списка целей для UI (dropdown не считает форматы сам).
  List<ImageFormat> get allowedTargetFormats {
    final inFmt = selectedInputFormat;
    if (inFmt == null) {
      return List<ImageFormat>.from(ConverterCapabilities.supportedOutputFormats);
    }
    return ConversionMatrix.allowedOutputsFor(inFmt);
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

  /// Открыть результат во внешнем приложении ([open_file]).
  ///
  /// Ручная проверка на Android рекомендуется: TIFF/PDF/HEIC/AVIF, нет viewer —
  /// ожидаем [AppStrings.openFileFailed] (тип результата ≠ done).
  Future<void> openResultExternally() async {
    if (result == null) return;
    if (kIsWeb) {
      error = AppStrings.openFileUnavailableWeb;
      notifyListeners();
      return;
    }
    try {
      final r = await OpenFile.open(result!.file.path);
      if (r.type != ResultType.done) {
        error = AppStrings.openFileFailed;
        notifyListeners();
      }
    } catch (e) {
      error = UserErrorMapper.message(e, fallback: AppStrings.openFileFailed);
      notifyListeners();
    }
  }

  void reset() {
    selectedImage = null;
    result = null;
    error = null;
    isPicking = false;
    isConverting = false;
    isSaving = false;
    isSaved = false;
    conversionElapsedSeconds = 0;
    _stopConversionTimer();
    _clearFileWarnings();
    notifyListeners();
  }

  void clearError() {
    error = null;
    notifyListeners();
  }

  void clearWarning() {
    _clearFileWarnings();
    notifyListeners();
  }

  void _updateFileWarnings(File file) {
    final size = file.lengthSync();

    if (size > ImageConverterService.maxFileSizeBytes) {
      throw Exception(AppStrings.fileTooLarge);
    }

    if (size > warningFileSizeBytes) {
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
    super.dispose();
  }
}
