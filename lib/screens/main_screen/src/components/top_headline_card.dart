import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../common/extensions/context_extension.dart';
import '../../../../common/main_theme/color_palette.dart';
import '../../../../common/main_theme/extensions/text_theme_extension.dart';
import '../../../../common/widgets/app_gesture_detector.dart';
import '../../../../data/models/article.dart';
import '../../../agency_detailed_screen/feature.dart';

class TopHeadlinesCard extends StatelessWidget {
  const TopHeadlinesCard({
    super.key,
    required this.articlesList,
  });

  final List<Article> articlesList;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(viewportFraction: 0.9);

    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: pageController,
        itemCount: articlesList.length,
        itemBuilder: (context, index) {
          final news = articlesList[index];

          return AppGestureDetector(
            alternativeDecoration: const BoxDecoration(),
            onTap: () {
              context.rootNavigator
                  .push(agencyDetailedScreenRoute(news.source!));
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  // Positioned.fill(
                  //   child: CachedNetworkImage(
                  //     imageUrl: news.urlToImage ?? '',
                  //     fit: BoxFit.cover,
                  //     // TODO replace error widget with placeholder
                  //     placeholder: (context, url) =>
                  //         const Center(child: CircularProgressIndicator()),
                  //     errorWidget: (context, url, error) => Container(
                  //       color: context.theme.bg,
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            ColorPalette.mainBlack.withOpacity(0.7),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            news.title ?? '',
                            style: context.theme.textTheme.ui18Medium(
                              context,
                              ColorPalette.mainWhite,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  news.source?.name ?? '',
                                  style: context.theme.textTheme.ui14Regular(
                                    context,
                                    ColorPalette.mainWhite,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  news.publishedAt ?? '',
                                  softWrap: false,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: context.theme.textTheme.ui14Regular(
                                    context,
                                    ColorPalette.mainWhite,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
