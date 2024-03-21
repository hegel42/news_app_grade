import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../data/models/article.dart';
import '../../../../data/repository/repository.dart';

part 'search_screen_event.dart';
part 'search_screen_state.dart';

class SearchScreenBloc extends Bloc<SearchScreenEvent, SearchScreenState> {
  SearchScreenBloc(this.repository) : super(SearchScreenInitial()) {
    on<SearchArticleEvent>(
      _onSearch,
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 1000))
          .asyncExpand(mapper),
    );
    on<ChangeSortEvent>(
      _changeSort,
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 300))
          .asyncExpand(mapper),
    );
  }

  List<Article> articles = [];

  String searchText = '';

  String sortId = 'relevancy';

  FutureOr<void> _changeSort(
    ChangeSortEvent event,
    Emitter<SearchScreenState> emit,
  ) async {
    try {
      // search api dont work if query is empty
      if (searchText.isEmpty) {
        articles.clear();
        searchText = '';
        emit(SearchScreenData(articleList: articles));
      } else {
        emit(SearchScreenLoading());
        articles.clear();
        sortId = event.sortId;

        final response = await repository.searchRepo.getSearchArticles(
          searchText: searchText,
          sortId: sortId,
        );

        articles.addAll(response.articles ?? []);

        if (articles.isNotEmpty) {
          emit(SearchScreenData(articleList: articles));
        } else {
          emit(SearchScreenEmpty());
        }
      }
    } catch (e) {
      emit(SearchScreenError());
    }
  }

  /// by default search are made by relevancy
  FutureOr<void> _onSearch(
    SearchArticleEvent event,
    Emitter<SearchScreenState> emit,
  ) async {
    try {
      // search api dont work if query is empty
      if (event.searchText.isEmpty) {
        articles.clear();
        searchText = '';
        emit(SearchScreenData(articleList: articles));
      } else {
        emit(SearchScreenLoading());
        articles.clear();
        searchText = event.searchText;

        final response = await repository.searchRepo.getSearchArticles(
          searchText: searchText,
          sortId: sortId,
        );

        articles.addAll(response.articles ?? []);

        if (articles.isNotEmpty) {
          emit(SearchScreenData(articleList: articles));
        } else {
          emit(SearchScreenEmpty());
        }
      }
    } catch (e) {
      emit(SearchScreenError());
    }
  }

  final Repository repository;
}
