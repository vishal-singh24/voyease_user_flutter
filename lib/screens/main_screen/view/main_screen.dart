import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voyease_frontend/screens/home/home_screen.dart';
import 'package:voyease_frontend/screens/main_screen/controllers/main_screen_controller.dart';
import 'package:voyease_frontend/screens/settings/settings_screen/view/settings_screen.dart';
import 'package:voyease_frontend/screens/shop/shop_main_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voyease_frontend/configs/app_colors.dart';
import 'package:voyease_frontend/widgets/bottom_nav_item.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainScreenController controller = Get.put(MainScreenController());

    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            HomeScreen(), 
            ShopMainScreen(), 
            SettingsScreen(), 
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          backgroundColor: const Color(0XFFEF6F53),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTabIndex,
          items: [
            bottomNavItem(
              icon: Icon(
                Icons.home_outlined,
                color: AppColors.white,
                size: 40,
              ),
            ),
            bottomNavItem(
              icon: SvgPicture.asset(
                "assets/icons/shop.svg",
                height: 40,
              ),
            ),
            bottomNavItem(
              icon: Icon(
                Icons.person_outline_outlined,
                color: AppColors.white,
                size: 40,
              ),
            ),
          ],
        );
      }),
    );
  }

  BottomNavigationBarItem bottomNavItem({required Widget icon}) {
    return BottomNavigationBarItem(
      icon: BottomNavItem(icon: icon),
      activeIcon: BottomNavItem(icon: icon, isActive: true),
      label: "",
    );
  }
}
