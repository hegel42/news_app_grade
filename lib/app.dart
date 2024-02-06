import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'common/bloc/app_main_bloc.dart';
import 'common/localization/provider/locale_provider.dart';
import 'common/main_theme/main_theme_data.dart';
import 'screens/root_screen/feature.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      supportedLocales: AppLocalizations.supportedLocales,
      // locale: ,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: Provider.of<LocaleProvider>(context).locale,
      // navigatorKey: context.read<Repository>().alice.getNavigatorKey(),
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: [Locale('ru', "RU")],
      theme: isLight ? mainAppLightTheme : mainAppDarkTheme,

      home: BlocConsumer<AppMainBloc, MainBlocState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SplashState) {
            // TODO placeholder
            return const CircularProgressIndicator();
          }
          if (state is AppMainHomeScreen) {
            return const RootScreenFeature();
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
