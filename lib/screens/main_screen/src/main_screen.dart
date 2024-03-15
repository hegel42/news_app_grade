import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            appBar: MainAppBar(title: 'title'),
            // appBar: AppBar(
            //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            //   title: Text(context.locale.helloWorld),
            // ),
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
                      child: TopHeadlinesCard(articlesList: state.topHeadlines),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            const SizedBox(height: 16),
                            Text(
                              'Popular news agencies',
                              style: context.theme.textTheme
                                  .ui18Semibold(context, context.theme.text),
                            ),
                            const SizedBox(height: 8),
                            TopAgencies(
                              sourcesList: state.sources ?? [],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Popular news agencies',
                              style: context.theme.textTheme
                                  .ui18Semibold(context, context.theme.text),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(8),
                      sliver: RecentNewsGrid(
                        // TODO add if empty
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
