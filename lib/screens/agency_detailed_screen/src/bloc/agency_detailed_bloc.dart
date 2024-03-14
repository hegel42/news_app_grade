import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../../data/models/article.dart';
import '../../../../data/repository/repository.dart';

part 'agency_detailed_event.dart';
part 'agency_detailed_state.dart';

class AgencyDetailedBloc
    extends Bloc<AgencyDetailedEvent, AgencyDetailedState> {
  AgencyDetailedBloc(this.repo) : super(AgencyDetailedInitial()) {
    on<AgencyDetailedFetchData>(
      (event, emit) async {
        try {
          emit(AgencyDetailedLoading());

          final listNews =
              await repo.homeRepo.getArticleBySource(sourceId: event.source);

          print(listNews.articles);

          emit(AgencyDetailedData(listArticles: listNews.articles ?? []));
        } catch (e) {
          emit(AgencyDetailedError());
        }
      },
    );
  }

  final Repository repo;
}
