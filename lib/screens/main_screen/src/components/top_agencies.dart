import 'package:flutter/material.dart';

import '../../../../common/extensions/context_extension.dart';
import '../../../../common/extensions/string_extensions.dart';
import '../../../../common/main_theme/color_palette.dart';
import '../../../../common/main_theme/extensions/text_theme_extension.dart';
import '../../../../common/widgets/app_gesture_detector.dart';
import '../../../../data/models/source.dart';
import '../../../agency_detailed_screen/feature.dart';

class TopAgencies extends StatelessWidget {
  const TopAgencies({super.key, required this.sourcesList, this.onTap});
  final List<Source> sourcesList;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 120,
      child: ListView.builder(
        // padding: const EdgeInsets.symmetric(horizontal: 8),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // add randomizer?
        itemCount: sourcesList.length,
        itemBuilder: (context, index) {
          final agency = sourcesList[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: AppGestureDetector(
              alternativeDecoration: const BoxDecoration(),
              onTap: () {
                context.navigator.push(agencyDetailedScreenRoute(agency));
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.28,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 6),
                    const CircleAvatar(
                      backgroundColor: ColorPalette.error,
                      // backgroundImage:
                      //     AssetImage(AppAssets.images.standardLogo),
                      radius: 30,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      agency.name ?? '',
                      style: context.theme.textTheme.ui14Medium(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      (agency.category ?? '').capitalize(),
                      style: context.theme.textTheme.ui12Regular(context),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
