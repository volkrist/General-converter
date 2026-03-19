import 'dart:io';

import 'package:flutter/material.dart';

import '../../models/image_format.dart';
import '../models/converted_file.dart';
import '../services/image_converter_service.dart';
import '../services/image_picker_service.dart';
import '../services/image_save_service.dart';

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

  // Сервисы "core" слоя — сюда вся бизнес‑логика конвертации.
  final ImagePickerService _picker;
  final ImageConverterService _converter;
  final ImageSaveService _saver;

  /// Текущий выбранный исходный файл.
  File? selectedImage;

  /// Выбранный пользователем целевой формат.
  ImageFormat selectedFormat = ImageFormat.png;

  /// Флаги загрузки для блокировки UI.
  bool isPicking = false;
  bool isConverting = false;

  /// Результат последней конвертации и сообщение об ошибке (если было).
  ConvertedFile? result;
  String? error;

  Future<void> pickImage() async {
    try {
      isPicking = true;
      notifyListeners();

      final file = await _picker.pickImage();
      if (file != null) {
        selectedImage = file;
        result = null;
        error = null;
      }
    } catch (e) {
      error = 'Failed to pick image';
    } finally {
      isPicking = false;
      notifyListeners();
    }
  }

  Future<void> convert() async {
    if (selectedImage == null) return;

    try {
      isConverting = true;
      error = null;
      notifyListeners();

      final output = await _converter.convert(
        inputFile: selectedImage!,
        targetFormat: selectedFormat,
      );

      result = ConvertedFile(file: output);
    } catch (e) {
      error = e.toString();
    } finally {
      isConverting = false;
      notifyListeners();
    }
  }

  Future<void> save() async {
    if (result == null) return;

    try {
      await _saver.save(result!.file);
    } catch (e) {
      error = 'Failed to save file';
      notifyListeners();
    }
  }

  void setFormat(ImageFormat format) {
    selectedFormat = format;
    notifyListeners();
  }

  void reset() {
    selectedImage = null;
    result = null;
    error = null;
    notifyListeners();
  }

  void clearError() {
    error = null;
    notifyListeners();
  }
}

