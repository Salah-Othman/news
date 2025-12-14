import 'package:flutter/material.dart';
import 'package:newst/core/theme/light_color.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(),

  primaryColor: LightColor.primaryColor,
  scaffoldBackgroundColor: LightColor.backgroundColor,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: LightColor.primaryColor,
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: LightColor.primaryColor,
      foregroundColor: Color.fromRGBO(255, 255, 255, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(6)),
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color.fromRGBO(255, 252, 252, 1)),
    ),
  ),
  inputDecorationTheme: InputDecorationThemeData(
    border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.zero),
    fillColor: Color.fromRGBO(255, 255, 255, 1),
    filled: true,
    hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color.fromRGBO(54, 54, 54, 1)),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: LightColor.backgroundColor,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: LightColor.primaryColor,
    unselectedItemColor: Color.fromRGBO(54, 54, 54, 1),
    showUnselectedLabels: true,
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.white),
);
