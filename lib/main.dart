import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app_grade/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_grade/common/bloc/app_main_bloc.dart';
import 'package:news_app_grade/data/repository/repository.dart';
import 'package:news_app_grade/screens/main_screen/src/bloc/home_screen_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(create: (context) => Repository()),
      // TODO add locale
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider<AppMainBloc>(
          create: (context) => AppMainBloc(
            repository: context.read<Repository>(),
          )..add(AppStartedEvent()),
        ),
        BlocProvider<HomeScreenBloc>(
          create: (context) => HomeScreenBloc(
            context.read<Repository>(),
          )..add(FetchHotNews()),
        )
      ],
      child: const MainApp(),
    ),
    // child: MainApp(),
  )
      // MultiRepositoryProvider(
      //   create: (context) => SubjectRepository(),
      //   child: MainApp(),
      // ),
      );
}
