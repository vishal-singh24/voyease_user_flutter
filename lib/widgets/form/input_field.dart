import "package:flutter/material.dart";
import "package:voyease_frontend/configs/app_colors.dart";

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    this.label,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.couter,
    this.placeholder,
    this.lines = 1,
    this.prefixIcon,
    this.suffixIcon,
     this.validator,
     this.controller,
  });

  final String? label;
  final String? placeholder;
  final TextInputType keyboardType;
  final bool isPassword;
  final Widget? couter;
  final int lines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isPasswordHidden = false;

  @override
  void initState() {
    isPasswordHidden = widget.isPassword || false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 5),
            child: Text(
              widget.label!,
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
              borderRadius: BorderRadius.circular(50)),
          child: TextFormField(
            controller: widget.controller,
             validator: widget.validator,
            minLines: widget.lines,
            maxLines: widget.lines,
            obscureText: isPasswordHidden,
            keyboardType: widget.keyboardType,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              hintText: widget.placeholder ?? widget.label,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                      icon: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 20,
                      ),
                    )
                  : widget.suffixIcon,
            ),
          ),
        ),
        if (widget.couter != null)
          Container(
              alignment: AlignmentDirectional.centerEnd,
              margin: const EdgeInsets.only(top: 6),
              child: widget.couter)
      ],
    );
  }
}