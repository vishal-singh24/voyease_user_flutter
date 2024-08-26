

import "dart:developer";

import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:voyease_frontend/core/routing/app_router.dart";
import "package:voyease_frontend/screens/auth/password_reset_screen/controller/password_reset_screen_controller.dart";
import "package:voyease_frontend/widgets/app_top_nav_bar.dart";
import "package:voyease_frontend/widgets/buttons/primary_button.dart";
import "package:voyease_frontend/widgets/form/input_field.dart";
import "package:voyease_frontend/widgets/gradient_background.dart";

class PasswordResetScreen extends GetView<PasswordResetScreenController> {
  const PasswordResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String email = args['email']!;
    final String otp = args['otp']!;
    return GetBuilder<PasswordResetScreenController>(
         init: PasswordResetScreenController(),
        initState: (_) {},
        builder: (_) {
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
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 28),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            InputField(
                                controller: controller.password,
                                placeholder: "Enter new password",
                                isPassword: true),
                            const SizedBox(height: 15),
                            InputField(
                                controller: controller.confirmPassword,
                                placeholder: "Re-enter new password",
                                isPassword: true),
                            const SizedBox(height: 30),
                            PrimaryButton(
                              label: "Continue",
                              onClick: () {
                                log('BuildContext: $context');
                                log('Controller: $controller');
                                if (controller.password.text ==
                                    controller.confirmPassword.text) {
                                  controller.resetPassword(context, email, otp,
                                      controller.password.text);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.blue,
                                      content: Text('An Error Occured!'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
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
        });
  }
}
