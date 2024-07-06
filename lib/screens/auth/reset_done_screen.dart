import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:voyease_frontend/configs/app_colors.dart';
import 'package:voyease_frontend/core/routing/app_router.dart';
import 'package:voyease_frontend/widgets/app_top_nav_bar.dart';
import 'package:voyease_frontend/widgets/buttons/primary_button.dart';
import 'package:voyease_frontend/widgets/gradient_background.dart';

@RoutePage()
class ResetDoneScreen extends StatelessWidget {
  const ResetDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              const AppTopNavBar(),
              const SizedBox(height: 40),
              Icon(
                Icons.check_circle_outline_rounded,
                size: 100,
                color: AppColors.darkBlue,
              ),
              const SizedBox(height: 30),
              const Text(
                'Forget Password Successful',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
              ),
              const SizedBox(height: 30),
              const Text(
                'You have successfully reset your password.'
                ' Please use new password while logging in.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                width: MediaQuery.of(context).size.width,
                child: PrimaryButton(
                  label: "Login",
                  onClick: () {
                    context.router.replaceAll([
                      const SelectLanguageRoute(),
                      const LandingRoute(),
                      const LoginRoute()
                    ]);
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
