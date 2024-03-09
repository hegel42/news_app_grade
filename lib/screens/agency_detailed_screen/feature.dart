import 'package:flutter/cupertino.dart';

import '../../data/models/source.dart';
import 'src/agency_detailed_screen.dart';

CupertinoPageRoute agencyDetailedScreenRoute(Source source) {
  return CupertinoPageRoute(
      builder: (context) => AgencyDetailScreen(source: source));
}
