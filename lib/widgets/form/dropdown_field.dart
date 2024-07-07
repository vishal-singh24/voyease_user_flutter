import "package:flutter/material.dart";
import "package:voyease_frontend/configs/app_colors.dart";

class DropdownField extends StatelessWidget {
  const DropdownField(
      {super.key, required this.items, this.value, this.placeholder});

  final List<String> items;
  final String? value;
  final String? placeholder;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: DropdownButtonFormField(
          isExpanded: true,
          hint: placeholder != null ? Text(placeholder!) : null,
          value: value,
          icon: const Icon(Icons.keyboard_arrow_down),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onChanged: (String? value) {},
          items: items.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }).toList(),
        ));
  }
}
