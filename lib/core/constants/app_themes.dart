import 'app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final class AppThemes {
  AppThemes._();

  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: GoogleFonts.notoSansArabic().fontFamily,
    textTheme: GoogleFonts.notoSansArabicTextTheme().apply(
      bodyColor: AppColors.text,
      displayColor: AppColors.text,
    ),
  );
}
