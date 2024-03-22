// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/repository/repository.dart';

part 'app_main_event.dart';
part 'app_main_state.dart';

class AppMainBloc extends Bloc<MainBlocEvent, MainBlocState> {
  AppMainBloc({required this.repository}) : super(AppMainInitial()) {
    on<AppStartedEvent>(_appStarted);
    on<ChangeAppLocale>((event, emit) {});
  }
  final Repository repository;

  Future _appStarted(AppStartedEvent event, Emitter<MainBlocState> emit) async {
    emit(SplashState());
    await repository.init();
    await Future.delayed(const Duration(seconds: 2));

    emit(AppMainHomeScreen());
  }
}
