import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:voyease_frontend/screens/auth/landing_screen.dart";
import "package:voyease_frontend/utils/shared_preferences.dart";
import "package:voyease_frontend/widgets/buttons/secondary_button.dart";

class LogoutSheet extends StatelessWidget {
  const LogoutSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),
          const Text(
            "Account Logout",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Are you sure you want to logout from VoyEase?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 35),
          SecondaryButton(
            label: "Logout",
            onClick: () async {
              await TokenStorage.deleteToken();
             // Navigator.pop(context);
              Get.offAll(() => const LandingScreen());
            },
          ),
          const SizedBox(height: 10),
          SecondaryButton.outlined(
            label: "Go Back",
            onClick: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
