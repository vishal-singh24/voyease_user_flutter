import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onClick,
    required this.label,
    required this.backgroundColor,
    required this.borderSide,
    required this.textColor,
    this.icon,
    this.fontSize,
    this.fontWeight,
  });

  final Function()? onClick;
  final String label;
  final Color backgroundColor;
  final BorderSide borderSide;
  final Color textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      iconAlignment: IconAlignment.end,
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50), side: borderSide)),
      icon: icon != null
          ? Padding(
              padding: const EdgeInsets.only(right: 6),
              child: icon,
            )
          : null,
      label: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize ?? 20,
          fontWeight: fontWeight ?? FontWeight.w700,
        ),
      ),
    );
  }
}
