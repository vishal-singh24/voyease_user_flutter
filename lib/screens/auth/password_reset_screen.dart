//Password visibility state bug left to be solved

import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:voyease_frontend/core/routing/app_router.dart";
import "package:voyease_frontend/widgets/app_top_nav_bar.dart";
import "package:voyease_frontend/widgets/buttons/primary_button.dart";
import "package:voyease_frontend/widgets/form/input_field.dart";
import "package:voyease_frontend/widgets/gradient_background.dart";

@RoutePage()
class PasswordResetScreen extends StatelessWidget {
  const PasswordResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AppTopNavBar(),
                const SizedBox(height: 40),
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white70,
                  ),
                  child: Image.asset(
                    "assets/images/lock.png",
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Password Reset",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const InputField(
                          placeholder: "Enter new password", isPassword: true),
                      const SizedBox(height: 15),
                      const InputField(
                          placeholder: "Re-enter new password",
                          isPassword: true),
                      const SizedBox(height: 30),
                      PrimaryButton(
                        label: "Continue",
                        onClick: () {
                          context.navigateNamedTo(ResetDoneRoute.name);
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
