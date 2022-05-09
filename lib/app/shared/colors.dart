// ignore_for_file: dead_code

import 'package:flutter/material.dart';

class AppColors {
  // Blue
  static const primaryColor = Color(0xff8338EC);
  static const green = Color(0xff15CF74);
  static const primaryLightColor = Color(0xffF8F3FF);

  // secondry

  // backgroun
  static const backgroundColor = Color(0xffE0F7FE);
  // green

  // text
  static const primaryTextColor = Color(0xff001b21);
  static const secondaryTextColor = Color(0xff939295);
  static const titleColor = Color(0xff001B21);

  static const Map<int, Color> colorScratch = {
    50: Color.fromRGBO(7, 45, 114, .1),
    100: Color.fromRGBO(7, 45, 114, .2),
    200: Color.fromRGBO(7, 45, 114, .3),
    300: Color.fromRGBO(7, 45, 114, .4),
    400: Color.fromRGBO(7, 45, 114, .5),
    500: Color.fromRGBO(7, 45, 114, .6),
    600: Color.fromRGBO(7, 45, 114, .7),
    700: Color.fromRGBO(7, 45, 114, .8),
    800: Color.fromRGBO(7, 45, 114, .9),
    900: Color.fromRGBO(7, 45, 114, 1),
  };

  static ThemeData themeData(BuildContext context) {
    const isDarkTheme = false;

    return ThemeData(
      fontFamily: 'DMSans-Regular',
      primarySwatch: const MaterialColor(
        0xff3A86FF,
        AppColors.colorScratch,
      ),
      primaryColor: backgroundColor,
      bottomAppBarColor: Colors.white.withOpacity(0.05),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white.withOpacity(0.05),
      ),
      focusColor: backgroundColor,
      bottomAppBarTheme: BottomAppBarTheme(color: Colors.white.withOpacity(0.05)),
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme ? const ColorScheme.dark() : const ColorScheme.light(),
          ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: isDarkTheme ? Colors.white : Colors.black,
      ),
    );
  }
}
