import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:voyease_frontend/configs/app_colors.dart";
import "package:voyease_frontend/widgets/app_card.dart";
import "package:voyease_frontend/widgets/buttons/secondary_button.dart";
import "package:voyease_frontend/widgets/form/input_field.dart";
import "package:voyease_frontend/widgets/app_top_nav_bar.dart";
import "package:voyease_frontend/widgets/gradient_background.dart";

@RoutePage()
class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GradientBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const AppTopNavBar(),
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile.png"),
              radius: 72 / 2,
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: ShapeDecoration(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text(
                "Aditya Singh",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                AppCard(
                  child: Column(
                    // shrinkWrap: true,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const InputField(
                        label: "Name",
                        value: "Aditya Singh",
                      ),
                      const SizedBox(height: 18),
                      const InputField(
                        label: "Email",
                        value: "aditya.singh@gmail.com",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 18),
                      const InputField(
                        label: "Phone Number",
                        value: "+919292929292",
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 18),
                      InputField(
                        label: "Password",
                        value: "password123",
                        isPassword: true,
                        couter: InkWell(
                          onTap: () {},
                          child: Text(
                            "Change password?",
                            style: TextStyle(
                              color: AppColors.textLink,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      SecondaryButton(
                        label: "Save Changes",
                        onClick: () {},
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: -20,
                  right: 35,
                  child: FloatingActionButton.small(
                    backgroundColor: AppColors.primary,
                    elevation: 0,
                    shape: const CircleBorder(),
                    onPressed: () {},
                    child: const Icon(Icons.edit_outlined),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
