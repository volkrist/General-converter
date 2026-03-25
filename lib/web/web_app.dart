import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../localization/locale_controller.dart';
import '../constants/app_strings.dart' as en_bridge;
import 'screens/converter_web_screen.dart';

/// Точка входа Flutter Web: тот же репозиторий, отдельный shell без Android-специфики.
class GeneralConverterWebApp extends StatelessWidget {
  const GeneralConverterWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocaleController()..load(),
      child: Consumer<LocaleController>(
        builder: (context, localeVm, _) {
          return MaterialApp(
            onGenerateTitle: (ctx) {
              final l = AppLocalizations.of(ctx);
              return '${l.appName} ${l.appNameWebSuffix}';
            },
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
            title: '${en_bridge.AppStrings.appName} (Web)',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
              useMaterial3: true,
            ),
            home: const ConverterWebScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
