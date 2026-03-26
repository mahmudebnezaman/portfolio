import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: backgroundColorLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    cardTheme: CardThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 0,
      color: cardColorLight,
      shadowColor: shadowColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: seedColor,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: const TextStyle(
          fontFamily: 'Sora',
          fontWeight: FontWeight.w600,
          fontSize: 13,
          letterSpacing: 0.4,
        ),
      ),
    ),
    fontFamily: 'Sora',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.bold,
        color: primaryTextColorLight,
        letterSpacing: -1.5,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w600,
        color: secondaryTextColorLight,
        letterSpacing: -0.5,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w500,
        color: tertiaryTextColorLight,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: primaryTextColorLight,
        letterSpacing: -0.5,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: primaryTextColorLight,
        letterSpacing: -0.5,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: primaryTextColorLight,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: primaryTextColorLight,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: secondaryTextColorLight,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: tertiaryTextColorLight,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: primaryTextColorLight,
        height: 1.65,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: secondaryTextColorLight,
        height: 1.65,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: tertiaryTextColorLight,
        height: 1.65,
      ),
      labelLarge: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: primaryTextColorLight,
        letterSpacing: 0.4,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: secondaryTextColorLight,
        letterSpacing: 0.3,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: tertiaryTextColorLight,
        letterSpacing: 0.5,
      ),
    ),
  );
}
