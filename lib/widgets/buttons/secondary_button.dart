import 'package:flutter/material.dart';
import 'package:voyease_frontend/configs/app_colors.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {super.key, required this.label, this.onClick, this.isOutlined = false});

  const SecondaryButton.outlined({
    super.key,
    required this.label,
    this.onClick,
  }) : isOutlined = true;

  final Function()? onClick;
  final String label;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined ? AppColors.white : AppColors.darkBlue,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: isOutlined
                  ? BorderSide(color: AppColors.textBlue)
                  : BorderSide.none)),
      child: Text(
        label,
        style: TextStyle(
            color: isOutlined ? AppColors.darkBlue : AppColors.textLight,
            fontSize: 20,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
