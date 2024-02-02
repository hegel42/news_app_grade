import 'package:flutter/cupertino.dart';
import 'package:news_app_grade/screens/settings_screen/src/settings_screen.dart';

CupertinoPageRoute settingsScreenRoute(RouteSettings route) {
  return CupertinoPageRoute(
    settings: route,
    builder: (context) => const SettingsScreen(),
  );
}
