import 'package:flutter/material.dart';

class CheckBoxField extends StatelessWidget {
  const CheckBoxField({
    super.key,
    this.label,
  });

  final Widget? label;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            value: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            onChanged: (value) => {},
          ),
        ),
        const SizedBox(width: 5),
        if (label != null) label!
      ],
    );
  }
}
