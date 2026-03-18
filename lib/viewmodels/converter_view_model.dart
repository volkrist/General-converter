import 'package:flutter/foundation.dart';

import '../models/conversion_result.dart';
import '../models/image_asset.dart';
import '../models/image_format.dart';
import '../usecases/convert_image_usecase.dart';
import '../usecases/pick_image_usecase.dart';
import '../usecases/save_result_usecase.dart';

class ConverterViewModel extends ChangeNotifier {
  ConverterViewModel({
    required PickImageUseCase pickImageUseCase,
    required ConvertImageUseCase convertImageUseCase,
    required SaveResultUseCase saveResultUseCase,
  })  : _pickImageUseCase = pickImageUseCase,
        _convertImageUseCase = convertImageUseCase,
        _saveResultUseCase = saveResultUseCase;

  final PickImageUseCase _pickImageUseCase;
  final ConvertImageUseCase _convertImageUseCase;
  final SaveResultUseCase _saveResultUseCase;

  ImageAsset? _selectedImage;
  ImageFormat _targetFormat = ImageFormat.png;
  ConversionResult? _result;
  bool _isPicking = false;
  bool _isConverting = false;
  String? _error;

  ImageAsset? get selectedImage => _selectedImage;
  ImageFormat get targetFormat => _targetFormat;
  ConversionResult? get result => _result;
  bool get isPicking => _isPicking;
  bool get isConverting => _isConverting;
  String? get error => _error;
  bool get canConvert => _selectedImage != null && !_isConverting;

  Future<void> pickImage() async {
    if (_isPicking) return;

    _isPicking = true;
    _error = null;
    notifyListeners();

    try {
      final picked = await _pickImageUseCase();
      if (picked != null) {
        _selectedImage = picked;
        _result = null;
      }
    } catch (e) {
      _error = 'Failed to pick image: $e';
    } finally {
      _isPicking = false;
      notifyListeners();
    }
  }

  void setTargetFormat(ImageFormat format) {
    _targetFormat = format;
    _result = null;
    notifyListeners();
  }

  Future<void> convert() async {
    if (_selectedImage == null) return;

    _isConverting = true;
    _error = null;
    _result = null;
    notifyListeners();

    try {
      _result = await _convertImageUseCase(_selectedImage!, _targetFormat);
    } catch (e) {
      _error = 'Conversion failed: $e';
    } finally {
      _isConverting = false;
      notifyListeners();
    }
  }

  Future<void> saveResult() async {
    if (_result == null) return;

    _error = null;
    try {
      await _saveResultUseCase(_result!);
    } catch (e) {
      _error = 'Failed to save: $e';
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
