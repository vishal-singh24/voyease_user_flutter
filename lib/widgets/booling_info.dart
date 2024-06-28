import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voyease_frontend/configs/app_colors.dart';

class BoolingInfo extends StatelessWidget {
  const BoolingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Container(
        width: MediaQuery.of(context).size.width * .85,
        height: 400,
        decoration: BoxDecoration(border: Border.all()),
        child: Column(
          children: [
            Container(
              color: AppColors.darkBlue,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/booking.svg"),
                  Text(
                    "ooking Information",
                    style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
