import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../data/repository/repository.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {

  HomeScreenBloc(this.repository) : super(HomeScreenInitial()) {
    on<FetchHotNews>((event, emit) {
      try {
        repository.homeRepo.getHotArticles();
      } catch (e) {
        print(e);
      }
    });
  }
  final Repository repository;
}
