import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:voyease_frontend/configs/app_colors.dart";
import "package:voyease_frontend/core/routing/app_router.dart";
import "package:voyease_frontend/widgets/bottom_nav_item.dart";

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeNavigationRoute(),
        ShopNavigationRoute(),
        SettingsNavigationRoute(),
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
            bottomNavItem(
                icon: Icon(
              Icons.home_outlined,
              color: AppColors.white,
              size: 40,
            )),
            bottomNavItem(
                icon: SvgPicture.asset(
              "assets/icons/shop.svg",
              height: 40,
            )),
            bottomNavItem(
                icon: Icon(
              Icons.person_outline_outlined,
              color: AppColors.white,
              size: 40,
            ))
          ],
        );
      },
    );
  }

  BottomNavigationBarItem bottomNavItem({icon}) {
    return BottomNavigationBarItem(
      icon: BottomNavItem(icon: icon),
      activeIcon: BottomNavItem(icon: icon, isActive: true),
      label: "",
    );
  }
}
