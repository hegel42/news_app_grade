import 'package:flutter/cupertino.dart';
import 'src/main_screen.dart';

CupertinoPageRoute mainScreenRoute(RouteSettings route) {
  return CupertinoPageRoute(
    settings: route,
    builder: (context) => const MainScreen(),
  );
}
