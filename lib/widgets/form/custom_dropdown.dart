import 'package:flutter/material.dart';
import 'package:voyease_frontend/configs/app_colors.dart';

class CustomDropDownWidget extends StatelessWidget {
  const CustomDropDownWidget({
    super.key,
    this.value,
    required this.items,
    required this.onChanged,
    this.labelText,
    this.hintText,
    this.validator,
  });

  final void Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  final String? value;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;

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
          borderRadius: BorderRadius.circular(50)),
      child: DropdownButtonFormField<String>(
        //isDense: true,
        icon: const SizedBox(),
        isExpanded: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        validator: validator,

        value: value,

        items: items,

        onChanged: onChanged,

        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle:const TextStyle(fontSize: 15,),
          suffixIcon: const Icon(Icons.keyboard_arrow_down),
          isCollapsed: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          labelText: labelText,
          
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
