import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:voyease_frontend/configs/app_colors.dart";
import "package:voyease_frontend/screens/settings/settings_screen/controller/settings_screen_controller.dart";
import "package:voyease_frontend/screens/settings/user_profile_screen/controller/user_profile_screen_controller.dart";
import "package:voyease_frontend/widgets/app_card.dart";
import "package:voyease_frontend/widgets/buttons/secondary_button.dart";
import "package:voyease_frontend/widgets/form/input_field.dart";
import "package:voyease_frontend/widgets/app_top_nav_bar.dart";
import "package:voyease_frontend/widgets/gradient_background.dart";

@RoutePage()
class UserProfileScreen extends GetView<UserProfileScreenController> {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileScreenController>(
        init: UserProfileScreenController(),
        initState: (_) {
          SettingsScreenController();
        },
        builder: (_) {
          if (controller.userprofile.isEmpty) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            body: SafeArea(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      decoration: ShapeDecoration(
                        color: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Text(
                        controller.name.text,
                        style: const TextStyle(
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
                              InputField(
                                label: "Name",
                                controller:controller.name ,
                                enabled: controller.isEditing,
                              ),
                              const SizedBox(height: 18),
                              InputField(
                                label: "Email",
                                controller: controller.email,
                                enabled: controller.isEditing,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(height: 18),
                              InputField(
                                label: "Phone Number",
                                controller: controller.phone,
                                enabled: controller.isEditing,
                                keyboardType: TextInputType.phone,
                              ),
                              const SizedBox(height: 18),
                              InputField(
                                label: "Password",
                                controller: controller.password,
                                enabled: controller.isEditing,
                                isPassword: true,
                                couter: InkWell(
                                  onTap: () {},
                                  child: Visibility(
                                    visible: controller.isEditing,
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
                              ),
                              const SizedBox(height: 18),
                              Visibility(
                                visible: controller.isEditing,
                                child: SecondaryButton(
                                  label: "Save Changes",
                                  onClick: () {},
                                ),
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
                            onPressed: () {
                              controller.toggleEditing();
                            },
                            child: Icon(controller.isEditing
                                ? Icons.check
                                : Icons.edit_outlined),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
            ),
          );
        });
  }
}
