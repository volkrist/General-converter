import 'package:flutter/material.dart';

import '../constants/app_strings.dart';
import 'screens/converter_web_screen.dart';

/// Точка входа Flutter Web: тот же репозиторий, отдельный shell без Android-специфики.
class GeneralConverterWebApp extends StatelessWidget {
  const GeneralConverterWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${AppStrings.appName} (Web)',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const ConverterWebScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
