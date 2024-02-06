import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_grade/common/bloc/app_main_bloc.dart';
import 'package:news_app_grade/common/main_theme/main_theme_data.dart';
import 'package:news_app_grade/screens/root_screen/feature.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isLight = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // navigatorKey: context.read<Repository>().alice.getNavigatorKey(),
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: [Locale('ru', "RU")],
      theme: isLight ? mainAppLightTheme : mainAppDarkTheme,

      home: BlocConsumer<AppMainBloc, MainBlocState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SplashState) {
            // TODO placeholder
            return CircularProgressIndicator();
          }
          return RootScreenFeature();
        },
      ),
    );
  }
}
