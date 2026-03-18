import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'di/providers.dart';
import 'router.dart';
import 'theme/app_theme.dart';

class GeneralConverterApp extends StatelessWidget {
  const GeneralConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: MaterialApp(
        title: 'General Converter',
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: ThemeMode.system,
        onGenerateRoute: AppRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
