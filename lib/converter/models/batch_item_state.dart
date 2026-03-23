import 'dart:io';

import 'converted_file.dart';

enum BatchItemStatus {
  queued,
  converting,
  done,
  failed,
  saving,
  saved,
  cancelled,
}

class BatchItemState {
  const BatchItemState({
    required this.sourceFile,
    this.result,
    this.status = BatchItemStatus.queued,
    this.errorMessage,
    this.saveError,
    this.progress = 0.0,
    this.customBaseName,
    this.previewFile,
  });

  final File sourceFile;
  final ConvertedFile? result;
  final BatchItemStatus status;
  final String? errorMessage;
  final String? saveError;
  final double progress;
  final String? customBaseName;
  final File? previewFile;

  String get sourceName => sourceFile.uri.pathSegments.isNotEmpty
      ? sourceFile.uri.pathSegments.last
      : sourceFile.path;

  BatchItemState copyWith({
    File? sourceFile,
    ConvertedFile? result,
    BatchItemStatus? status,
    String? errorMessage,
    String? saveError,
    double? progress,
    String? customBaseName,
    File? previewFile,
    bool clearError = false,
    bool clearSaveError = false,
    bool clearResult = false,
    bool clearPreview = false,
  }) {
    return BatchItemState(
      sourceFile: sourceFile ?? this.sourceFile,
      result: clearResult ? null : (result ?? this.result),
      status: status ?? this.status,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      saveError: clearSaveError ? null : (saveError ?? this.saveError),
      progress: progress ?? this.progress,
      customBaseName: customBaseName ?? this.customBaseName,
      previewFile: clearPreview ? null : (previewFile ?? this.previewFile),
    );
  }
}
