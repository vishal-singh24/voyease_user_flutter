import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:voyease_frontend/configs/app_colors.dart';

@RoutePage()
class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * .45,
            width: size.width,
            decoration: const BoxDecoration(
                color: Color(0xfff5ceb8),
                image: DecorationImage(
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/running_car.gif"))),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Voyease",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Trips now easy",
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.router.pushNamed("/login");
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.router.pushNamed("/signup");
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary),
                  child: Text(
                    "Signup",
                    style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
