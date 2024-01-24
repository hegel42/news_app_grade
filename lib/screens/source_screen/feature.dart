import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_grade/screens/source_screen/src/source_screen.dart';

CupertinoPageRoute sourceScreenRoute(RouteSettings route) {
  return CupertinoPageRoute(
    settings: route,
    builder: (context) => const SourceScreen(),
  );
}
