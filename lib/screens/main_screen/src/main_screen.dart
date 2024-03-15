import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/extensions/context_extension.dart';
import '../../../common/main_theme/extensions/text_theme_extension.dart';
import '../../../common/main_theme/extensions/theme_data_extension.dart';
import '../../../common/widgets/main_app_bar.dart';
import 'bloc/home_screen_bloc.dart';
import 'components/recenent_news_card.dart';
import 'components/top_agencies.dart';
import 'components/top_headline_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenBloc, HomeScreenState>(
      listener: (context, state) {
        if (state is HomeScreenError) {
          showDialog(
            context: context,
            builder: (context) {
              return OutlinedButton(
                onPressed: () {
                  context.navigator.pop();
                },
                child: const Text('text'),
              );
            },
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: const MainAppBar(
              title: 'Hot news',
              needBackButton: false,
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                context.read<HomeScreenBloc>().add(FetchHomeDataEvent());
                // return false;
              },
              child: CustomScrollView(
                slivers: [
                  if (state is HomeScreenLoading) ...[
                    const SliverToBoxAdapter(child: Text('add shimer')),
                  ],
                  if (state is HomeScreenDataState) ...[
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 16),
                    ),
                    SliverToBoxAdapter(
                      child: TopHeadlinesCard(
                        articlesList: state.topHeadlines,
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            const SizedBox(height: 16),
                            Text(
                              'Popular news agencies',
                              style: context.theme.textTheme.ui18Semibold(
                                context,
                                context.theme.text,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TopAgencies(
                              sourcesList: state.sources ?? [],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Recent news',
                              style: context.theme.textTheme.ui18Semibold(
                                context,
                                context.theme.text,
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(8),
                      sliver: RecentNewsGrid(
                        hotnewsList: state.recentArticles ?? [],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
