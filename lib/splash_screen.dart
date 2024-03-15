import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common/extensions/context_extension.dart';
import 'common/main_theme/extensions/theme_data_extension.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.bg,
      body: const Center(
        child: Icon(Icons.flutter_dash),
      ),
    );
  }
}
