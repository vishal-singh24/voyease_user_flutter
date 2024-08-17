import "package:auto_route/auto_route.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:voyease_frontend/configs/app_colors.dart";
import "package:voyease_frontend/core/routing/app_router.dart";
import "package:voyease_frontend/screens/auth/login_screen/controllers/login_controller.dart";
import "package:voyease_frontend/widgets/app_card.dart";
import "package:voyease_frontend/widgets/app_top_nav_bar.dart";
import "package:voyease_frontend/widgets/buttons/app_button.dart";
import "package:voyease_frontend/widgets/buttons/primary_button.dart";
import "package:voyease_frontend/widgets/form/check_box_field.dart";
import "package:voyease_frontend/widgets/form/input_field.dart";
import "package:voyease_frontend/widgets/gradient_background.dart";


class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GetBuilder(
        init: LoginController(),
        initState: (_) {},
        builder: (_) {
          return Scaffold(
            body: GradientBackground(
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const AppTopNavBar(),
                      const SizedBox(height: 75),
                      AppCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 15),
                            const Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              "Login to your account",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.textBlue,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.56,
                              ),
                            ),
                            const SizedBox(height: 38),
                             InputField(
                              controller: controller.emailController,
                              placeholder: "Email",
                              prefixIcon: Icon(Icons.person_outline),
                            ),
                            const SizedBox(height: 15),
                            InputField(
                              controller: controller.passwordController,
                              placeholder: "Password",
                              isPassword: true,
                              prefixIcon: Icon(Icons.key_outlined),
                            ),
                            const SizedBox(height: 15),
                            Flex(
                              direction: Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // const CheckBoxField(
                                //   label: Text(
                                //     "Remember me",
                                //     style: TextStyle(
                                //       fontSize: 12,
                                //       fontWeight: FontWeight.w400,
                                //     ),
                                //   ),
                                // ),
                                InkWell(
                                  onTap: () {
                                    context.router
                                        .pushNamed(ForgotPswdRoute.name);
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      color: AppColors.textLink,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            PrimaryButton(
                              label: "Login",
                              onClick: () {
                                controller.login(context);
                              },
                            ),
                            const SizedBox(height: 9),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "By submitting, you agree to Terms and Conditions and Privacy policy.",
                                style: TextStyle(
                                  color: Color(0xFF505050),
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            const Text(
                              "Or login with:",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 10),
                            AppButton(
                                label: "Google",
                                fontWeight: FontWeight.w500,
                                icon: Image.asset(
                                  "assets/icons/google.png",
                                  height: 24,
                                ),
                                onClick: () {},
                                backgroundColor: const Color(0XFFF5F9FE),
                                borderSide: BorderSide.none,
                                textColor: AppColors.textGray),
                            const SizedBox(height: 20),
                            Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Don\u2019t have an account? ",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                      text: "Sign up",
                                      style: const TextStyle(
                                        color: Color(0xFF3366CC),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          context.router
                                              .replaceNamed(SignupRoute.name);
                                        }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
