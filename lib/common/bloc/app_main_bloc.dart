import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_grade/data/repository/repository.dart';

part 'app_main_event.dart';
part 'app_main_state.dart';

class AppMainBloc extends Bloc<MainBlocEvent, MainBlocState> {
  final Repository repository;

  AppMainBloc({required this.repository}) : super(AppMainInitial()) {
    on<AppStartedEvent>(_appStarted);
  }

  Future _appStarted(AppStartedEvent event, Emitter<MainBlocState> emit) async {
    emit(SplashState());
    await repository.init();
    await Future.delayed(Duration(seconds: 4));
    // try {
    //   final docDirectory = await getApplicationDocumentsDirectory();
    //   final checkedDirectory = Directory('${docDirectory.path}${UploadFileDirectory.defaultPath}');

    //   if (checkedDirectory.existsSync()) {
    //     await checkedDirectory.delete(recursive: true);
    //   }

    //   await Directory('${docDirectory.path}${UploadFileDirectory.defaultPath}').create();
    // } catch (e) {
    //   Logger.d(this, 'APP_STARTED_DIRECTORY_ERROR:$e');
    // }

    emit(AppMainInitial());
  }
}
