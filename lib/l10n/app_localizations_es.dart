// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Convertidor genérico';

  @override
  String get pickImage => 'Seleccionar archivo';

  @override
  String get pickFromGallery => 'Galería';

  @override
  String get pickFromFiles => 'Archivos';

  @override
  String get pickManyFiles => 'Archivos por lote';

  @override
  String get pickFolder => 'Carpeta';

  @override
  String get pickFileTitle => 'Elegir origen';

  @override
  String get targetFormat => 'Formato de destino';

  @override
  String get convert => 'Convertir';

  @override
  String get convertBatch => 'Convertir lote';

  @override
  String get converting => 'Convirtiendo...';

  @override
  String get cancel => 'Cancelar';

  @override
  String get fileTooLarge => 'El archivo es demasiado grande';

  @override
  String get largeFileWarning =>
      'Archivo grande detectado. La conversión puede reducir el tamaño de la imagen para estabilidad.';

  @override
  String get notEnoughMemory =>
      'No hay memoria suficiente para procesar este archivo. Pruebe una imagen más pequeña o cierre otras apps.';

  @override
  String get memoryGuardTriggered =>
      'El archivo es demasiado pesado para una conversión segura en este dispositivo.';

  @override
  String get batchMemoryGuardTriggered =>
      'Se han seleccionado demasiados archivos pesados a la vez. Divida el lote.';

  @override
  String get save => 'Guardar';

  @override
  String get saving => 'Guardando...';

  @override
  String get saved => 'Guardado';

  @override
  String get share => 'Compartir';

  @override
  String get rename => 'Renombrar';

  @override
  String get renameOutput => 'Renombrar salida';

  @override
  String get renameHint => 'Nombre de archivo sin extensión';

  @override
  String get apply => 'Aplicar';

  @override
  String get dismiss => 'Cerrar';

  @override
  String get emptyStateHint =>
      'Pulsa + para seleccionar de la galería o archivos';

  @override
  String get conversionFailed => 'La conversión falló';

  @override
  String get batchConversionFailed => 'La conversión por lotes falló';

  @override
  String get saveFailed => 'Error al guardar';

  @override
  String get pickFailed => 'Error al seleccionar la imagen';

  @override
  String get tapToPick => 'Pulsa para seleccionar un archivo';

  @override
  String get invalidOrCorruptImage =>
      'El archivo no es una imagen válida o parece estar dañada.';

  @override
  String get invalidImageDimensions =>
      'La imagen tiene un tamaño inválido (vacío o dimensiones cero).';

  @override
  String get failedToDecodeHeic => 'Error al decodificar HEIC';

  @override
  String get failedToEncodeHeic => 'Error al codificar HEIC';

  @override
  String get previewNotAvailable =>
      'La vista previa no está disponible para este formato';

  @override
  String get batchPreviewNoThumbnail => 'Sin miniatura';

  @override
  String get batchPreviewWaiting => 'Miniatura tras la conversión';

  @override
  String get failedToEncodeAvif => 'Error al codificar AVIF';

  @override
  String get formatPairNotSupported => 'Este par de formatos no está soportado';

  @override
  String get pdfRenderUnavailable =>
      'No se pudo renderizar PDF en este dispositivo';

  @override
  String get savePdfFailed => 'Error al guardar PDF';

  @override
  String get unsupportedInputFormat => 'Formato de entrada no soportado';

  @override
  String get open => 'Abrir';

  @override
  String get openFileFailed => 'No se pudo abrir el archivo con otra app';

  @override
  String get openFileUnavailableWeb =>
      'Abrir archivos en otra app no está disponible en la web';

  @override
  String get outputFileEmpty => 'El archivo de salida está vacío';

  @override
  String get outputEncodeRoundTripFailed =>
      'El archivo de salida no era legible después de guardar';

  @override
  String get toggleTheme => 'Cambiar tema';

  @override
  String get policyPreShrinkNoWritableDir =>
      'No se puede preparar un espacio de trabajo temporal para este archivo. Pruebe otra fuente o libere espacio.';

  @override
  String get conversionHintQuick => 'Normalmente termina en unos segundos.';

  @override
  String get conversionHintHeavy =>
      'Archivo grande — la conversión puede tardar ~10–30 segundos.';

  @override
  String get conversionHintPdf =>
      'La exportación a PDF puede tardar más (~10–30 segundos).';

  @override
  String get batchReady => 'La cola de lote está lista';

  @override
  String get batchDone => 'Conversión por lote completada';

  @override
  String get noBatchFiles =>
      'No hay archivos seleccionados para conversión por lote';

  @override
  String get progressFiles => 'archivos';

  @override
  String get batchModeTitle => 'Conversión por lote';

  @override
  String get batchModeSubtitle =>
      'Elija el formato de destino y convierta todos los archivos. La vista de archivo único está oculta en este modo.';

  @override
  String get batchSummaryTotal => 'Total';

  @override
  String get batchSummaryDone => 'Hecho';

  @override
  String get batchSummaryFailed => 'Fallado';

  @override
  String get batchSummaryQueued => 'En cola';

  @override
  String get saveAllSuccessful => 'Todos guardados con éxito';

  @override
  String get batchSaveAllStarting => 'Guardando archivos...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Guardando $current/$total';
  }

  @override
  String get retryFailed => 'Reintentar';

  @override
  String get clearCompleted => 'Borrar completados';

  @override
  String get clearCompletedTooltip =>
      'Eliminar elementos marcados como guardados de esta lista';

  @override
  String get clearBatchQueue => 'Borrar cola';

  @override
  String get batchStatusQueued => 'En cola';

  @override
  String get batchStatusConverting => 'Convirtiendo';

  @override
  String get batchStatusDone => 'Hecho';

  @override
  String get batchStatusFailed => 'Fallado';

  @override
  String get batchStatusSaving => 'Guardando';

  @override
  String get batchStatusSaved => 'Guardado';

  @override
  String get batchStatusCancelled => 'Cancelado';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'Descargar';

  @override
  String get language => 'Idioma';

  @override
  String get systemLanguage => 'Predeterminado del sistema';

  @override
  String get errorDialogTitle => 'Error';

  @override
  String get pickedFileCaption => 'Archivo seleccionado';

  @override
  String get keepScreenOn => 'Mantener pantalla activa';

  @override
  String get keepScreenOnTooltip =>
      'Evitar que la pantalla se apague mientras la aplicación está activa.';
}
