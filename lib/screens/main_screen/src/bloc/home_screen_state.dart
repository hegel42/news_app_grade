part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

final class HomeScreenLoading extends HomeScreenState {}

final class HomeScreenError extends HomeScreenState {}

final class HomeScreenDataState extends HomeScreenState {
  HomeScreenDataState({
    required this.topHeadlines,
    required this.sources,
    required this.recentArticles,
  });

  final List<Article> topHeadlines;

  final List<Source>? sources;

  final List<Article>? recentArticles;
}
