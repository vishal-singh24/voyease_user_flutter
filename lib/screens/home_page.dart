import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voyease_frontend/configs/app_colors.dart';
import 'package:voyease_frontend/widgets/app_map.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const AppMap(),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
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
                    suffixIconConstraints: const BoxConstraints(minHeight: 20)),
              )),
        ],
      ),
    );
  }
}