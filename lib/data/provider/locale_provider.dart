import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants/main_constants.dart';

class LocaleProvider extends ChangeNotifier {
  LocaleProvider() {
    _loadLocalePreference();
  }
  Locale _locale = const Locale('en');
  late SharedPreferences _prefs;

  Locale get locale => _locale;

  Future<void> _loadLocalePreference() async {
    _prefs = await SharedPreferences.getInstance();
    final languageCode = _prefs.getString(MainConstants.prefsLanguageCode);
    if (languageCode != null) {
      _locale = Locale(languageCode);
    }
    notifyListeners();
  }

  Future<void> _saveLocalePreference(Locale locale) async {
    await _prefs.setString(
      MainConstants.prefsLanguageCode,
      locale.languageCode,
    );
  }

  void setLocale(Locale locale) {
    if (!AppLocalizations.supportedLocales.contains(locale)) {
      return;
    }
    _locale = locale;
    _saveLocalePreference(locale); // Save the updated locale preference
    notifyListeners();
  }
}
