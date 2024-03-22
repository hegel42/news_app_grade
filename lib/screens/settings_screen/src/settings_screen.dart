import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/constants/main_constants.dart';
import '../../../common/extensions/context_extension.dart';
import '../../../data/provider/change_theme_provider.dart';
import '../../../common/main_theme/color_palette.dart';
import '../../../common/main_theme/extensions/text_theme_extension.dart';
import '../../../common/main_theme/extensions/theme_data_extension.dart';
import '../../../common/widgets/main_app_bar.dart';
import 'components/select_language_item.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MainAppBar(
          title: context.locale.settings,
          needBackButton: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.locale.darkTheme,
                    style: context.theme.textTheme
                        .ui22Medium(context, context.theme.text),
                  ),
                  Switch(
                    activeColor: ColorPalette.secondaryAccent,
                    inactiveThumbColor: ColorPalette.grey,
                    activeThumbImage: const AssetImage('assets/png/moon.png'),
                    inactiveThumbImage: const AssetImage('assets/png/sun.png'),
                    value: context.read<ChangeThemeProvider>().isDark,
                    onChanged: (value) {
                      context.read<ChangeThemeProvider>().changeTheme();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                context.locale.changeLanguage,
                style: context.theme.textTheme
                    .ui22Medium(context, context.theme.text),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SelectLanguageItem(
                    localeCode: MainConstants.ruLocale,
                    name: context.locale.russianLg,
                  ),
                  const SizedBox(width: 20),
                  SelectLanguageItem(
                    localeCode: MainConstants.enLocale,
                    name: context.locale.englishLg,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                context.locale.selectNewsRegion,
                style: context.theme.textTheme
                    .ui22Medium(context, context.theme.text),
              ),
              Text(
                'add info widget',
                style: context.theme.textTheme
                    .ui14Medium(context, context.theme.text),
              ),
              Text(
                'save in shared prefs`',
                style: context.theme.textTheme
                    .ui14Medium(context, context.theme.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
