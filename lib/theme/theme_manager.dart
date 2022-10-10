import 'package:flutter/material.dart';

// singleton
class ThemeManager with ChangeNotifier {
  static final ThemeManager _instance = ThemeManager._internal();

  ThemeManager._internal();

  factory ThemeManager() {
    return _instance;
  }

  ThemeMode _themeMode = ThemeMode.dark;

  get themeMode => _themeMode;

  toggleThemeMode(bool isDark) {
    _themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
