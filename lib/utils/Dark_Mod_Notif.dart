import 'package:flutter/material.dart';

enum ThemeModeType { light, dark }

class ThemeModeProvider with ChangeNotifier {
  ThemeModeType _themeMode = ThemeModeType.light;

  ThemeModeType get themeMode => _themeMode;

  set IsDark(ThemeModeType value) {
    _themeMode = value;
    notifyListeners();
  }

  void toggleThemeMode() {
    _themeMode = _themeMode == ThemeModeType.light
        ? ThemeModeType.dark
        : ThemeModeType.light;
    notifyListeners();
  }
}
