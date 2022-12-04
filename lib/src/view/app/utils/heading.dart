import 'package:client/src/view/contains.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppHeading extends StatelessWidget {
  const AppHeading(
      {super.key,
      required this.title,
      this.status = false,
      required this.onPressed,
      required this.icon});

  final String title;
  final bool status;
  final VoidCallback onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kDefautPadding * 0.5),
      child: GestureDetector(
        onTap: status ? onPressed : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.mulish(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 15),
            status ? icon : SizedBox()
          ],
        ),
      ),
    );
  }
}
