import 'package:flutter/material.dart';

import '../../../../common/extensions/context_extension.dart';
import '../../../../common/main_theme/color_palette.dart';
import '../../../../common/main_theme/extensions/text_theme_extension.dart';
import '../../../../common/main_theme/extensions/theme_data_extension.dart';
import '../../../../common/widgets/app_gesture_detector.dart';

class RegionItem extends StatefulWidget {
  const RegionItem({
    Key? key,
    required this.name,
    required this.regionCode,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  final String name;
  final String regionCode;
  final bool isSelected;
  final VoidCallback onSelect;

  @override
  State<RegionItem> createState() => _RegionItemState();
}

class _RegionItemState extends State<RegionItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _sizeAnimation = Tween<double>(begin: 1, end: 1.2).animate(_controller);

    if (widget.isSelected) {
      _isSelected = true;
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (!widget.isSelected) {
      widget.onSelect();
      _isSelected = true;
      _controller.forward();
    } else {
      _isSelected = false;
      _controller.reverse();
    }
  }

  @override
  void didUpdateWidget(covariant RegionItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected && !_isSelected) {
      _isSelected = true;
      _controller.forward();
    } else if (!widget.isSelected && _isSelected) {
      _isSelected = false;
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: AppGestureDetector(
        alternativeDecoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: context.theme.accentSecondary,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          color: widget.isSelected
              ? ColorPalette.secondaryAccent
              : ColorPalette.mainWhite,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        onTap: _handleTap,
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Padding(
                padding: EdgeInsets.all(8 * _sizeAnimation.value),
                child: Center(
                  child: Text(
                    widget.name,
                    style: context.theme.textTheme
                        .ui14Medium(
                          context,
                          _isSelected
                              ? ColorPalette.mainWhite
                              : ColorPalette.mainBlack,
                        )
                        .copyWith(fontSize: 14 * _sizeAnimation.value),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
