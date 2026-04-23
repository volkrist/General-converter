import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

import 'app_theme.dart';
import 'l10n/app_localizations.dart';
import 'localization/locale_controller.dart';
import 'providers.dart';
import 'router.dart';
import 'theme_view_model.dart';
import 'widgets/incoming_shared_files_listener.dart';

bool _wakelockEnabled = false;

class GeneralConverterApp extends StatelessWidget {
  const GeneralConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (!kReleaseMode && !_wakelockEnabled) {
      Wakelock.enable();
      _wakelockEnabled = true;
    }
    return MultiProvider(
      providers: appProviders,
      child: Consumer2<ThemeViewModel, LocaleController>(
        builder: (context, themeVm, localeVm, _) {
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
            builder: (context, child) => IncomingSharedFilesListener(
              child: child ?? const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
