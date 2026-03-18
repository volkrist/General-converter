import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'di/providers.dart';
import 'router.dart';
import 'theme/app_theme.dart';
import 'theme/theme_view_model.dart';

class GeneralConverterApp extends StatelessWidget {
  const GeneralConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: Consumer<ThemeViewModel>(
        builder: (context, themeVm, _) {
          return MaterialApp(
            title: 'General Converter',
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: themeVm.themeMode,
            onGenerateRoute: AppRouter.onGenerateRoute,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
