// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../common/constants/main_constants.dart';

// class ChangeRegionProvider extends ChangeNotifier {
//   ChangeRegionProvider() {
//     _loadRegionPreference();
//   }
//   String _region = 'us';
//   late SharedPreferences _prefs;

//   String get region => _region;

//   Future<void> _loadRegionPreference() async {
//     _prefs = await SharedPreferences.getInstance();
//     _region = _prefs.getString(MainConstants.prefsRegion) ?? '';
//     notifyListeners();
//   }

//   Future<void> _saveRegionPreference(String region) async {
//     await _prefs.setString(MainConstants.prefsRegion, region);
//   }

//   void changeRegion(String region) {
//     _region = region;
//     _saveRegionPreference(_region);
//     notifyListeners();
//   }
// }
