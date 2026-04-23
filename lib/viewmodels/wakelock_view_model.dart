import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class WakelockViewModel extends ChangeNotifier {
  static const _prefKey = 'pref_wakelock_enabled';

  bool enabled = false;

  WakelockViewModel() {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getBool(_prefKey);
    if (stored != null) {
      enabled = stored;
    } else {
      enabled = !kReleaseMode; // default: on during development
    }
    await _apply();
    notifyListeners();
  }

  Future<void> setEnabled(bool v) async {
    if (enabled == v) return;
    enabled = v;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefKey, v);
    await _apply();
  }

  Future<void> _apply() async {
    if (enabled) {
      await WakelockPlus.enable();
    } else {
      await WakelockPlus.disable();
    }
  }
}
