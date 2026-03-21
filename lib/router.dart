import 'package:flutter/material.dart';

import 'screens/converter_screen.dart';

class AppRouter {
  static const String converter = '/';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case converter:
        return MaterialPageRoute(builder: (_) => const ConverterScreen());
      default:
        return MaterialPageRoute(builder: (_) => const ConverterScreen());
    }
  }
}
