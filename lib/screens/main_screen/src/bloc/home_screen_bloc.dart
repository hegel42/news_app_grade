import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import '../../../../data/models/article.dart';
import '../../../../data/models/source.dart';
import '../../../../data/repository/repository.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc(this.repository) : super(HomeScreenInitial()) {
    on<FetchHomeDataEvent>(_onDataFetch);
    // on<LoadNextEvent>(
    //   (LoadNextEvent event, Emitter<HomeScreenState> emit) async {
    //     final hotArticleResponse = await repository.homeRepo.getHotArticles();
    //   },
    // );
  }

  FutureOr<void> _onDataFetch(
    FetchHomeDataEvent event,
    Emitter<HomeScreenState> emit,
  ) async {
    try {
      emit(HomeScreenLoading());
      final topHeadlinesResponse = await repository.homeRepo
          .getTopHeadlines(regionCode: event.regionCode);

      final topAgenciesResponse =
          await repository.homeRepo.getSources(regionCode: event.regionCode);

      final recentArticlesResponse =
          await repository.homeRepo.getLatestNews(regionCode: event.regionCode);
      emit(
        HomeScreenDataState(
          topHeadlines: topHeadlinesResponse.articles ?? [],
          sources: topAgenciesResponse.sources,
          recentArticles: recentArticlesResponse.articles,
        ),
      );
    } catch (e) {
      emit(HomeScreenError());
      Logger().e(e);
    }
  }

  final Repository repository;
}
