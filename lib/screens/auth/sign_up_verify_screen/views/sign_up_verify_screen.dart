import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:voyease_frontend/configs/app_colors.dart";
import "package:voyease_frontend/screens/auth/sign_up_verify_screen/controllers/sign_up_verify_screen_controller.dart";
import "package:voyease_frontend/widgets/app_top_nav_bar.dart";
import "package:voyease_frontend/widgets/buttons/primary_button.dart";
import "package:voyease_frontend/widgets/form/input_field.dart";
import "package:voyease_frontend/widgets/gradient_background.dart";

class SignUpVerifyScreen extends GetView<SignUpVerifyScreenController> {
  const SignUpVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String email = args['email']!;
    final String phoneNo = args['phoneNo']!;
    Get.put(SignUpVerifyScreenController());
    return GetBuilder(
      init: SignUpVerifyScreenController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          body: GradientBackground(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const AppTopNavBar(),
                    const SizedBox(height: 50),
                    const Text(
                      "Verify your account",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
                    ),
                    const SizedBox(height: 55),
                     Padding(
                      padding:const  EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "We sent a verification code to your registered mail $email"
                        " The code will expire in 15 minutes",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0XFF423E4C)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 33),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 42),
                          InputField(
                              controller: controller.otpController,
                              placeholder: "Enter verification code"),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.resendOtp(context);
                                },
                                child: Text(
                                  "Resend code",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textLink),
                                ),
                              ),
                              const Text(" in 00:45",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight
                                          .w400)), //Timer is to be added here
                            ],
                          ),
                          const SizedBox(height: 35),
                          PrimaryButton(
                              label: "Verify",
                              onClick: () {
                                controller.validateOtp(context,phoneNo);
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
