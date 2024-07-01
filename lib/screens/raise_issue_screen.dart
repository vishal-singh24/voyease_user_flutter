import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:voyease_frontend/configs/app_colors.dart';
import 'package:voyease_frontend/widgets/app_top_nav_bar.dart';
import 'package:voyease_frontend/widgets/buttons/secondary_button.dart';
import 'package:voyease_frontend/widgets/form/dropdown_field.dart';
import 'package:voyease_frontend/widgets/form/input_field.dart';

@RoutePage()
class RaiseIssueScreen extends StatelessWidget {
  const RaiseIssueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppTopNavBar(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 15),
              child: const Text(
                "Raise an issue",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DropdownField(
                    items: ["a"],
                    placeholder: "Select your journey",
                  ),
                  const SizedBox(height: 32),
                  const DropdownField(
                    items: ["a"],
                    placeholder: "Issue with the trip",
                  ),
                  const SizedBox(height: 65),
                  const InputField(
                    label: "Describe you issue",
                    placeholder: "Enter you issue...",
                    keyboardType: TextInputType.multiline,
                    lines: 6,
                  ),
                  const SizedBox(height: 65),
                  SecondaryButton(
                    label: "Submit",
                    onClick: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 45),
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
      child: child,
    );
  }
}
