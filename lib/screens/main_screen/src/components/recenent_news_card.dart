import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../common/extensions/context_extension.dart';
import '../../../../common/main_theme/color_palette.dart';
import '../../../../common/main_theme/extensions/text_theme_extension.dart';
import '../../../../common/main_theme/extensions/theme_data_extension.dart';
import '../../../../common/widgets/app_gesture_detector.dart';
import '../../../../data/models/article.dart';
import '../../../article_detailed_screen/feature.dart';

class RecentNewsGrid extends StatelessWidget {
  const RecentNewsGrid({
    super.key,
    required this.hotnewsList,
  });
  final List<Article> hotnewsList;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 290,
      ),
      itemCount: hotnewsList.length,
      itemBuilder: (BuildContext context, int index) {
        final news = hotnewsList[index];

        return AppGestureDetector(
          alternativeDecoration: BoxDecoration(
            color: context.theme.bg,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: ColorPalette.border.withOpacity(0.13),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          onTap: () {
            context.navigator.push(articleDetailedScreenRoute(news));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage ?? '',
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.title ?? '',
                      style: context.theme.textTheme
                          .ui14Semibold(context, context.theme.text),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Divider(),
                    Text(
                      news.source?.name ?? '',
                      style: context.theme.textTheme
                          .ui16Regular(context, context.theme.text),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      news.publishedAt ?? '',
                      style: context.theme.textTheme
                          .ui12Regular(context, context.theme.text),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
