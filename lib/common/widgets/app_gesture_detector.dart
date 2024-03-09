import 'package:flutter/material.dart';

import '../extensions/context_extension.dart';

class AppGestureDetector extends StatelessWidget {
  const AppGestureDetector({
    super.key,
    required this.child,
    this.onTap,
    this.alternativeDecoration,
    this.inkRadius,
  });
  final Widget child;
  final Function()? onTap;
  final BoxDecoration? alternativeDecoration;
  final double? inkRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: alternativeDecoration ??
          BoxDecoration(
            color: context.theme.cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: context.theme.shadowColor,
                // spreadRadius: 0,
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(inkRadius ?? 16),
          child: child,
        ),
      ),
    );
  }
}
