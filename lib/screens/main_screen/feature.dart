import 'package:flutter/cupertino.dart';
import 'package:news_app_grade/screens/main_screen/src/main_screen.dart';

CupertinoPageRoute mainScreenRoute(RouteSettings route) {
  return CupertinoPageRoute(
    settings: route,
    builder: (context) => const MainScreen(),
  );
}
