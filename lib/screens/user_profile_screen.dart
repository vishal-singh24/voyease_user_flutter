import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:voyease_frontend/configs/app_colors.dart';
import 'package:voyease_frontend/widgets/app_top_nav_bar.dart';
import 'package:voyease_frontend/widgets/bottom_nav_bar.dart';
import 'package:voyease_frontend/widgets/common_widgets.dart';
import 'package:voyease_frontend/widgets/primary_button.dart';

@RoutePage()
class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GradientBackground(
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
                      borderRadius: BorderRadius.circular(20))),
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
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 45),
                  decoration: ShapeDecoration(
                    color: AppColors.white,
                    shadows: const [
                      BoxShadow(
                          offset: Offset(2, 4),
                          color: Color(0x60000000),
                          blurRadius: 10,
                          spreadRadius: 4)
                    ],
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.textGray, width: 1),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const TextInput(
                        label: "Name",
                        value: "Aditya Singh",
                      ),
                      const SizedBox(height: 18),
                      const TextInput(
                        label: "Email",
                        value: "aditya.singh@gmail.com",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 18),
                      const TextInput(
                        label: "Phone Number",
                        value: "+919292929292",
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 18),
                      TextInput(
                        label: "Password",
                        value: "password123",
                        isPassword: true,
                        couter: InkWell(
                          onTap: () {},
                          child: Text(
                            "Change password?",
                            style: TextStyle(
                              color: AppColors.textBlue,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      PrimaryButton(
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
        )),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class TextInput extends StatelessWidget {
  const TextInput(
      {super.key,
      this.label,
      this.value = "",
      this.keyboardType = TextInputType.text,
      this.isPassword = false,
      this.couter});

  final String? label;
  final String value;
  final TextInputType keyboardType;
  final bool isPassword;
  final Widget? couter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 5),
            child: Text(
              label!,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: const [
                BoxShadow(
                    offset: Offset(-1, 4),
                    color: Color(0x60000000),
                    blurRadius: 4,
                    spreadRadius: 0)
              ],
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            obscureText: isPassword,
            initialValue: value,
            keyboardType: keyboardType,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: label,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: isPassword
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.visibility_off_outlined,
                        size: 20,
                      ),
                    )
                  : null,
            ),
          ),
        ),
        if (couter != null)
          Container(
              alignment: AlignmentDirectional.centerEnd,
              margin: const EdgeInsets.only(top: 6),
              child: couter)
      ],
    );
  }
}
