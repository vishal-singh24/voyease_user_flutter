import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:voyease_frontend/widgets/setting_page.dart';
import 'package:voyease_frontend/widgets/bottom_nav_bar.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingsPage(),
      // bottomSheet: const MainBottomSheet(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
