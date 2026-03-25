import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Хранит явный выбор языка (`null` = как в системе).
final class LocaleController extends ChangeNotifier {
  static const _prefKey = 'locale_language_code';

  Locale? _override;

  /// `null` — не переопределять [MaterialApp.locale] (берётся система).
  Locale? get localeOverride => _override;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_prefKey);
    if (code == null || code.isEmpty) {
      _override = null;
    } else {
      _override = Locale(code);
    }
    notifyListeners();
  }

  Future<void> setLocaleOverride(Locale? locale) async {
    _override = locale;
    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      await prefs.remove(_prefKey);
    } else {
      await prefs.setString(_prefKey, locale.languageCode);
    }
    notifyListeners();
  }
}
