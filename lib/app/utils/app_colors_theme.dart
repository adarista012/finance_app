import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColorsTheme {
  static const MaterialColor kPink = MaterialColor(
    0xFFF48FB1,
    <int, Color>{
      50: Color(0xFFFCE4EC), //10%
      100: Color(0xFFF8BBD0), //20%
      200: Color(0xFFF48FB1), //30%
      300: Color(0xFFF48FB1), //40%
      400: Color(0xFFF48FB1), //50%
      500: Color(0xFFF48FB1), //60%
      600: Color(0xFFD81B60), //70%
      700: Color(0xFFC2185B), //80%
      800: Color(0xFFAD1457), //90%
      900: Color(0xFF880E4F), //100%
    },
  );

  static ThemeData kThemeLight = ThemeData(
    primarySwatch: AppColorsTheme.kPink,
    primaryColor: AppColorsTheme.kPink,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: AppColorsTheme.kPink,
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
    ),
  );
  static Color white = Colors.white;
  static Color grey = Colors.grey.shade300;
  static Color red = Colors.red;
} // yo
