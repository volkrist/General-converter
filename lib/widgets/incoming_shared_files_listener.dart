import 'dart:async' show StreamSubscription, unawaited;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import '../converter/models/image_format.dart';
import '../converter/services/image_picker_service.dart';
import '../converter/viewmodels/converter_view_model.dart';

/// Принимает файлы из других приложений (Share / «Открыть в») на Android и iOS.
class IncomingSharedFilesListener extends StatefulWidget {
  const IncomingSharedFilesListener({super.key, required this.child});

  final Widget child;

  @override
  State<IncomingSharedFilesListener> createState() =>
      _IncomingSharedFilesListenerState();
}

class _IncomingSharedFilesListenerState extends State<IncomingSharedFilesListener> {
  StreamSubscription<List<SharedMediaFile>>? _sub;

  bool get _platformSupported =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);

  @override
  void initState() {
    super.initState();
    if (!_platformSupported) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_consumeInitialMedia());
      _sub = ReceiveSharingIntent.instance.getMediaStream().listen(
            _onShared,
            onError: (_) {},
          );
    });
  }

  Future<void> _consumeInitialMedia() async {
    try {
      final initial = await ReceiveSharingIntent.instance.getInitialMedia();
      if (!mounted || initial.isEmpty) return;
      _applyFirstSupported(initial);
      await ReceiveSharingIntent.instance.reset();
    } catch (_) {}
  }

  void _onShared(List<SharedMediaFile> files) {
    if (!mounted || files.isEmpty) return;
    _applyFirstSupported(files);
  }

  void _applyFirstSupported(List<SharedMediaFile> files) {
    for (final media in files) {
      if (!_isSupportedShare(media)) continue;
      if (media.path.startsWith('http://') ||
          media.path.startsWith('https://')) {
        continue;
      }
      final file = File(media.path);
      if (!file.existsSync()) continue;
      context.read<ConverterViewModel>().applyIncomingFile(file);
      return;
    }
  }

  bool _isSupportedShare(SharedMediaFile m) {
    if (m.type == SharedMediaType.text || m.type == SharedMediaType.url) {
      return false;
    }
    final mime = m.mimeType?.toLowerCase();
    if (mime == 'application/pdf') return true;
    if (mime != null && mime.startsWith('image/')) return true;

    final ext = p.extension(m.path).toLowerCase().replaceFirst('.', '');
    if (ext.isNotEmpty && ImagePickerService.allowedExtensions.contains(ext)) {
      return true;
    }
    return ImageFormat.fromPath(m.path) != null;
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
