import 'package:bookipedia/app/style/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeManger {
  ThemeData getApplicationDarkTheme() {
    return ThemeData(
      primaryColor: ColorManager.primary,
      colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.primary),
      cardTheme: const CardTheme(),
      textButtonTheme: const TextButtonThemeData(),
      elevatedButtonTheme: const ElevatedButtonThemeData(),
    );
  }
}
