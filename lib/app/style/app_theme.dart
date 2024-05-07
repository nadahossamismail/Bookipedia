import 'package:bookipedia/app/style/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeManger {
  ThemeData getApplicationTheme() {
    return ThemeData(
      primaryColor: ColorManager.primary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorManager.primary,
      ),
    );
  }
}
