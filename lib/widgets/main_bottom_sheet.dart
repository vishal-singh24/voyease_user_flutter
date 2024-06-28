import 'package:flutter/material.dart';
import 'package:voyease_frontend/configs/app_colors.dart';
import 'package:voyease_frontend/screens/tour_guid_selection_screen.dart';

class MainBottomSheet extends StatelessWidget {
  const MainBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: 365,
      width: size.width,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: const TourGuidSelection(),
    );
  }
}
