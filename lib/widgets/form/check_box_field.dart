import "package:flutter/material.dart";

class CheckBoxField extends StatelessWidget {
  const CheckBoxField({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.activeColor = Colors.white,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;
  final Widget? label;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            value: value,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            onChanged: onChanged,
            activeColor:   activeColor,
            checkColor: Colors.white,
          ),
        ),
        const SizedBox(width: 5),
        if (label != null) label!
      ],
    );
  }
}
