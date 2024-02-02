import 'package:flutter/material.dart';
import 'package:news_app_grade/common/main_theme/color_palette.dart';

extension ThemeDataExtension on ThemeData {
  bool get isDark => brightness == Brightness.dark;

  Color get bg => isDark ? ColorPalette.mainBlack : ColorPalette.mainWhite;

  Color get text => isDark ? ColorPalette.mainWhite : ColorPalette.mainBlack;

  Color get border => isDark ? ColorPalette.border : ColorPalette.border;

  Color get altText => isDark ? ColorPalette.grey : ColorPalette.grey;

  Color get accent => isDark ? ColorPalette.primaryAccent : ColorPalette.primaryAccent;

  Color get accentSecondary => isDark ? ColorPalette.secondaryAccent : ColorPalette.secondaryAccent;

  Color get error => isDark ? ColorPalette.error : ColorPalette.error;

  Color get statusError => isDark ? ColorPalette.error : ColorPalette.error;

  Color get statusSuccess => isDark ? ColorPalette.success : ColorPalette.success;

  Color get cardShadow => isDark ? ColorPalette.cardShadowColor : ColorPalette.cardShadowColor;
}
