// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'Conversor Geral';

  @override
  String get pickImage => 'Escolher arquivo';

  @override
  String get pickFromGallery => 'Galeria';

  @override
  String get pickFromFiles => 'Arquivos';

  @override
  String get pickManyFiles => 'Arquivos em lote';

  @override
  String get pickFolder => 'Pasta';

  @override
  String get pickFileTitle => 'Escolher fonte';

  @override
  String get targetFormat => 'Formato de destino';

  @override
  String get convert => 'Converter';

  @override
  String get convertBatch => 'Converter em lote';

  @override
  String get converting => 'Convertendo...';

  @override
  String get cancel => 'Cancelar';

  @override
  String get fileTooLarge => 'Arquivo muito grande';

  @override
  String get largeFileWarning =>
      'Arquivo grande detectado. A conversão pode reduzir o tamanho da imagem para estabilidade.';

  @override
  String get notEnoughMemory =>
      'Memória insuficiente para processar este arquivo. Tente uma imagem menor ou feche outros aplicativos.';

  @override
  String get memoryGuardTriggered =>
      'O arquivo é muito pesado para conversão segura neste dispositivo.';

  @override
  String get batchMemoryGuardTriggered =>
      'Muitos arquivos pesados selecionados de uma vez. Divida o lote em partes menores.';

  @override
  String get save => 'Salvar';

  @override
  String get saving => 'Salvando...';

  @override
  String get saved => 'Salvo';

  @override
  String get share => 'Compartilhar';

  @override
  String get rename => 'Renomear';

  @override
  String get renameOutput => 'Renomear saída';

  @override
  String get renameHint => 'Nome do arquivo sem extensão';

  @override
  String get apply => 'Aplicar';

  @override
  String get dismiss => 'Fechar';

  @override
  String get emptyStateHint =>
      'Toque em + para escolher da galeria ou arquivos';

  @override
  String get conversionFailed => 'Falha na conversão';

  @override
  String get batchConversionFailed => 'Falha na conversão em lote';

  @override
  String get saveFailed => 'Falha ao salvar';

  @override
  String get pickFailed => 'Falha ao escolher';

  @override
  String get tapToPick => 'Toque para escolher um arquivo';

  @override
  String get invalidOrCorruptImage =>
      'O arquivo não é uma imagem válida ou parece estar corrompido.';

  @override
  String get invalidImageDimensions =>
      'A imagem tem dimensões inválidas (vazia ou zero).';

  @override
  String get failedToDecodeHeic => 'Falha ao decodificar HEIC';

  @override
  String get failedToEncodeHeic => 'Falha ao codificar HEIC';

  @override
  String get previewNotAvailable =>
      'Pré-visualização não disponível para este formato';

  @override
  String get batchPreviewNoThumbnail => 'Sem miniatura';

  @override
  String get batchPreviewWaiting => 'Miniatura após conversão';

  @override
  String get failedToEncodeAvif => 'Falha ao codificar AVIF';

  @override
  String get formatPairNotSupported => 'Este par de formatos não é suportado';

  @override
  String get pdfRenderUnavailable =>
      'Não foi possível renderizar o PDF neste dispositivo';

  @override
  String get savePdfFailed => 'Falha ao salvar PDF';

  @override
  String get unsupportedInputFormat => 'Formato de entrada não suportado';

  @override
  String get open => 'Abrir';

  @override
  String get openFileFailed =>
      'Não foi possível abrir o arquivo com outro aplicativo';

  @override
  String get openFileUnavailableWeb =>
      'Abrir arquivos em outro aplicativo não está disponível na web';

  @override
  String get outputFileEmpty => 'Arquivo de saída está vazio';

  @override
  String get outputEncodeRoundTripFailed =>
      'O arquivo de saída não era legível após o salvamento';

  @override
  String get toggleTheme => 'Alternar tema';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Não foi possível preparar um espaço temporário para este arquivo. Tente outra fonte ou liberte espaço.';

  @override
  String get conversionHintQuick => 'Normalmente termina em alguns segundos.';

  @override
  String get conversionHintHeavy =>
      'Arquivo grande — conversão pode levar ~10–30 segundos.';

  @override
  String get conversionHintPdf =>
      'Exportação PDF pode levar mais tempo (~10–30 segundos).';

  @override
  String get batchReady => 'Fila de lote está pronta';

  @override
  String get batchDone => 'Conversão em lote concluída';

  @override
  String get noBatchFiles =>
      'Nenhum arquivo selecionado para conversão em lote';

  @override
  String get progressFiles => 'arquivos';

  @override
  String get batchModeTitle => 'Conversão em lote';

  @override
  String get batchModeSubtitle =>
      'Escolha o formato de destino, então converta todos os arquivos. A visualização de arquivo individual está escondida neste modo.';

  @override
  String get batchSummaryTotal => 'Total';

  @override
  String get batchSummaryDone => 'Concluído';

  @override
  String get batchSummaryFailed => 'Falhou';

  @override
  String get batchSummaryQueued => 'Em fila';

  @override
  String get saveAllSuccessful => 'Salvar tudo bem-sucedido';

  @override
  String get batchSaveAllStarting => 'Salvando arquivos...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Salvando $current/$total';
  }

  @override
  String get retryFailed => 'Retry failed';

  @override
  String get clearCompleted => 'Clear completed';

  @override
  String get clearCompletedTooltip =>
      'Remove items marked as saved from this list';

  @override
  String get clearBatchQueue => 'Clear queue';

  @override
  String get batchStatusQueued => 'Queued';

  @override
  String get batchStatusConverting => 'Converting';

  @override
  String get batchStatusDone => 'Done';

  @override
  String get batchStatusFailed => 'Failed';

  @override
  String get batchStatusSaving => 'Saving';

  @override
  String get batchStatusSaved => 'Saved';

  @override
  String get batchStatusCancelled => 'Cancelled';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'Download';

  @override
  String get language => 'Language';

  @override
  String get systemLanguage => 'System default';

  @override
  String get errorDialogTitle => 'Error';

  @override
  String get pickedFileCaption => 'Arquivo selecionado';

  @override
  String get keepScreenOn => 'Keep screen on';

  @override
  String get keepScreenOnTooltip =>
      'Prevent the device display from turning off while the app is active.';
}
