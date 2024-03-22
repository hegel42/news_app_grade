import 'package:flutter/material.dart';

import '../../../../common/extensions/context_extension.dart';
import '../../../../common/main_theme/color_palette.dart';
import '../../../../common/main_theme/extensions/text_theme_extension.dart';
import '../../../../common/widgets/app_gesture_detector.dart';
import '../model/sort_model.dart';

class SortListWidget extends StatefulWidget {
  const SortListWidget({super.key, required this.onChange});

  final Function(String id) onChange;

  @override
  // ignore: library_private_types_in_public_api
  _SortListWidgetState createState() => _SortListWidgetState();
}

class _SortListWidgetState extends State<SortListWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final sortList = [
      SortModel(name: context.locale.relevance, searchId: 'relevancy'),
      SortModel(name: context.locale.popularity, searchId: 'popularity'),
      SortModel(name: context.locale.publishDate, searchId: 'publishedAt'),
    ];

    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: [
        ...List.generate(
          sortList.length,
          (index) {
            final item = sortList[index];

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
    return UnconstrainedBox(
      child: AppGestureDetector(
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
              style: context.theme.textTheme.ui14Regular(
                context,
                isSelected ? ColorPalette.mainWhite : ColorPalette.mainBlack,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
