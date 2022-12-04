import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../contains.dart';

class ButtonSquare extends StatelessWidget {
  const ButtonSquare(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.bgColor});

  final VoidCallback onPressed;
  final Icon icon;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: icon,
      ),
    );
  }
}

class ButtonCus extends StatelessWidget {
  const ButtonCus(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.bgColor,
      required this.textColor,
      required this.fontSize});

  final VoidCallback onPressed;
  final Color bgColor;
  final Color textColor;
  final String text;

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefautPadding / 1.6, vertical: kDefautPadding / 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7), color: bgColor),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.mulish(
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
