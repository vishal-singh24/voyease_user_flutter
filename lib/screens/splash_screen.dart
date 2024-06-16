import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: const Color(0xff285A84),
      splashIconSize: double.infinity,
      splash: Lottie.asset("assets/lottie/splash.json",
          repeat: false, fit: BoxFit.cover),
      pageTransitionType: PageTransitionType.fade,
      nextScreen: const Center(
        child: Text(
          "Hi Naman",
          // style: TextStyle(fontFamily: "Roboto"),
        ),
      ),
    );
  }
}
