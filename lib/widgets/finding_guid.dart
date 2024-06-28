import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:voyease_frontend/configs/app_colors.dart';

class FindingGuid extends StatelessWidget {
  const FindingGuid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 322,
        height: 390,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 4), blurRadius: 4, color: Color(0x60000000)),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Column(
          children: [
            Lottie.asset("assets/lottie/finding.json", height: 161),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Finding a guide for you",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ],
        ));
  }
}
