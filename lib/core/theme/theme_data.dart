import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(),
  primaryColor: Color.fromRGBO(197, 48, 48, 1),
  scaffoldBackgroundColor: Color.fromRGBO(240, 240, 240, 1),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Color.fromRGBO(197, 48, 48, 1),
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromRGBO(197, 48, 48, 1),
      foregroundColor: Color.fromRGBO(255, 255, 255, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(6),
      ),
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(255, 252, 252, 1),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationThemeData(
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.zero,
    ),
    fillColor: Color.fromRGBO(255, 255, 255, 1),
    filled: true,
    hintStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(54, 54, 54, 1),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color.fromRGBO(245, 245, 245, 1),
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Color.fromRGBO(197, 48, 48, 1),
    unselectedItemColor: Color.fromRGBO(54, 54, 54, 1),
    showUnselectedLabels: true,
  ),
);
