import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:voyease_frontend/core/routing/app_router.dart";
import "package:voyease_frontend/screens/auth/forgot_pswd_screen/controller/forgot_pswd_screen_controller.dart";
import "package:voyease_frontend/widgets/app_top_nav_bar.dart";
import "package:voyease_frontend/widgets/buttons/primary_button.dart";
import "package:voyease_frontend/widgets/form/input_field.dart";
import "package:voyease_frontend/widgets/gradient_background.dart";

class ForgotPswdScreen extends GetView<ForgotPswdScreenController> {
  const ForgotPswdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPswdScreenController>(
        init: ForgotPswdScreenController(),
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
                          "assets/images/msg_icon.png",
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Forget Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 28),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Enter your email id or phone number to send verification code"
                        " for change of password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            InputField(
                              placeholder: "Enter registered email/phone",
                              controller: controller.emailController,
                            ),
                            const SizedBox(height: 30),
                            PrimaryButton(
                              label: "Continue",
                              onClick: () {
                               controller.emailToSendOTP(context);
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