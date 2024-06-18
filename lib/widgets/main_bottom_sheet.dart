import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voyease_frontend/configs/app_colors.dart';

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
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 34),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 36),
            color: AppColors.primaryLight,
            height: 40,
            child: Row(
              children: [
                const Text(
                  "What are you looking for?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset("assets/images/map.svg")
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 40),
            height: 35,
            child: Row(
              children: [
                Container(
                  color: AppColors.darkBlue,
                  width: 2,
                ),
                Container(
                  width: 272,
                  padding:
                      const EdgeInsets.symmetric(vertical: 7.5, horizontal: 10),
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.25),
                      borderRadius: BorderRadius.circular(4)),
                  child: const Text("Tour Guide"),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, left: 40),
            height: 35,
            child: Row(
              children: [
                Container(
                  color: AppColors.darkBlue,
                  width: 2,
                ),
                Container(
                  width: 272,
                  padding:
                      const EdgeInsets.symmetric(vertical: 7.5, horizontal: 10),
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.25),
                      borderRadius: BorderRadius.circular(4)),
                  child: const Text("Tour Buddy"),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.5))),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25),
            padding: const EdgeInsets.only(left: 33),
            width: size.width,
            child: const Text(
              "Preferences",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            alignment: Alignment.center,
            color: AppColors.primaryLight,
            height: 44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Language",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset("assets/images/emoji_language.svg"),
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset("assets/images/dictionary_language.svg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
