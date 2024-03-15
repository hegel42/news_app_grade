import 'package:flutter/material.dart';

import '../extensions/context_extension.dart';
import '../main_theme/extensions/text_theme_extension.dart';
import '../main_theme/extensions/theme_data_extension.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    required this.title,
    this.actions,
    this.color,
    this.needBackButton = true,
    this.height,
    super.key,
    this.titleOnTap,
    this.centerTitle = true,
  });

  final String title;
  final List<Widget>? actions;

  final VoidCallback? titleOnTap;
  final Color? color;
  final bool needBackButton;
  final double? height;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color ?? context.theme.accent,
      elevation: 1,
      shadowColor: context.theme.cardShadow,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      leading: needBackButton
          ? SizedBox(
              child: IconButton(
                onPressed: () {
                  context.navigator.pop();
                },
                icon: const Icon(Icons.chevron_left),
              ),
            )
          : const SizedBox.shrink(),
      leadingWidth: 56,
      title: GestureDetector(
        onTap: () {
          titleOnTap?.call();
        },
        child: Text(
          title,
          style: context.theme.textTheme
              .ui22Medium(context, context.theme.altText),
        ),
      ),
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 40);
}
