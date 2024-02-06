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

    emit(AppMainHomeScreen());
  }

  //   void changeStartLang() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? langCode = prefs.getString('lang');
  //   print(langCode);
  //   if (langCode != null) {
  //     emit(Locale(langCode, ''));
  //   }
  // }

  // void changeLang(context, String data) async {
  //   emit(Locale(data, ''));
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('lang', data);
  // }
}
