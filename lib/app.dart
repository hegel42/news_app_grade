import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'common/bloc/app_main_bloc.dart';
import 'common/extensions/context_extension.dart';
import 'data/provider/change_theme_provider.dart';
import 'data/provider/locale_provider.dart';
import 'common/main_theme/main_theme_data.dart';
import 'screens/main_screen/src/bloc/home_screen_bloc.dart';
import 'screens/root_screen/feature.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'splash_screen.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ChangeThemeProvider>(context).isDark;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: Provider.of<LocaleProvider>(context).locale,
      theme: isDark ? mainAppDarkTheme : mainAppLightTheme,
      home: BlocConsumer<AppMainBloc, MainBlocState>(
        listener: (context, state) {
          if (state is RegionChangeState) {
            print(state.regionCode);
            context
                .read<HomeScreenBloc>()
                .add(FetchHomeDataEvent(regionCode: state.regionCode));
          }
          // if state is change Region state ---> context.read..fetch with region
        },
        buildWhen: (previous, current) =>
            current is SplashState || current is AppMainHomeScreen,
        builder: (context, state) {
          if (state is SplashState) {
            return const SplashScreen();
          }
          if (state is AppMainHomeScreen) {
            return const RootScreenFeature();
          }
          return const SplashScreen();
        },
      ),
    );
  }
}
