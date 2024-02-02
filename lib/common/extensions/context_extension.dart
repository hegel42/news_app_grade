import 'package:flutter/material.dart';

extension MainContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  //Navigator
  NavigatorState get navigator => Navigator.of(this);
  NavigatorState get rootNavigator => Navigator.of(this, rootNavigator: true);
  void get pop => navigator.pop();
  void get rootPop => rootNavigator.pop();
}
