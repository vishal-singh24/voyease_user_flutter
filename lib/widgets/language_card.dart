import "package:flutter/material.dart";

class LanguageCard extends StatelessWidget {
  const LanguageCard(
      {super.key,
      required this.language,
      required this.selectedLanguage,
      this.onClick});

  final String language;
  final String selectedLanguage;
  final Function(String?)? onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(65, 0, 0, 0),
                blurRadius: 4,
                spreadRadius: 0,
                offset: Offset(2, 4)),
          ]),
      child: Row(
        children: [
          Radio(
              value: language,
              groupValue: selectedLanguage,
              onChanged: onClick),
          Text(
            language,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
