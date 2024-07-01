import 'package:flutter/material.dart';
import 'package:voyease_frontend/configs/app_colors.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
      this.label,
      this.value = "",
      this.keyboardType = TextInputType.text,
      this.isPassword = false,
      this.couter});

  final String? label;
  final String value;
  final TextInputType keyboardType;
  final bool isPassword;
  final Widget? couter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 5),
            child: Text(
              label!,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        Container(
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
          child: TextFormField(
            obscureText: isPassword,
            initialValue: value,
            keyboardType: keyboardType,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: label,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: isPassword
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.visibility_off_outlined,
                        size: 20,
                      ),
                    )
                  : null,
            ),
          ),
        ),
        if (couter != null)
          Container(
              alignment: AlignmentDirectional.centerEnd,
              margin: const EdgeInsets.only(top: 6),
              child: couter)
      ],
    );
  }
}
