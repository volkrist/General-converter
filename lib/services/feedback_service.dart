import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const String kFeedbackFormUrl =
    'https://docs.google.com/forms/d/e/1FAIpQLSfR_Q8Hu_0YDcsZ7-JGXuoHLSD9dohF7Znj0gKEtsADaGk85Q/formResponse';

const String kFeedbackMessageField = 'entry.1425928084';

Future<bool> sendFeedbackToGoogleSheets(String userMessage) async {
  final url = Uri.parse(kFeedbackFormUrl);

  try {
    final response = await http
        .post(url, body: {kFeedbackMessageField: userMessage})
        .timeout(const Duration(seconds: 15));

    return response.statusCode == 200 || response.statusCode == 302;
  } on TimeoutException catch (e, stackTrace) {
    if (kDebugMode) {
      debugPrint('Feedback request timed out: $e');
      debugPrint('$stackTrace');
    }
    return false;
  } catch (e, stackTrace) {
    if (kDebugMode) {
      debugPrint('Error sending feedback: $e');
      debugPrint('$stackTrace');
    }
    return false;
  }
}
