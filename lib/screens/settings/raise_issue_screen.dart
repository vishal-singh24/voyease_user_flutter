import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:voyease_frontend/widgets/app_top_nav_bar.dart';
import 'package:voyease_frontend/widgets/buttons/secondary_button.dart';
import 'package:voyease_frontend/widgets/dialogs/raise_issue_confirm_dialog.dart';
import 'package:voyease_frontend/widgets/form/dropdown_field.dart';
import 'package:voyease_frontend/widgets/form/input_field.dart';
import 'package:voyease_frontend/widgets/gradient_background.dart';

@RoutePage()
class RaiseIssueScreen extends StatelessWidget {
  const RaiseIssueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GradientBackground(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppTopNavBar(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 34, vertical: 15),
                child: const Text(
                  "Raise an issue",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
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
                      onClick: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const RaiseIssueConfirmDialog();
                          },
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
