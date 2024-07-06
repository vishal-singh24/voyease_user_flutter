import 'package:flutter/material.dart';
import 'package:voyease_frontend/configs/app_colors.dart';
import 'package:voyease_frontend/widgets/buttons/app_button.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {super.key,
      required this.label,
      this.onClick,
      this.backgroundColor,
      this.borderSide,
      this.textColor});

  SecondaryButton.outlined({
    super.key,
    this.onClick,
    required this.label,
  })  : backgroundColor = AppColors.white,
        borderSide = BorderSide(color: AppColors.secondary),
        textColor = AppColors.secondary;

  final Function()? onClick;
  final String label;
  final Color? backgroundColor;
  final BorderSide? borderSide;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return AppButton(
        label: label,
        onClick: onClick,
        backgroundColor: backgroundColor ?? AppColors.secondary,
        borderSide: borderSide ?? BorderSide.none,
        textColor: textColor ?? AppColors.textLight);
  }
}
