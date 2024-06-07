import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  InputWidget(
      {super.key,
      required this.placeholder,
      required this.icon,
      this.suffixIcon,
      this.type = InputType.text});

  final String placeholder;
  final IconData icon;
  IconData? suffixIcon;
  InputType type;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black12, width: 1.5)),
        child: TextField(
          decoration: InputDecoration(
              hintText: placeholder,
              border: InputBorder.none,
              icon: Icon(
                icon,
              ),
              suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null),
          autocorrect: false,
          obscureText: type == InputType.password,
          enableSuggestions: false,
        ));
  }
}

enum InputType { text, password }
