import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppTopNavBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopNavBar({
    super.key,
    this.title,
  });

  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          context.maybePop();
        },
        icon: const Icon(Icons.arrow_back),
        iconSize: 28,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
