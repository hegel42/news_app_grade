import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/extensions/context_extension.dart';
import '../../../common/main_theme/extensions/text_theme_extension.dart';
import '../../../common/main_theme/extensions/theme_data_extension.dart';
import '../../../common/modals/app_snackbar.dart';
import '../../../common/utils/launcher_utils.dart';
import '../../../common/widgets/main_app_bar.dart';
import '../../../common/widgets/main_article_card.dart';
import '../../../data/models/source.dart';
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

                          return MainArticleCard(item: item);
                        },
                      ),
                    ),
                  if (state is AgencyDetailedLoading)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: MainArticleCard.placeholder(),
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
