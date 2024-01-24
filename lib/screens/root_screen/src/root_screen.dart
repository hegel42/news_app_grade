import 'package:flutter/material.dart';
import 'package:news_app_grade/screens/main_screen/feature.dart';
import 'package:news_app_grade/screens/settings_screen/feature.dart';
import 'package:news_app_grade/screens/source_screen/feature.dart';
import 'package:provider/provider.dart';

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
                  onGenerateRoute: settingsScreenRoute,
                ),
                Navigator(
                  key: model.navigatorKeys[2],
                  onGenerateRoute: sourceScreenRoute,
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
      decoration: const BoxDecoration(
        // color: context.theme.bg,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFB6BBC6),
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: const SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: _NavBarItem(
                // title: context.locale?.calendar ?? '',
                title: 'Main',
                index: 0,
              ),
            ),
            Expanded(
              child: _NavBarItem(
                title: 'Screen 2',
                index: 1,
              ),
            ),
            Expanded(
              child: _NavBarItem(
                title: 'Screen 3',
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
              Icon(
                Icons.abc,
                color: isActive ? Colors.black : Colors.grey,
              ),
              // SvgPicture.asset(
              //   icon,
              //   color: isActive ? Colors.black : Colors.grey,
              // ),
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
