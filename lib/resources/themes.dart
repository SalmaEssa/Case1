import 'package:flutter/material.dart';
import 'colors.dart';

/// TODO: THIS IS JUST AN EXAMPLE THEME. SOME CHANGES MAY APPLY TO MATCH YOUR PROJECT USE CASE

class AppThemes {
  static final englishAppTheme = ThemeData(
    primaryColor: AppColors.primary,
    primaryColorDark: AppColors.primaryDark,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.accent
    ),
    iconTheme: iconTheme,
    scaffoldBackgroundColor: AppColors.white,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(foregroundColor: AppColors.primary),
    primaryIconTheme: iconTheme,
    hintColor: Colors.transparent,
    errorColor: AppColors.redError,
    fontFamily: "Poppins",
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 25.0, fontWeight: FontWeight.w600, color: AppColors.darkText),
      headline2: TextStyle(
          fontSize: 22.0, fontWeight: FontWeight.w600, color: AppColors.darkText),
      headline3: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w600, color: AppColors.darkText),
      subtitle2: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.w700, color: AppColors.darkText),
      button: TextStyle(
          fontSize: 15.0, fontWeight: FontWeight.w700, color: AppColors.darkText),
      bodyText1: TextStyle(fontSize: 14.0, color: AppColors.darkText),
    ),
  );

  static final arabicAppTheme = ThemeData(
    primaryColor: AppColors.primary,
    primaryColorDark: AppColors.primary,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.accent, // Your accent color
    ),
    iconTheme: iconTheme,
    scaffoldBackgroundColor: AppColors.white,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(foregroundColor: AppColors.primary),
    primaryIconTheme: iconTheme,
    hintColor: Colors.transparent,
    errorColor: AppColors.redError,
    fontFamily: "Cairo",
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 25.0, fontWeight: FontWeight.w600, color: AppColors.darkText),
      headline2: TextStyle(
          fontSize: 22.0, fontWeight: FontWeight.w600, color: AppColors.darkText),
      headline3: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w600, color: AppColors.darkText),
      subtitle2: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.w700, color: AppColors.darkText),
      button: TextStyle(
          fontSize: 15.0, fontWeight: FontWeight.w700, color: AppColors.darkText),
      bodyText1: TextStyle(fontSize: 14.0, color: AppColors.darkText),
    ),
  );

  static const iconTheme = IconThemeData(color: AppColors.primary);
}
