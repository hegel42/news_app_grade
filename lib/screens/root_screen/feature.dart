import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/root_screen.dart';
import 'src/vm.dart';

class RootScreenFeature extends StatelessWidget {
  const RootScreenFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RootScreenViewModel>(
      create: (context) => RootScreenViewModel(),
      builder: (context, child) => const RootScreen(),
    );
  }
}
