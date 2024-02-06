import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../extensions/context_extension.dart';

class LocaleManager {
  AppLocalizations? locale;
  String? _currentCountryCode;

  AppLocalizations? getLocale() {
    return locale;
  }

  void updateLocale(BuildContext context) {
    locale = context.locale;
    _currentCountryCode = Intl.defaultLocale;
  }

  String? getCurrentCountryCode() {
    return _currentCountryCode;
  }
}
