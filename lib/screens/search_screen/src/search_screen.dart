import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/extensions/context_extension.dart';
import '../../../common/main_theme/extensions/text_theme_extension.dart';
import '../../../common/main_theme/extensions/theme_data_extension.dart';
import '../../../common/widgets/main_app_bar.dart';
import '../../../common/widgets/main_article_card.dart';
import '../../../common/widgets/search_field.dart';
import 'bloc/search_screen_bloc.dart';
import 'components/sort_list_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MainAppBar(
          title: context.locale.searchArticle,
          needBackButton: false,
        ),
        body: BlocBuilder<SearchScreenBloc, SearchScreenState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 20),
                  ),
                  SliverToBoxAdapter(
                    child: SearchField(
                      onChange: (searchValue) {
                        context.read<SearchScreenBloc>().add(
                              SearchArticleEvent(
                                searchText: searchValue ?? '',
                              ),
                            );
                      },
                      hintText: context.locale.search,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  ),
                  SliverList.list(
                    children: [
                      SortListWidget(
                        onChange: (sortId) {
                          context.read<SearchScreenBloc>().add(
                                ChangeSortEvent(
                                  sortId: sortId.toLowerCase(),
                                ),
                              );
                        },
                      ),
                    ],
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  ),
                  if (state is SearchScreenData)
                    SliverList.separated(
                      itemCount: state.articleList.length,
                      itemBuilder: (context, index) {
                        final item = state.articleList[index];

                        return MainArticleCard(item: item);
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                    ),
                  if (state is SearchScreenEmpty)
                    SliverToBoxAdapter(
                      child: Text(
                        context.locale.nothingFound,
                        style: context.theme.textTheme
                            .ui18Medium(context, context.theme.text),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  if (state is SearchScreenLoading)
                    SliverToBoxAdapter(child: MainArticleCard.placeholder()),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 20),
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
