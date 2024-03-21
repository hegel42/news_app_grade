import 'package:flutter/material.dart';

import '../../../../common/constants/main_constants.dart';
import '../../../../common/extensions/context_extension.dart';
import '../../../../common/main_theme/color_palette.dart';
import '../../../../common/main_theme/extensions/text_theme_extension.dart';
import '../../../../common/widgets/app_gesture_detector.dart';

class SortListWidget extends StatefulWidget {
  const SortListWidget({super.key, required this.onChange});

  final Function(String id) onChange;

  @override
  _SortListWidgetState createState() => _SortListWidgetState();
}

class _SortListWidgetState extends State<SortListWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...List.generate(
          MainConstants.sortList.length,
          (index) {
            final item = MainConstants.sortList[index];

            return _SortContainer(
              name: item.name,
              isSelected: selectedIndex == index,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  widget.onChange.call(item.searchId);
                });
              },
            );
          },
        ),
      ],
    );
  }
}

class _SortContainer extends StatelessWidget {
  const _SortContainer({
    required this.isSelected,
    required this.onTap,
    required this.name,
  });
  final bool isSelected;
  final VoidCallback onTap;
  final String name;

  @override
  Widget build(BuildContext context) {
    return AppGestureDetector(
      onTap: onTap,
      alternativeDecoration: BoxDecoration(
        color: isSelected ? ColorPalette.secondaryAccent : ColorPalette.grey,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Center(
          child: Text(
            name,
            style: context.theme.textTheme.ui16Regular(
              context,
              isSelected ? ColorPalette.mainWhite : ColorPalette.mainBlack,
            ),
          ),
        ),
      ),
    );
  }
}
