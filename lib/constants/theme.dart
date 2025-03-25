// theme.dart
import 'package:flutter/material.dart';

class CafeTheme {
  static const primaryColor = Color(0xFF8C6239); // 따뜻한 커피 브라운
  static const accentColor = Color(0xFFD9B08C); // 부드러운 베이지
  static const backgroundColor = Color(0xFFFFFAF5); // 아주 밝은 아이보리

  static ThemeData themeData() {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontFamily: 'NanumPen', fontSize: 18),
        titleLarge: TextStyle(fontFamily: 'NanumPen', fontSize: 24),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
