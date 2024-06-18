import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voyease_frontend/configs/app_colors.dart';

class BottomNavItem extends StatelessWidget {
  final String svgSrc;
  final String title;
  final bool isActive;
  final VoidCallback? onPress;
  const BottomNavItem({
    super.key,
    required this.svgSrc,
    required this.title,
    required this.isActive,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (isActive) ...[
            SvgPicture.asset(
              svgSrc,
            ),
            Container(height: 3, width: 63, color: AppColors.darkBlue)
          ] else ...[
            SvgPicture.asset(
              svgSrc,
            ),
          ]
        ],
      ),
    );
  }
}
