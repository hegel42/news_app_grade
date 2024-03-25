import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/extensions/context_extension.dart';
import '../../../../data/provider/locale_provider.dart';
import '../../../../common/main_theme/extensions/text_theme_extension.dart';
import '../../../../common/main_theme/extensions/theme_data_extension.dart';
import '../../../../common/widgets/app_gesture_detector.dart';

class SelectLanguageItem extends StatelessWidget {
  const SelectLanguageItem({
    super.key,
    required this.localeCode,
    required this.name,
  });

  final String localeCode;
  final String name;

  @override
  Widget build(BuildContext context) {
    return AppGestureDetector(
      alternativeDecoration: BoxDecoration(
        color: context.read<LocaleProvider>().locale.languageCode == localeCode
            ? context.theme.accentSecondary
            : context.theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: context.theme.accentSecondary,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      onTap: () {
        context.read<LocaleProvider>().setLocale(Locale(localeCode));
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Text(
              name,
              style: context.theme.textTheme
                  .ui14Semibold(context, context.theme.text),
            ),
          ],
        ),
      ),
    );
  }
}
