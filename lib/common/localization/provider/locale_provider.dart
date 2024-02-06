import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');
  Locale get locale => _locale;
  void setLocale(Locale locale) {
    if (!AppLocalizations.supportedLocales.contains(locale)) {
      return;
    }
    _locale = locale;
    notifyListeners();
  }
}

// void changeStartLang() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String langCode = prefs.getString('lang');
//     print(langCode);
//     if (langCode != null) {
//       emit(Locale(langCode, ''));
//     }
//   }

//   void changeLang(context, String data) async {
//     emit(Locale(data, ''));
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('lang', data);
//   }
