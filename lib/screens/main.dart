import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voyease_frontend/configs/app_colors.dart';
import 'package:voyease_frontend/screens/app_map.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const AppMap(),
            Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(65, 0, 0, 0),
                          offset: Offset(1, 4),
                          blurRadius: 4)
                    ]),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      icon: SvgPicture.asset("assets/icons/search.svg"),
                      suffixIcon: SvgPicture.asset(
                        "assets/icons/mic.svg",
                      ),
                      suffixIconConstraints:
                          const BoxConstraints(minHeight: 20)),
                )),
          ],
        ),
      ),
      bottomSheet: Container(
        // padding: EdgeInsets.only(top: 10),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 7.5, horizontal: 10),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 7.5, horizontal: 10),
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
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
      height: 90,
      color: AppColors.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavItem(
            title: "Today",
            svgSrc: "assets/icons/home.svg",
            isActive: true,
            onPress: () {},
          ),
          BottomNavItem(
            title: "All Excercises",
            svgSrc: "assets/icons/shop.svg",
            isActive: false,
            onPress: () {},
          ),
          BottomNavItem(
            title: "Settings",
            svgSrc: "assets/icons/person.svg",
            isActive: false,
            onPress: () {},
          )
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgSrc;
  final String title;
  final bool isActive;
  final VoidCallback? onPress;
  const BottomNavItem({
    super.key,
    required this.svgSrc,
    required this.title,
    required this.isActive,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (isActive) ...[
            SvgPicture.asset(
              svgSrc,
            ),
            Container(height: 3, width: 63, color: AppColors.darkBlue)
          ] else ...[
            SvgPicture.asset(
              svgSrc,
            ),
          ]
        ],
      ),
    );
  }
}
