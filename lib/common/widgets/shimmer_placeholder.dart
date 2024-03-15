import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../extensions/context_extension.dart';
import '../main_theme/extensions/theme_data_extension.dart';

class ShimmerPlaceholder extends StatelessWidget {
  const ShimmerPlaceholder(
      {required this.child, required this.isEnabled, super.key});
  final Widget child;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final baseColor = context.theme.border;
    final highlightColor = context.theme.altText;

    return isEnabled
        ? Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: child,
            ),
          )
        : child;
  }
}
