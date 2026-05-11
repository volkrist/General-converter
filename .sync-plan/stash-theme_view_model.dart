import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ╨е╤А╨░╨╜╨╕╤В ╨▓╤Л╨▒╨╛╤А ╤В╨╡╨╝╤Л ╨┐╨╛╨╗╤М╨╖╨╛╨▓╨░╤В╨╡╨╗╤П.
///
/// ╨б╨╛╤Е╤А╨░╨╜╤П╨╡╨╝ ╨║╨░╨║ ╨║╨╛╤А╨╛╤В╨║╤Г╤О ╤Б╤В╤А╨╛╨║╤Г (`light` / `dark`); ╨╛╤В╤Б╤Г╤В╤Б╤В╨▓╨╕╨╡ ╨║╨╗╤О╤З╨░ = `dark`
/// ╨┐╨╛ ╨╕╤Б╤В╨╛╤А╨╕╤З╨╡╤Б╨║╨╕╨╝ ╨┐╤А╨╕╤З╨╕╨╜╨░╨╝ (╨┐╤А╨╕╨╗╨╛╨╢╨╡╨╜╨╕╨╡ ╨╖╨░╨┐╤Г╤Б╨║╨░╨╗╨╛╤Б╤М ╨▓ ╤В╤С╨╝╨╜╨╛╨╣ ╤В╨╡╨╝╨╡).
class ThemeViewModel extends ChangeNotifier {
  ThemeViewModel() {
    if (!kIsWeb) {
      // Async fire-and-forget: ╨║ ╨╝╨╛╨╝╨╡╨╜╤В╤Г ╨┐╨╡╤А╨▓╨╛╨│╨╛ ╨▒╨╕╨╗╨┤╨░ ╤В╨╡╨╝╨░ ╨╡╤Й╤С ╨╝╨╛╨╢╨╡╤В
      // ╨▒╤Л╤В╤М [ThemeMode.dark] (╨┤╨╡╤Д╨╛╨╗╤В), ╤Н╤В╨╛ ╨┤╨╛╨┐╤Г╤Б╤В╨╕╨╝╨╛ тАФ UI ╨┐╤А╨╛╤Б╤В╨╛ ╨╝╨╛╤А╨│╨╜╤С╤В
      // ╨╛╨┤╨╕╨╜ ╤А╨░╨╖ ╨╕ ╨╖╨░╨║╤А╨╡╨┐╨╕╤В╤Б╤П ╨▓ ╨▓╤Л╨▒╤А╨░╨╜╨╜╨╛╨╣ ╤В╨╡╨╝╨╡.
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
