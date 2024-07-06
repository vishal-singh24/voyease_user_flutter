import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:voyease_frontend/configs/app_colors.dart';
import 'package:voyease_frontend/widgets/app_top_nav_bar.dart';
import 'package:voyease_frontend/widgets/buttons/primary_button.dart';
import 'package:voyease_frontend/widgets/form/input_field.dart';
import 'package:voyease_frontend/widgets/gradient_background.dart';

@RoutePage()
class SignUpVerifyScreen extends StatelessWidget {
  const SignUpVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AppTopNavBar(),
                const SizedBox(height: 50),
                const Text(
                  'Verify your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
                ),
                const SizedBox(height: 55),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'We sent a verification code to your registered mail'
                    ' id. The code will expire in 24 hours.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
                      const InputField(placeholder: "Enter verification code"),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Resend code',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textLink),
                            ),
                          ),
                          const Text(' in 00:45',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight
                                      .w400)), //Timer is to be added here
                        ],
                      ),
                      const SizedBox(height: 35),
                      PrimaryButton(label: "Verify", onClick: () {}),
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
