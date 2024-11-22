import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:voyease_frontend/configs/app_colors.dart";
import "package:voyease_frontend/core/routing/app_router.dart";
import "package:voyease_frontend/screens/settings/settings_screen/controller/settings_screen_controller.dart";
import "package:voyease_frontend/widgets/bottom_sheet/delete_account_sheet.dart";
import "package:voyease_frontend/widgets/bottom_sheet/logout_sheet.dart";

@RoutePage()
class SettingsScreen extends GetView<SettingsScreenController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    List data = [
      {
        "title": "Profile",
        "elements": [
          {
            "title": "Account and User details",
            "onClick": () {
              Navigator.pushNamed(context, AppRoutes.userProfileScreen);
            }
          }
        ]
      },
      {
        "title": "Bookings",
        "elements": [
          {
            "title": "Previous Bookings",
            "onClick": () {
              Navigator.pushNamed(context, AppRoutes.previousBookingsScreen);
            }
          },
          {
            "title": "Upcoming Bookings",
          },
          {
            "title": "Ongoing Bookings",
          },
        ]
      },
      {
        "title": "Customer Support/Help",
        "icon": Icons.headset_mic_outlined,
        "elements": [
          {
            "title": "Raise an issue ticket",
            "onClick": () {
              Navigator.pushNamed(context, AppRoutes.raiseIssueScreen);
            }
          },
          {
            "title": "Issue Ticket Status",
          },
          {
            "title": "Contact Us",
          }
        ]
      },
      {
        "title": "Other",
        "elements": [
          {
            "title": "Logout",
            "onClick": () {
              showModalBottomSheet(
                  backgroundColor: AppColors.white,
                  context: context,
                  useRootNavigator: true,
                  builder: (context) {
                    return const LogoutSheet();
                  });
            }
          },
          {
            "title": "Delete account",
            "onClick": () {
              showModalBottomSheet(
                  backgroundColor: AppColors.white,
                  context: context,
                  useRootNavigator: true,
                  isScrollControlled: true,
                  builder: (context) {
                    return const DeleteAccountSheet();
                  });
            }
          }
        ]
      }
    ];

    return GetBuilder<SettingsScreenController>(
        init: SettingsScreenController(),
        initState: (_) {},
        builder: (_) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                    ),
                    // width: size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 93,
                              width: 74,
                              decoration: BoxDecoration(
                                  color: AppColors.secondary,
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 22),
                              child: CircleAvatar(
                                radius: 29,
                                backgroundImage: controller
                                            .userprofile[0].profile !=
                                        null
                                    ? NetworkImage(
                                        controller.userprofile[0].profile!)
                                    : const AssetImage("assets/images/profile.png"),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 45,
                        ),

                        // Display the user's name
                        Text(
                          "${controller.userprofile[0].name}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                    ),
                    width: size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: data.map(
                        (e) {
                          String title = e["title"];
                          List elements = e["elements"];
                          return SettingsSection(
                              title: title,
                              icon: e["icon"],
                              elements: elements);
                        },
                      ).toList(),
                    ),
                  ),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        ClipRRect(
                            child: SettingsCard(
                          title: "Feedback form",
                          onClick: () {
                            Navigator.pushNamed(
                                context, AppRoutes.feedbackFormScreen);
                          },
                        )),
                        const SizedBox(
                          height: 10,
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SettingsCard(
                              title: "About us",
                              onClick: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.aboutUsScreen);
                              },
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
    required this.title,
    required this.elements,
    this.icon,
  });

  final String title;
  final IconData? icon;
  final List elements;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 9),
              if (icon != null) Icon(icon)
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.zero,
            child: Column(
              children: elements
                  .map(
                    (e) => SettingsCard(
                      title: e["title"],
                      onClick: e["onClick"],
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
    required this.title,
    this.onClick,
  });

  final String title;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        color: AppColors.white,
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const Icon(
              Icons.chevron_right_rounded,
            )
          ],
        ),
      ),
    );
  }
}
