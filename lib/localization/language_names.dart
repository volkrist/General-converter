import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

/// Подписи для диалога выбора языка (английские имена — нейтрально в UI).
String localePickerLabel(Locale? locale) {
  if (locale == null) {
    return ''; // подставляется из l10n.systemLanguage в месте вызова
  }
  const names = <String, String>{
    'ar': 'العربية',
    'bg': 'Български',
    'bn': 'বাংলা',
    'ca': 'Català',
    'cs': 'Čeština',
    'da': 'Dansk',
    'de': 'Deutsch',
    'el': 'Ελληνικά',
    'en': 'English',
    'es': 'Español',
    'fa': 'فارسی',
    'fi': 'Suomi',
    'fr': 'Français',
    'he': 'עברית',
    'hi': 'हिन्दी',
    'hr': 'Hrvatski',
    'hu': 'Magyar',
    'id': 'Bahasa Indonesia',
    'it': 'Italiano',
    'ja': '日本語',
    'ko': '한국어',
    'ms': 'Bahasa Melayu',
    'nb': 'Norsk (bokmål)',
    'nl': 'Nederlands',
    'pl': 'Polski',
    'pt': 'Português',
    'ro': 'Română',
    'ru': 'Русский',
    'sk': 'Slovenčina',
    'sr': 'Srpski',
    'sv': 'Svenska',
    'th': 'ไทย',
    'tr': 'Türkçe',
    'uk': 'Українська',
    'vi': 'Tiếng Việt',
    'zh': '中文',
  };
  return names[locale.languageCode] ?? locale.languageCode.toUpperCase();
}

/// Порядок: система, затем по алфавиту кода.
List<Locale> sortedSupportedLocales() {
  final list = List<Locale>.from(AppLocalizations.supportedLocales);
  list.sort((a, b) => a.languageCode.compareTo(b.languageCode));
  return list;
}
