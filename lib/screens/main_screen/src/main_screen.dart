import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/extensions/context_extension.dart';
import '../../../common/main_theme/extensions/text_theme_extension.dart';
import '../../../common/main_theme/extensions/theme_data_extension.dart';
import '../../../common/widgets/main_app_bar.dart';
import '../../../common/widgets/shimmer_placeholder.dart';
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
            appBar: MainAppBar(
              title: context.locale.hotNews,
              needBackButton: false,
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                //
                context.read<HomeScreenBloc>().add(FetchHomeDataEvent());
                // return false;
              },
              child: CustomScrollView(
                slivers: [
                  if (state is HomeScreenLoading) ...[
                    SliverList.list(
                      children: [
                        const SizedBox(height: 16),
                        TopHeadlinesCards.placeholder(),
                        const SizedBox(height: 24),
                        const _TextPlaceholder(),
                        const SizedBox(height: 16),
                        TopAgencies.placeholder(),
                        const SizedBox(height: 16),
                        const _TextPlaceholder(),
                        const SizedBox(height: 16),
                      ],
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      sliver: RecentNewsGrid.placeholder(),
                    ),
                  ],
                  if (state is HomeScreenDataState) ...[
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 16),
                    ),
                    SliverToBoxAdapter(
                      child: TopHeadlinesCards(
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
                              context.locale.popularNewsAgencies,
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
                              context.locale.recentNews,
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
    // body: Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       if (state is HomeScreenInitial) const Text('initial state'),
    //       Text(
    //         context.locale.centerText,
    //       ),
    //       Text(
    //         '$_counter',
    //         style: Theme.of(context).textTheme.headlineMedium,
    //       ),
    //       ElevatedButton(
    //         onPressed: () {
    //           // context.read<LocaleManager>().updateLocale(context);
    //           context.read<LocaleProvider>().setLocale(
    //                 const Locale('en'),
    //               );
    //         },
    //         child: const Text('en'),
    //       ),
    //       ElevatedButton(
    //         onPressed: () {
    //           // context.read<LocaleManager>().updateLocale(context);
    //           context.read<LocaleProvider>().setLocale(
    //                 const Locale('ru'),
    //               );
    //         },
    //         child: const Text('ru'),
    //       ),
    //     ],
    //   ),
    // ),
  }
}

class _TextPlaceholder extends StatelessWidget {
  const _TextPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ShimmerPlaceholder(
          isEnabled: true,
          child: SizedBox(
            width: 140,
            height: 25,
          ),
        ),
      ),
    );
  }
}
