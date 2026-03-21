import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/app_strings.dart';
import 'providers.dart';
import 'router.dart';
import 'app_theme.dart';
import 'theme_view_model.dart';
import 'widgets/incoming_shared_files_listener.dart';

class GeneralConverterApp extends StatelessWidget {
  const GeneralConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: Consumer<ThemeViewModel>(
        builder: (context, themeVm, _) {
          return MaterialApp(
            title: AppStrings.appName,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: themeVm.themeMode,
            onGenerateRoute: AppRouter.onGenerateRoute,
            debugShowCheckedModeBanner: false,
            builder: (context, child) => IncomingSharedFilesListener(
              child: child ?? const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
