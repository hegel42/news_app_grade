import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData mainAppLightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Montserrat',
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,),
  ),
);

ThemeData mainAppDarkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Montserrat',
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,),
  ),
);
