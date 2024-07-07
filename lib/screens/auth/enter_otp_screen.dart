import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:pinput/pinput.dart";
import "package:voyease_frontend/configs/app_colors.dart";
import "package:voyease_frontend/core/routing/app_router.dart";
import "package:voyease_frontend/widgets/app_top_nav_bar.dart";
import "package:voyease_frontend/widgets/buttons/primary_button.dart";
import "package:voyease_frontend/widgets/gradient_background.dart";

@RoutePage()
class EnterOtpScreen extends StatelessWidget {
  const EnterOtpScreen({super.key});

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
                    "assets/images/msg_icon.png",
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Enter OTP",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                const SizedBox(height: 30),
                const Text(
                  "We sent a 4 digit code to your mobile number. "
                  "Please enter the code:",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 30),
                Pinput(
                  length: 4,
                  defaultPinTheme: PinTheme(
                    width: 56,
                    height: 70,
                    textStyle: const TextStyle(fontSize: 25),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 45),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  width: MediaQuery.of(context).size.width,
                  child: PrimaryButton(
                    onClick: () {
                      context.router.pushNamed(PasswordResetRoute.name);
                    },
                    label: "Continue",
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn't get OTP?",
                      style: TextStyle(fontSize: 14),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        " Resend OTP",
                        style:
                            TextStyle(color: AppColors.textLink, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
