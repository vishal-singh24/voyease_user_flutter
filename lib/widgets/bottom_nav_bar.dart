import 'package:flutter/material.dart';
import 'package:voyease_frontend/widgets/bottom_nav_item.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() {
    return _BottomNavBarState();
  }
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 0,
      unselectedFontSize: 0,
      backgroundColor: const Color(0XFFEF6F53),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [
        bottomNavItem(svgSrc: "assets/icons/home.svg"),
        bottomNavItem(svgSrc: "assets/icons/shop.svg"),
        bottomNavItem(svgSrc: "assets/icons/person.svg")
      ],
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
