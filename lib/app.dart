import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_theme.dart';
import 'l10n/app_localizations.dart';
import 'localization/locale_controller.dart';
import 'providers.dart';
import 'router.dart';
import 'theme_view_model.dart';
import 'viewmodels/wakelock_view_model.dart';
import 'widgets/incoming_shared_files_listener.dart';

class GeneralConverterApp extends StatelessWidget {
  const GeneralConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: Consumer2<ThemeViewModel, LocaleController>(
        builder: (context, themeVm, localeVm, _) {
          final wakelockVm = context.watch<WakelockViewModel>();
          // reference wakelockVm to ensure the app rebuilds when pref changes
          final _ = wakelockVm.enabled;

          return MaterialApp(
            onGenerateTitle: (ctx) => AppLocalizations.of(ctx).appName,
            locale: localeVm.localeOverride,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            localeListResolutionCallback: (locales, supported) {
              if (locales != null && locales.isNotEmpty) {
                for (final deviceLocale in locales) {
                  for (final supportedLocale in supported) {
                    if (supportedLocale.languageCode ==
                        deviceLocale.languageCode) {
                      return supportedLocale;
                    }
                  }
                }
              }
              return const Locale('en');
            },
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: themeVm.themeMode,
            onGenerateRoute: AppRouter.onGenerateRoute,
            debugShowCheckedModeBanner: false,
            builder: (context, child) => SafeArea(
              child: IncomingSharedFilesListener(
                child: child ?? const SizedBox.shrink(),
              ),
            ),
            // Provide an app-level AppBar leading button via Navigator's first route.
          );
        },
      ),
    );
  }
}
