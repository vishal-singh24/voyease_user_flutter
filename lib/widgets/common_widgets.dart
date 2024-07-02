import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;

  const CustomInputField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 49,
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 11),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(50),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(-1, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              child: Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF7E7E7E),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0.14,
                  letterSpacing: -0.50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: 350,
        padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 7),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.25),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              height: 0,
              letterSpacing: 0.80,
            ),
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String label;
  final Widget logo;

  const SocialButton({
    super.key,
    required this.label,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 136,
      height: 44,
      padding: const EdgeInsets.all(2),
      decoration: ShapeDecoration(
        color: const Color(0xFFF5F9FD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 2,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          logo,
          const SizedBox(width: 16),
          SizedBox(
            width: 91,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF61677D),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                height: 0.09,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
