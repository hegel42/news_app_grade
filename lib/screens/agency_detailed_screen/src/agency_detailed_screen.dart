import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/extensions/context_extension.dart';
import '../../../common/main_theme/extensions/text_theme_extension.dart';
import '../../../common/main_theme/extensions/theme_data_extension.dart';
import '../../../common/modals/app_snackbar.dart';
import '../../../common/utils/formatter_utils.dart';
import '../../../common/utils/launcher_utils.dart';
import '../../../common/widgets/app_gesture_detector.dart';
import '../../../common/widgets/main_app_bar.dart';
import '../../../common/widgets/shimmer_placeholder.dart';
import '../../../data/models/article.dart';
import '../../../data/models/source.dart';
import '../../article_detailed_screen/feature.dart';
import 'bloc/agency_detailed_bloc.dart';

class AgencyDetailScreen extends StatelessWidget {
  const AgencyDetailScreen({
    super.key,
    required this.source,
  });

  final Source source;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MainAppBar(title: source.name ?? ''),
        body: BlocConsumer<AgencyDetailedBloc, AgencyDetailedState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                context
                    .read<AgencyDetailedBloc>()
                    .add(AgencyDetailedFetchData(source: source.id));
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                        Text(
                          'Category: ${source.category ?? ''}',
                          style: context.theme.textTheme
                              .ui16Medium(context, context.theme.text),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            source.description ?? '',
                            style: context.theme.textTheme
                                .ui14Medium(context, context.theme.text),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            launchInWebView(
                              source.url ?? '',
                              onError: () {
                                showAppSnackBar(
                                  context,
                                  'cant open URL',
                                  isError: true,
                                );
                              },
                            );
                          },
                          child: Text(
                            source.url ?? '',
                            style: context.theme.textTheme.ui16Medium(
                              context,
                              context.theme.accentSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  ),
                  if (state is AgencyDetailedData)
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      sliver: SliverList.separated(
                        itemCount: state.listArticles.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          final item = state.listArticles[index];

                          return _AgencyHotCard(item: item);
                        },
                      ),
                    ),
                  if (state is AgencyDetailedLoading)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: _AgencyHotCard.placeholder(),
                      ),
                    ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AgencyHotCard extends StatelessWidget {
  const _AgencyHotCard({
    super.key,
    required this.item,
    this.isPlaceholder = false,
  });

  final Article item;

  final bool isPlaceholder;

  factory _AgencyHotCard.placeholder() {
    return _AgencyHotCard(
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
