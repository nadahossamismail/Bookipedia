import 'package:bookipedia/app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static final TextStyle authHeadline =
      GoogleFonts.playfairDisplay(fontSize: 30, fontWeight: FontWeight.bold);

  static const TextStyle title =
      TextStyle(fontSize: 27, fontWeight: FontWeight.w800);

  static final TextStyle textButtonText = TextStyle(
    fontSize: 16,
    color: ColorManager.primary,
  );
}
