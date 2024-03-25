import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';
import '../../main_theme/color_palette.dart';
import '../../main_theme/extensions/text_theme_extension.dart';
import '../../main_theme/extensions/theme_data_extension.dart';

void showAppSnackBar(
  BuildContext context,
  String message, {
  bool isError = false,
}) {
  Flushbar(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
    backgroundColor:
        isError ? ColorPalette.error : ColorPalette.secondaryAccent,
    borderRadius: const BorderRadius.all(Radius.circular(4)),
    messageText: Text(
      message,
      style: context.theme.textTheme.ui16Medium(context, context.theme.text),
    ),
    duration: const Duration(seconds: 3),
  ).show(context);
}
