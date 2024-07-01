import 'package:flutter/material.dart';
import 'package:voyease_frontend/configs/app_colors.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key, required this.label, this.onClick});

  final Function()? onClick;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkBlue,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50), side: BorderSide.none)),
      child: Text(
        label,
        style: TextStyle(
            color: AppColors.textLight,
            fontSize: 20,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
