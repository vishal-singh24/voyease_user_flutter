import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:voyease_frontend/configs/app_colors.dart";

class SelectionButton extends StatelessWidget {
  const SelectionButton(
      {super.key,
      required this.leftText,
      this.rightText,
      this.iButton,
      this.margin});

  final String leftText;
  final String? rightText;
  final bool? iButton;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 35,
      child: Row(
        children: [
          Container(
            width: 2,
            decoration: BoxDecoration(
                color: AppColors.darkBlue,
                borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            width: 320,
            padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 10),
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                border: Border.all(width: 0.25),
                borderRadius: BorderRadius.circular(4)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  leftText,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
                if (rightText != null)
                  Text(
                    rightText!,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightGreen),
                  )
              ],
            ),
          ),
          if (iButton != null)
            Container(
              padding: const EdgeInsets.only(left: 8),
              child: SvgPicture.asset("assets/icons/ibutton.svg"),
            )
        ],
      ),
    );
  }
}
