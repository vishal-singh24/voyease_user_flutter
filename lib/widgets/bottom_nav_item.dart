import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voyease_frontend/configs/app_colors.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.svgSrc,
    this.isActive = false,
  });

  final String svgSrc;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          SvgPicture.asset(
            svgSrc,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 3,
            width: 80,
            decoration: ShapeDecoration(
              color: isActive ? AppColors.darkBlue : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
          )
        ],
      ),
    );
  }
}
