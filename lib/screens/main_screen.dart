import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:voyease_frontend/core/routing/app_router.dart';
import 'package:voyease_frontend/widgets/bottom_nav_item.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        SettingsRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          backgroundColor: const Color(0XFFEF6F53),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            bottomNavItem(svgSrc: "assets/icons/home.svg"),
            bottomNavItem(svgSrc: "assets/icons/shop.svg"),
            bottomNavItem(svgSrc: "assets/icons/person.svg")
          ],
        );
      },
      // bottomSheet: const MainBottomSheet(),
    );
  }

  BottomNavigationBarItem bottomNavItem({svgSrc}) {
    return BottomNavigationBarItem(
      icon: BottomNavItem(svgSrc: svgSrc),
      activeIcon: BottomNavItem(svgSrc: svgSrc, isActive: true),
      label: "",
    );
  }
}
