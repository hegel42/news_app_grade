import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/gen/assets.gen.dart';
import '../../../common/extensions/context_extension.dart';
import '../../../common/main_theme/extensions/theme_data_extension.dart';
import '../../../common/widgets/app_gesture_detector.dart';
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
        boxShadow: [
          BoxShadow(
            color: context.theme.cardShadow,
            blurRadius: 16,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: _NavBarItem(
                title: context.locale.main,
                index: 0,
                asset: Assets.svg.home.path,
              ),
            ),
            Expanded(
              child: _NavBarItem(
                title: context.locale.search,
                index: 1,
                asset: Assets.svg.home.path,
              ),
            ),
            Expanded(
              child: _NavBarItem(
                title: context.locale.settings,
                index: 2,
                asset: Assets.svg.home.path,
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
    required this.asset,
  });
  // final String icon;

  final int index;
  final String title;
  final String asset;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RootScreenViewModel>(context);
    final isActive = model.activeIndex == index;
    return SizedBox(
      height: 56,
      child: AppGestureDetector(
        alternativeDecoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: context.theme.border.withOpacity(isActive ? 0.2 : 0),
        ),
        onTap: () {
          model.changeScreen(index);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              asset,
              colorFilter: ColorFilter.mode(
                isActive
                    ? context.theme.text
                    : context.theme.border.withOpacity(0.9),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: TextStyle(
                color: isActive
                    ? context.theme.text
                    : context.theme.border.withOpacity(0.9),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
