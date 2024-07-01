// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ThemeService {
//   final String key = "theme_mode";
//   SharedPreferences? _prefs;

//   Future<void> initialize() async {
//     _prefs = await SharedPreferences.getInstance();
//   }

//   ThemeMode getThemeMode() {
//     final themeMode = _prefs?.getString(key) ?? "light";
//     return themeMode == "dark" ? ThemeMode.dark : ThemeMode.light;
//   }

//   Future<void> toggleThemeMode() async {
//     final themeMode = getThemeMode() == ThemeMode.dark ? "light" : "dark";
//     await _prefs?.setString(key, themeMode);
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  static const String prefKey = 'theme_mode';
  ThemeMode _themeMode = ThemeMode.system;

  Future<void> initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? themeMode = prefs.getString(prefKey);
    if (themeMode != null) {
      _themeMode =
          ThemeMode.values.firstWhere((e) => e.toString() == themeMode);
    }
  }

  ThemeMode getThemeMode() => _themeMode;

  Future<void> toggleThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    await prefs.setString(prefKey, _themeMode.toString());
  }
}
