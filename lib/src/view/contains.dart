import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color(0xFF1f1f1F);
const kSecondaryColor = Color(0xFFf43f5e);
const kTertiaryColor = Color(0xFF1a1a1a);
const kQuaternaryColor = Color(0xFF292929);

const textColor = Color(0xFFF0F0F0);
const kButtonColor = Color(0xFF3f3f3f);

const kWarninngColor = Color(0xFFF2B40A);
const kErrorColor = Color(0xFFED1616);
const kSuccessColor = Color(0xFF4BB543);

const kDefautPadding = 20;

class SnackBarStyle {
  static TextStyle kTitle = GoogleFonts.mulish(
      color: kTertiaryColor, fontSize: 18, fontWeight: FontWeight.w600);
  static TextStyle kMessage = GoogleFonts.mulish(
      color: kTertiaryColor, fontSize: 16, fontWeight: FontWeight.w400);
}
