import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../common/extensions/context_extension.dart';
import '../../../../common/main_theme/color_palette.dart';
import '../../../../common/main_theme/extensions/text_theme_extension.dart';
import '../../../../common/main_theme/extensions/theme_data_extension.dart';
import '../../../../common/utils/formatter_utils.dart';
import '../../../../common/widgets/app_gesture_detector.dart';
import '../../../../common/widgets/shimmer_placeholder.dart';
import '../../../../data/models/article.dart';
import '../../../article_detailed_screen/feature.dart';

class TopHeadlinesCards extends StatelessWidget {
  const TopHeadlinesCards({
    super.key,
    required this.articlesList,
    this.isPlaceholder = false,
  });
  factory TopHeadlinesCards.placeholder() {
    return TopHeadlinesCards(
      articlesList: [Article.mock(), Article.mock()],
      isPlaceholder: true,
    );
  }

  final List<Article> articlesList;

  final bool isPlaceholder;

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

          return isPlaceholder
              ? HeadlineCard.placeholder()
              : HeadlineCard(news: news);
        },
      ),
    );
  }
}

class HeadlineCard extends StatelessWidget {
  const HeadlineCard({
    super.key,
    required this.news,
    this.isPlaceholder = false,
  });

  factory HeadlineCard.placeholder() {
    return HeadlineCard(
      news: Article.mock(),
      isPlaceholder: true,
    );
  }

  final Article news;

  final bool isPlaceholder;

  @override
  Widget build(BuildContext context) {
    return AppGestureDetector(
      alternativeDecoration: BoxDecoration(color: context.theme.bg),
      onTap: () {
        context.navigator.push(articleDetailedScreenRoute(news));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ShimmerPlaceholder(
          isEnabled: isPlaceholder,
          child: Stack(
            children: [
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage ?? '',
                  fit: BoxFit.cover,
                  // TODO replace error widget with placeholder
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Container(
                    color: context.theme.bg,
                  ),
                ),
              ),
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
                          Text(
                            Formatter.stringDateFormatter(
                              news.publishedAt ?? '',
                            ),
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: context.theme.textTheme.ui14Regular(
                              context,
                              ColorPalette.mainWhite,
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
      ),
    );
  }
}
