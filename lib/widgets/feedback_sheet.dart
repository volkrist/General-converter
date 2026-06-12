import 'package:flutter/material.dart';

import '../services/feedback_service.dart';

Future<void> showFeedbackSheet(BuildContext context) async {
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (sheetContext) {
      return Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 20,
        ),
        child: const FeedbackSheetContent(),
      );
    },
  );
}

class FeedbackSheetContent extends StatefulWidget {
  const FeedbackSheetContent({super.key});

  @override
  State<FeedbackSheetContent> createState() => _FeedbackSheetContentState();
}

class _FeedbackSheetContentState extends State<FeedbackSheetContent> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _sendFeedback() async {
    final message = _controller.text.trim();
    if (message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter feedback before sending.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final success = await sendFeedbackToGoogleSheets(message);

    if (!mounted) {
      return;
    }

    setState(() {
      _isLoading = false;
    });

    if (success) {
      _controller.clear();
      navigator.pop();
      messenger.showSnackBar(
        const SnackBar(content: Text('Thanks for your feedback.')),
      );
    } else {
      messenger.showSnackBar(
        const SnackBar(content: Text('Could not send feedback right now.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Feedback', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        const Text(
          'Share a short note about what worked or what needs fixing.',
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _controller,
          maxLines: 5,
          minLines: 3,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Type your feedback here',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _isLoading ? null : _sendFeedback,
            child: _isLoading
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Send'),
          ),
        ),
      ],
    );
  }
}
