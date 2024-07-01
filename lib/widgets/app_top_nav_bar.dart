import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppTopNavBar extends StatelessWidget {
  const AppTopNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            context.back();
          },
          icon: const Icon(Icons.arrow_back),
          iconSize: 28,
        )
      ],
    );
  }
}
