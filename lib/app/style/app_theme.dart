import 'package:bookipedia/app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManger 
{
  ThemeData getApplicationTheme()
  {
    return ThemeData(primaryColor: ColorManager.primary,
    cardTheme: CardTheme(),
    textButtonTheme: TextButtonThemeData(),
    elevatedButtonTheme: ElevatedButtonThemeData(),
    textTheme: TextTheme(headlineMedium:GoogleFonts.roboto(fontWeight: FontWeight.w700,fontSize: 24,
     ),headlineSmall: GoogleFonts.aBeeZee(fontWeight: FontWeight.w400,fontSize: 14,
     ) )

    );
  }
}