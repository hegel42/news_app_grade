import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/article.dart';
import '../../screens/article_detailed_screen/feature.dart';
import '../extensions/context_extension.dart';
import '../main_theme/extensions/text_theme_extension.dart';
import '../main_theme/extensions/theme_data_extension.dart';
import '../utils/formatter_utils.dart';
import 'app_gesture_detector.dart';
import 'shimmer_placeholder.dart';

class MainArticleCard extends StatelessWidget {
  const MainArticleCard({
    super.key,
    required this.item,
    this.isPlaceholder = false,
  });

  final Article item;

  final bool isPlaceholder;

  factory MainArticleCard.placeholder() {
    return MainArticleCard(
      item: Article.mock(),
      isPlaceholder: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ShimmerPlaceholder(
      isEnabled: isPlaceholder,
      child: AppGestureDetector(
        onTap: () {
          context.navigator.push(articleDetailedScreenRoute(item));
        },
        alternativeDecoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          color: context.theme.bg,
          boxShadow: [
            BoxShadow(
              color: context.theme.accentSecondary,
              // spreadRadius: 0,
              blurRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: CachedNetworkImage(
                imageUrl: item.urlToImage ?? '',
                fit: BoxFit.fill,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 100,
                  padding: const EdgeInsets.all(20),
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title ?? '',
                    style: context.theme.textTheme.ui16Semibold(
                      context,
                      context.theme.text,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Divider(),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item.author ?? '',
                          style: context.theme.textTheme.ui14Regular(
                            context,
                            context.theme.text,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        Formatter.stringDateFormatter(
                          item.publishedAt ?? '',
                        ),
                        style: context.theme.textTheme.ui14Regular(
                          context,
                          context.theme.text,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
