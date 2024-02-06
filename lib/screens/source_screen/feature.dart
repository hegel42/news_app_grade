import 'package:flutter/cupertino.dart';
import 'src/source_screen.dart';

CupertinoPageRoute sourceScreenRoute(RouteSettings route) {
  return CupertinoPageRoute(
    settings: route,
    builder: (context) => const SourceScreen(),
  );
}
