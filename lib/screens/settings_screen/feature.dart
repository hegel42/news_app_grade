import 'package:flutter/cupertino.dart';
import 'src/settings_screen.dart';

CupertinoPageRoute settingsScreenRoute(RouteSettings route) {
  return CupertinoPageRoute(
    settings: route,
    builder: (context) => const SettingsScreen(),
  );
}
