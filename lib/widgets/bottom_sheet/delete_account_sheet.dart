import 'package:flutter/material.dart';
import 'package:voyease_frontend/core/di/di.dart';
import 'package:voyease_frontend/core/routing/app_router.dart';
import 'package:voyease_frontend/widgets/buttons/secondary_button.dart';
import 'package:voyease_frontend/widgets/form/input_field.dart';

class DeleteAccountSheet extends StatefulWidget {
  const DeleteAccountSheet({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DeleteAccoutSheetState();
  }
}

class _DeleteAccoutSheetState extends State<DeleteAccountSheet> {
  int currentview = 0;
  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      page1(),
      page2(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return pages[currentview];
  }

  Widget page1() {
    return Container(
      height: 400,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),
          const Text(
            "Delete Account?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "You will loose all your data once you permanently delete your account. Do you wish to continue?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 35),
          SecondaryButton(
            label: "Delete Account",
            onClick: () {
              setState(() {
                currentview = 1;
              });
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

  Widget page2() {
    return Container(
      height: 360,
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),
          const Text(
            "Delete Account?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Enter your password, to continue",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          const InputField(
            placeholder: "Enter password",
            isPassword: true,
          ),
          const SizedBox(height: 30),
          SecondaryButton(
            label: "Delete Account",
            onClick: () {
              Navigator.pop(context);
              getIt<AppRouter>().replaceAll([const AuthNavigationRoute()]);
            },
          ),
        ],
      ),
    );
  }
}
