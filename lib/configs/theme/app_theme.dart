import 'package:flutter/material.dart';
import 'package:voyease_frontend/configs/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  );
}
