import 'package:flutter/material.dart';

class RabbitGoColors {
  static const primaryColor = MaterialColor(0xFF01142B, {});

  static const secondaryColor = MaterialColor(0xFF6C6C6C, {
    50: Color(0xFFEBEBEB),
    100: Color(0xFFEDEDED),
    200: Color(0xFFE2E2E2),
    300: Color(0xFFB8B8B8),
    400: Color(0xFF9F9F9F),
    500: Color(0xFF979797),
  });

  static const blueColor = MaterialColor(0xFF023E86, {
    50: Color(0xFF0465D9),
  });

  static const skyBlueColor = MaterialColor(0xFF4F9DFC, {
    50: Color(0xFF4F9DFC)
  });

  static const redColor = MaterialColor(0xFF990404, {
    50: Color(0xFFFF7878),
    100: Color(0xFFAB0000)
  });
}

ThemeData rabbitGoTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: RabbitGoColors.primaryColor,
    primary: RabbitGoColors.primaryColor,
    primaryContainer: RabbitGoColors.primaryColor[100],
    secondary: RabbitGoColors.secondaryColor,
    surface: Colors.white
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    surfaceTintColor: Colors.white,
  ),
  fontFamily: "Inter",
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.normal
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700
    ),
    
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const WidgetStatePropertyAll(
        RabbitGoColors.primaryColor
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        )
      )
    )
  )
);

