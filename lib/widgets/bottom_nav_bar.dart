import 'package:flutter/material.dart';
import 'package:voyease_frontend/configs/app_colors.dart';
import 'package:voyease_frontend/widgets/bottom_nav_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
      height: 90,
      color: AppColors.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavItem(
            title: "Today",
            svgSrc: "assets/icons/home.svg",
            isActive: true,
            onPress: () {},
          ),
          BottomNavItem(
            title: "All Excercises",
            svgSrc: "assets/icons/shop.svg",
            isActive: false,
            onPress: () {},
          ),
          BottomNavItem(
            title: "Settings",
            svgSrc: "assets/icons/person.svg",
            isActive: false,
            onPress: () {},
          )
        ],
      ),
    );
  }
}
