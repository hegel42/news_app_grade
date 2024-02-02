import 'package:flutter/material.dart';

extension TextThemeExtension on TextTheme {
  TextStyle ui16Semibold(BuildContext context, [Color? color]) => TextStyle(
        color: color,
        fontSize: 16,
        fontFamily: 'Montserrat',
        height: 24 / 16,
        fontWeight: FontWeight.w600,
      );

  TextStyle ui16Medium(BuildContext context, [Color? color]) => TextStyle(
        color: color,
        fontSize: 16,
        fontFamily: 'Montserrat',
        height: 24 / 16,
        fontWeight: FontWeight.w500,
      );

  TextStyle ui16Regular(BuildContext context, [Color? color]) => TextStyle(
        color: color,
        fontSize: 16,
        height: 24 / 16,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
      );

  TextStyle ui24Medium(BuildContext context, [Color? color]) => TextStyle(
        color: color,
        fontSize: 24,
        height: 36 / 24,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
      );

  TextStyle label(BuildContext context, [Color? color]) => TextStyle(
        color: color,
        fontSize: 10,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
      );

  TextStyle ui12Medium(BuildContext context, [Color? color]) => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat',
        color: color,
        height: 16 / 12,
      );

  TextStyle ui12Regular(BuildContext context, [Color? color]) => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
        color: color,
        height: 16 / 12,
      );

  TextStyle ui12Semibold(BuildContext context, [Color? color]) => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: 'Montserrat',
        height: 16 / 12,
        color: color,
      );

  TextStyle ui14Regular(BuildContext context, [Color? color]) => TextStyle(
        color: color,
        fontSize: 14,
        height: 20 / 14,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
      );

  TextStyle ui14Medium(BuildContext context, [Color? color]) => TextStyle(
        color: color,
        fontSize: 14,
        height: 20 / 14,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
      );

  TextStyle ui14Semibold(BuildContext context, [Color? color]) => TextStyle(
        color: color,
        fontSize: 14,
        height: 20 / 14,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
      );

  TextStyle ui18Medium(BuildContext context, [Color? color]) => TextStyle(
        color: color,
        fontSize: 18,
        fontFamily: 'Montserrat',
        height: 24 / 18,
        fontWeight: FontWeight.w500,
      );

  TextStyle ui18Semibold(BuildContext context, [Color? color]) => TextStyle(
        color: color,
        fontSize: 18,
        height: 24 / 18,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
      );

  TextStyle ui18Regular(BuildContext context, [Color? color]) => TextStyle(
        color: color,
        fontSize: 18,
        height: 24 / 18,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
      );

  TextStyle ui22Medium(BuildContext context, [Color? color]) => TextStyle(
        color: color,
        fontSize: 22,
        height: 32 / 22,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
      );
}
