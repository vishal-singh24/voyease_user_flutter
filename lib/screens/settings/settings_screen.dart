import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:voyease_frontend/configs/app_colors.dart";
import "package:voyease_frontend/core/routing/app_router.dart";
import "package:voyease_frontend/widgets/bottom_sheet/delete_account_sheet.dart";
import "package:voyease_frontend/widgets/bottom_sheet/logout_sheet.dart";

@RoutePage()
class SettingsScreen extends StatelessWidget {
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
              //context.navigateNamedTo(UserProfileRoute.name);
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
              //context.navigateNamedTo(PreviousBookingsRoute.name);
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
              //context.navigateNamedTo(RaiseIssueRoute.name);
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

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35 / 2,
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Hi, Aditya",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration:
                  const BoxDecoration(border: Border(top: BorderSide())),
              child: Column(
                children: data.map(
                  (e) {
                    String title = e["title"];
                    List elements = e["elements"];
                    return SettingsSection(
                        title: title, icon: e["icon"], elements: elements);
                  },
                ).toList(),
              ),
            ),
            Container(
              width: size.width,
              decoration: const BoxDecoration(
                border: Border(top: BorderSide()),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SettingsCard(
                        title: "Feedback form",
                        onClick: () {
                          //context.navigateNamedTo(FeedbackFormRoute.name);
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
                         // context.navigateNamedTo(AboutUsRoute.name);
                        },
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
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
            borderRadius: BorderRadius.circular(12),
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
        color: AppColors.darkBlue,
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: AppColors.textLight,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            CircleAvatar(
              radius: 25 / 2,
              backgroundColor: AppColors.primaryLight,
              child: const Icon(
                Icons.chevron_right_rounded,
              ),
            )
          ],
        ),
      ),
    );
  }
}
