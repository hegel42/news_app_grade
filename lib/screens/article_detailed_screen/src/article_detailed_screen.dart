import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../common/extensions/context_extension.dart';
import '../../../common/main_theme/extensions/text_theme_extension.dart';
import '../../../common/main_theme/extensions/theme_data_extension.dart';
import '../../../common/modals/app_snackbar.dart';
import '../../../common/utils/formatter_utils.dart';
import '../../../common/utils/launcher_utils.dart';
import '../../../common/widgets/app_filled_button.dart';
import '../../../common/widgets/main_app_bar.dart';
import '../../../data/models/article.dart';

class ArticleDetailedScreen extends StatelessWidget {
  const ArticleDetailedScreen({
    super.key,
    required this.article,
  });
  final Article article;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MainAppBar(
          title: article.source?.name ?? '',
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? '',
                width: double.infinity,
                fit: BoxFit.cover,
                height: 200,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Container(
                  color: Colors.red,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList.list(
                children: [
                  Text(
                    article.title ?? '',
                    style: context.theme.textTheme
                        .ui24Medium(context, context.theme.text),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          article.author ?? '',
                          style: context.theme.textTheme
                              .ui16Medium(context, context.theme.text),
                        ),
                      ),
                      Text(
                        Formatter.stringDateFormatter(
                          article.publishedAt ?? '',
                        ),
                        style: context.theme.textTheme
                            .ui16Medium(context, context.theme.text),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    article.description ?? '',
                    style: context.theme.textTheme
                        .ui16Regular(context, context.theme.text),
                  ),
                  Text(
                    Formatter.longTextFormatter(
                      // TODO add placeholder
                      article.content ?? '',
                    ),
                    style: context.theme.textTheme
                        .ui16Regular(context, context.theme.text),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: AppFilledButton(
            onTap: () {
              // launchUrl(article.url ?? '');
              launchInWebView(
                article.url ?? '',
                onError: () {
                  showAppSnackBar(
                    context,
                    context.locale.cantOpenURlError,
                    isError: true,
                  );
                },
              );
            },
            buttonText: context.locale.readMore,
          ),
        ),
      ),
    );
  }
}
