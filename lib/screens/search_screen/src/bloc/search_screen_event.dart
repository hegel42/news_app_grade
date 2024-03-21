part of 'search_screen_bloc.dart';

@immutable
sealed class SearchScreenEvent {}

class SearchArticleEvent extends SearchScreenEvent {
  SearchArticleEvent({required this.searchText});

  final String searchText;
}

class ChangeSortEvent extends SearchScreenEvent {
  ChangeSortEvent({required this.sortId});

  final String sortId;
}
