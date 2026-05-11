import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Хранит выбор темы пользователя.
///
/// Сохраняем как короткую строку (`light` / `dark`); отсутствие ключа = `dark`
/// по историческим причинам (приложение запускалось в тёмной теме).
class ThemeViewModel extends ChangeNotifier {
  ThemeViewModel() {
    if (!kIsWeb) {
      // Async fire-and-forget: к моменту первого билда тема ещё может
      // быть [ThemeMode.dark] (дефолт), это допустимо — UI просто моргнёт
      // один раз и закрепится в выбранной теме.
      _load();
    }
  }

  static const _prefKey = 'theme_mode';

  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;

  bool get isDark => _themeMode == ThemeMode.dark;

  Future<void> toggleTheme() async {
    _themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefKey, isDark ? 'dark' : 'light');
    } catch (_) {}
  }

  Future<void> _load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getString(_prefKey);
      if (value == 'light') {
        _themeMode = ThemeMode.light;
        notifyListeners();
      } else if (value == 'dark') {
        _themeMode = ThemeMode.dark;
        notifyListeners();
      }
    } catch (_) {}
  }
}
