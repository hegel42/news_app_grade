import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/extensions/context_extension.dart';
import '../../../common/localization/provider/change_theme_provider.dart';
import '../../../common/main_theme/color_palette.dart';
import '../../../common/main_theme/extensions/text_theme_extension.dart';
import '../../../common/main_theme/extensions/theme_data_extension.dart';
import '../../../common/widgets/main_app_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool swithValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MainAppBar(
          title: 'Settings',
          needBackButton: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dark Theme',
                    style: context.theme.textTheme
                        .ui22Medium(context, context.theme.text),
                  ),
                  Switch(
                    activeColor: ColorPalette.secondaryAccent,
                    activeThumbImage: const AssetImage('assets/png/moon.png'),
                    inactiveThumbImage: const AssetImage('assets/png/sun.png'),
                    value: swithValue,
                    onChanged: (value) {
                      context.read<ChangeThemeProvider>().changeTheme();

                      swithValue = value;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                '2 Change language???',
                style: context.theme.textTheme
                    .ui22Medium(context, context.theme.text),
              ),
              const SizedBox(height: 20),
              Text(
                '3 select news region, eg all, us, ru ...',
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
