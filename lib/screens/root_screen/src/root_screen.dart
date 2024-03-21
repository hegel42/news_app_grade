import 'package:flutter/material.dart';
import 'package:news_app_grade/common/gen/assets.gen.dart';
import '../../../common/extensions/context_extension.dart';
import '../../../common/main_theme/extensions/theme_data_extension.dart';
import '../../main_screen/feature.dart';
import '../../settings_screen/feature.dart';
import '../../search_screen/feature.dart';
import 'package:provider/provider.dart';
// import 'ass';

import 'vm.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RootScreenViewModel>(
        builder: (context, model, child) => Stack(
          children: [
            IndexedStack(
              index: model.activeIndex,
              children: [
                Navigator(
                  key: model.navigatorKeys[0],
                  onGenerateRoute: mainScreenRoute,
                ),
                Navigator(
                  key: model.navigatorKeys[1],
                  onGenerateRoute: searchScreenRoute,
                ),
                Navigator(
                  key: model.navigatorKeys[2],
                  onGenerateRoute: settingsScreenRoute,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MainAppBottomBar(),
    );
  }
}

class MainAppBottomBar extends StatelessWidget {
  const MainAppBottomBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.theme.bg,
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFB6BBC6),
            blurRadius: 16,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: const SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: _NavBarItem(
                title: 'Main',
                index: 0,
              ),
            ),
            Expanded(
              child: _NavBarItem(
                title: 'Search',
                index: 1,
              ),
            ),
            Expanded(
              child: _NavBarItem(
                title: 'Settings',
                index: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    // required this.icon,
    required this.index,
    required this.title,
  });
  // final String icon;

  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RootScreenViewModel>(context);
    final isActive = model.activeIndex == index;
    return SizedBox(
      height: 56,
      child: GestureDetector(
        onTap: () {
          model.changeScreen(index);
        },
        child: ColoredBox(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.svg.home.svg(),
              const SizedBox(
                height: 4,
              ),
              Text(
                title,
                style: TextStyle(color: isActive ? Colors.black : Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
