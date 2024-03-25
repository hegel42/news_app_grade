import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants/main_constants.dart';

class ChangeThemeProvider extends ChangeNotifier {
  ChangeThemeProvider() {
    _loadThemePreference();
  }
  bool _isDark = false;
  late SharedPreferences _prefs;

  bool get isDark => _isDark;

  Future<void> _loadThemePreference() async {
    _prefs = await SharedPreferences.getInstance();
    _isDark = _prefs.getBool(MainConstants.prefsThemeIsDark) ?? false;
    notifyListeners();
  }

  Future<void> _saveThemePreference(bool isDark) async {
    await _prefs.setBool(MainConstants.prefsThemeIsDark, isDark);
  }

  void changeTheme() {
    _isDark = !_isDark;
    _saveThemePreference(_isDark);
    notifyListeners();
  }
}
