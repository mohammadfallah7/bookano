import 'package:bookano/themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppThemeColor {
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Color(0XFFE49527),
          secondary: Color(0XFF165C73),
          surface: Color(0XFFDADADA),
          background: Colors.white,
        ),
        textTheme: AppTextTheme.englishText,
      );
}
