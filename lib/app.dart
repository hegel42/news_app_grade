import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_grade/common/bloc/app_main_bloc.dart';
import 'package:news_app_grade/screens/root_screen/feature.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //     localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // TODO add theme here
        useMaterial3: true,
      ),
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
