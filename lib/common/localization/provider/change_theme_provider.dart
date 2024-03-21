import 'package:flutter/material.dart';

class ChangeThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  void changeTheme() {
    _isDark = !_isDark;
    // TODO add save to prefs
    notifyListeners();
  }
}
