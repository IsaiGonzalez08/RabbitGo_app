import 'package:flutter/material.dart';

class RabbitGoColors {
  static const primaryColor = MaterialColor(0xFF01142B, {});

  static const secondaryColor = MaterialColor(0xFF023E86, {});

  static const blueColor = MaterialColor(0xFF0465D9, {});

  static const skyBlueColor = MaterialColor(0xFF4F9DFC, {
    50: Color(0xFF4F9DFC)
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
      fontWeight: FontWeight.w600
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500
    )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(
        RabbitGoColors.blueColor[300]
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        )
      )
    )
  )
);

