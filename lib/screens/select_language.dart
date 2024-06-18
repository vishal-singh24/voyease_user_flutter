import 'package:flutter/material.dart';
import 'package:voyease_frontend/configs/app_colors.dart';
import 'package:voyease_frontend/widgets/language_card.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final List<String> languages = [
      "हिंदी",
      "English",
      "தமிழ்",
      "తెలుగు",
      "Français",
      "Deutsch",
      "日本語",
      "Español"
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40),
              color: AppColors.secondary,
              width: size.width,
              height: 92,
              child: const Text(
                "Welcome to VoyEase",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Container(
              width: size.width,
              height: 49,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
              decoration:
                  BoxDecoration(color: AppColors.primary, boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(75, 0, 0, 0),
                    blurRadius: 4,
                    offset: Offset(2, 4)),
              ]),
              child: Text(
                "Select your language",
                style: TextStyle(
                    color: AppColors.textLight,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GridView.count(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                crossAxisCount: 2,
                childAspectRatio: 2,
                mainAxisSpacing: 25,
                crossAxisSpacing: 40,
                shrinkWrap: true,
                children: List.generate(
                  languages.length,
                  (index) {
                    return LanguageCard(
                      language: languages[index],
                      selectedLanguage: languages[0],
                    );
                  },
                )),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {},
              style:
                  ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
              child: Text(
                "Proceed",
                style: TextStyle(
                    color: AppColors.textLight,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
