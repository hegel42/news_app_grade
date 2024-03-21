part of 'search_screen_bloc.dart';

@immutable
sealed class SearchScreenState {}

final class SearchScreenInitial extends SearchScreenState {}

final class SearchScreenLoading extends SearchScreenState {}

final class SearchScreenError extends SearchScreenState {}

final class SearchScreenEmpty extends SearchScreenState {}

final class SearchScreenData extends SearchScreenState {
  SearchScreenData({required this.articleList});

  final List<Article> articleList;
}
