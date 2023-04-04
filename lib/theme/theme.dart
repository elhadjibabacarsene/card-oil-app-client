import 'package:card_oil/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData themeApp() {
  InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      hintStyle: const TextStyle(
          color: grayscale400, fontSize: 16, fontWeight: FontWeight.w400),
      filled: true,
      fillColor: grayscale50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }
  /*InputDecorationTheme inputDecorationTheme() {
    const double borderRadiusInput = 20.0;

    return InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: menthePrimaryColor,
        ),
        borderRadius: BorderRadius.circular(borderRadiusInput),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: greySecondaryColor,
        ),
        borderRadius: BorderRadius.circular(borderRadiusInput),
      ),
    );
  }*/

  IconThemeData iconTheme() {
    return const IconThemeData(color: menthePrimaryColor);
  }

  AppBarTheme appBarTheme() {
    return AppBarTheme(
        iconTheme: iconTheme(),
        elevation: 0,
        color: Colors.transparent,
        titleTextStyle: const TextStyle(
          color: blueDarkPrimaryColor,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ));
  }

  return ThemeData(
    scaffoldBackgroundColor: whiteColor,
    inputDecorationTheme: inputDecorationTheme(),
    appBarTheme: appBarTheme(),
    primaryColor: mentheSecondaryColor,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: mentheSecondaryColor),
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: mentheSecondaryColor),
  );
}
