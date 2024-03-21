import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'common/bloc/app_main_bloc.dart';
import 'common/localization/provider/change_theme_provider.dart';
import 'common/localization/provider/locale_provider.dart';
import 'data/repository/repository.dart';
import 'screens/main_screen/src/bloc/home_screen_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
// test
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => ChangeThemeProvider()),
      ],
      builder: (context, child) {
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (context) => Repository()),
            // TODO add locale
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AppMainBloc>(
                lazy: false,
                create: (context) => AppMainBloc(
                  repository: context.read<Repository>(),
                )..add(AppStartedEvent()),
              ),
              BlocProvider<HomeScreenBloc>(
                create: (context) => HomeScreenBloc(
                  context.read<Repository>(),
                )..add(FetchHomeDataEvent()),
              ),
            ],
            child: const MainApp(),
          ),
        );
      },
    ),
  );
}
