import "package:flutter/material.dart";
import "package:voyease_frontend/configs/app_colors.dart";
import "package:voyease_frontend/widgets/buttons/secondary_button.dart";

class RaiseIssueConfirmDialog extends StatelessWidget {
  const RaiseIssueConfirmDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      content: Container(
        height: 270,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 48),
            const Text(
              "Issue has been raised with ticket number: ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 15),
            const Text(
              "#1235700",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 25),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: SecondaryButton(
                label: "ok",
                onClick: () {
                  Navigator.of(context).pop();
                  // getIt<AppRouter>().maybePopTop();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
