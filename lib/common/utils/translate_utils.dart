import 'package:flutter/material.dart';

import '../extensions/context_extension.dart';

String returnTranslatedCategory(BuildContext context, String category) {
  switch (category) {
    case 'general':
      return context.locale.general;
    case 'business':
      return context.locale.business;
    case 'entertainment':
      return context.locale.entertainment;
    case 'health':
      return context.locale.health;
    case 'science':
      return context.locale.science;
    case 'sports':
      return context.locale.sports;
    case 'technology':
      return context.locale.technology;
    default:
      return context.locale.general;
  }
}
