import 'package:card_oil/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData themeApp() {
  InputDecorationTheme inputDecorationTheme() {
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
  }

  IconThemeData iconTheme() {
    return const IconThemeData(color: menthePrimaryColor);
  }

  AppBarTheme appBarTheme() {
    return AppBarTheme(
      iconTheme: iconTheme(),
      elevation: 0,
      color: Colors.transparent,
    );
  }

  return ThemeData(
    scaffoldBackgroundColor: whiteColor,
    inputDecorationTheme: inputDecorationTheme(),
    appBarTheme: appBarTheme(),
  );
}
