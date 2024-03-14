import 'package:flutter/material.dart';

import '../extensions/context_extension.dart';
import '../main_theme/color_palette.dart';
import '../main_theme/extensions/text_theme_extension.dart';
import '../main_theme/extensions/theme_data_extension.dart';

class AppFilledButton extends StatelessWidget {
  const AppFilledButton({
    required this.onTap,
    required this.buttonText,
    this.backgroundColor,
    super.key,
    this.padding,
    this.iconBottomPadding = 0,
  });

  final VoidCallback onTap;
  final String buttonText;
  final Color? backgroundColor;

  final EdgeInsets? padding;
  final double iconBottomPadding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      statesController: MaterialStatesController(),
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: MaterialStatePropertyAll(
          padding ?? const EdgeInsets.symmetric(vertical: 15),
        ),
        overlayColor: MaterialStatePropertyAll(
          ColorPalette.cardShadowColor.withOpacity(0.1),
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return context.theme.border;
          }
          return backgroundColor ?? context.theme.accent;
        }),
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
      onPressed: onTap.call,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonText,
            textAlign: TextAlign.center,
            style: context.theme.textTheme
                .ui16Semibold(context, context.theme.altText),
          ),
        ],
      ),
    );
  }
}
