import 'package:flutter/material.dart';

ThemeData customTheme = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Colors.white,
    secondary: Color(0xff007FBA),
    tertiary: Color(0xffE1E1E1),
    tertiaryContainer: Color(0xFFD4D4D4),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: Color(0xff403E43),
    ),
    titleMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Color(0xff455A64),
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Color(0xff565656),
    ),
    labelLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    displayLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      color: Color.fromARGB(255, 189, 189, 189),
    ),
  ),
  useMaterial3: true,
);
