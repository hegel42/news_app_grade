import 'package:flutter/material.dart';
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
      home: const RootScreenFeature(),
    );
  }
}
