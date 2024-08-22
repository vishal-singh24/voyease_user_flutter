import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:voyease_frontend/core/routing/app_router.dart";
import "package:voyease_frontend/widgets/app_top_nav_bar.dart";
import "package:voyease_frontend/widgets/buttons/primary_button.dart";

@RoutePage()
class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppTopNavBar(),
              const SizedBox(
                height: 35,
              ),
              Lottie.asset("assets/lottie/car.json", repeat: true, height: 150),
              const SizedBox(
                height: 180,
              ),
              const Text(
                "VoyEase",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              const Text(
                "Trips Now Easy",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: size.width * .8,
                child: PrimaryButton(
                  label: "Login",
                  onClick: () {
                    Navigator.pushNamed(context, AppRoutes.loginScreen);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: size.width * .8,
                child: PrimaryButton(
                  label: "Signup",
                  onClick: () {
                    Navigator.pushNamed(context, AppRoutes.signUpScreen);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
