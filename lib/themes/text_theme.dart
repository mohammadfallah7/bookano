import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextTheme get englishText => GoogleFonts.urbanistTextTheme(
        const TextTheme(
          bodySmall: TextStyle(
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w400,
          ),
          headlineSmall: TextStyle(
            fontWeight: FontWeight.w800,
          ),
          labelSmall: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}
