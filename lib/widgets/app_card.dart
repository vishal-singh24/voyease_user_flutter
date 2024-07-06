import 'package:flutter/material.dart';
import 'package:voyease_frontend/configs/app_colors.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 45),
      decoration: ShapeDecoration(
        color: AppColors.white,
        shadows: const [
          BoxShadow(
              offset: Offset(2, 4),
              color: Color(0x60000000),
              blurRadius: 10,
              spreadRadius: 4)
        ],
        shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.textGray, width: 1),
            borderRadius: BorderRadius.circular(20)),
      ),
      child: child,
    );
  }
}
