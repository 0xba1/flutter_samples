import 'package:example/consts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeProvider extends ChangeNotifier {
  late ThemeMode _themeMode;
  late SharedPreferences _prefs;

  ThemeModeProvider(SharedPreferences prefs) {
    _prefs = prefs;
    if (prefs.getString(darkModePrefsKey) ==
        DarkModeSettings.useSystemSettings) {
      _themeMode = ThemeMode.system;
    } else if (prefs.getString(darkModePrefsKey) ==
        DarkModeSettings.darkModeOn) {
      _themeMode = ThemeMode.dark;
    } else if (prefs.getString(darkModePrefsKey) ==
        DarkModeSettings.darkModeOff) {
      _themeMode = ThemeMode.light;
    }
  }

  ThemeMode get themeMode => _themeMode;

  Future<void> useSystemSettings() async {
    _themeMode = ThemeMode.system;
    notifyListeners();
    await _prefs.setString(
        darkModePrefsKey, DarkModeSettings.useSystemSettings);
  }

  Future<void> darkModeOn() async {
    _themeMode = ThemeMode.dark;
    notifyListeners();
    await _prefs.setString(darkModePrefsKey, DarkModeSettings.darkModeOn);
  }

  Future<void> darkModeOff() async {
    _themeMode = ThemeMode.light;
    notifyListeners();
    await _prefs.setString(darkModePrefsKey, DarkModeSettings.darkModeOff);
  }
}
