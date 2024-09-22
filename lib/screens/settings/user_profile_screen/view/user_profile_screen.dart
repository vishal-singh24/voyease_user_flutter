import "dart:io";

import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:voyease_frontend/configs/app_colors.dart";
import "package:voyease_frontend/screens/settings/settings_screen/controller/settings_screen_controller.dart";
import "package:voyease_frontend/screens/settings/user_profile_screen/controller/user_profile_screen_controller.dart";
import "package:voyease_frontend/widgets/app_card.dart";
import "package:voyease_frontend/widgets/buttons/secondary_button.dart";
import "package:voyease_frontend/widgets/form/custom_dropdown.dart";
import "package:voyease_frontend/widgets/form/input_field.dart";
import "package:voyease_frontend/widgets/app_top_nav_bar.dart";
import "package:voyease_frontend/widgets/gradient_background.dart";

@RoutePage()
class UserProfileScreen extends GetView<UserProfileScreenController> {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> gender = ["Male", "Female", "Others"];

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
                    Stack(children: [
                      CircleAvatar(
                          radius: 50,
                          backgroundImage: controller.userprofile[0].profile !=
                                  null
                              ? NetworkImage(controller.userprofile[0]
                                  .profile!) // Display image from URL
                              : controller.pickedPImageFile != null
                                  ? FileImage(controller
                                      .pickedPImageFile!) // Display image from file
                                  : const AssetImage(
                                      "assets/images/profile.png")),
                      controller.isEditing
                          ? Positioned(
                              bottom: 5,
                              right: 15,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.edit,
                                      size: 16,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      controller.pickProfileImage();
                                    },
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(), //
                    ]),
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
                                controller: controller.name,
                                enabled: controller.isEditing,
                              ),
                              const SizedBox(height: 18),
                              Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 5),
                                  child: const Text(
                                    "Gender",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  )),
                              Visibility(
                                visible: !controller.isEditing,
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(-1, 4),
                                            color: Color(0x60000000),
                                            blurRadius: 6,
                                            spreadRadius: 0)
                                      ],
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Text(
                                    "${controller.userprofile[0].gender ?? "Not Selected"}",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.4)),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: controller.isEditing,
                                child: CustomDropDownWidget(
                                    items: gender.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400)),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {
                                        controller.selectedValue!.value =
                                            newValue;
                                      }
                                    },
                                    hintText: "${controller.userprofile[0].gender ?? "Select Gender"}"
                                    ),
                              ),
                              const SizedBox(height: 18),
                              InputField(
                                label: "Date of Birth",
                                controller: controller.dateController.value,
                                enabled: controller.isEditing,
                                keyboardType: TextInputType.phone,
                                placeholder: controller.stringformatDateDDMMYYYY(controller.userprofile[0].dob),
                                suffixIcon: InkWell(
                                  onTap: () async {
                                    await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime(2101),
                                        builder: (BuildContext context,
                                            Widget? child) {
                                          return Theme(
                                              data: ThemeData.light().copyWith(
                                                colorScheme:
                                                    const ColorScheme.dark(
                                                  primary: Color.fromARGB(
                                                      255, 171, 2, 58),
                                                  // Header and selected day color
                                                  onPrimary: Color.fromARGB(
                                                      255, 247, 244, 244),
                                                  // Header text and selected day text color
                                                  surface: Color.fromARGB(
                                                      255, 239, 224, 202),
                                                  // Calendar background color
                                                  onSurface: Color.fromARGB(
                                                      255,
                                                      12,
                                                      12,
                                                      12), // Calendar text color
                                                ),
                                                dialogBackgroundColor:
                                                    const Color.fromARGB(
                                                        255, 231, 142, 142),
                                              ),
                                              child: child!);
                                        }).then((pickedDate) {
                                      if (pickedDate != null) {
                                        final formattedDate = controller
                                            .formatDateDDMMYYYY(pickedDate);
                                        controller.dateController.value.text =
                                            formattedDate;
                                        controller.update();
                                      }
                                    });
                                  },
                                  child: const Icon(
                                    Icons.calendar_month,
                                    size: 22,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 18),
                              Visibility(
                                visible: controller.isEditing,
                                child: SecondaryButton(
                                  label: "Save Changes",
                                  onClick: () {
                                    controller.postProfile(context);
                                  },
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
