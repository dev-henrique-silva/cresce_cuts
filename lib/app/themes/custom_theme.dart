import 'package:flutter/material.dart';

ThemeData customTheme = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Colors.white,
    secondary: Color(0xff007FBA),
    onSecondary: Color.fromARGB(179, 0, 127, 186),
    tertiary: Color(0xffE1E1E1),
    onTertiary: Color(0xffDEDEDE),
    tertiaryContainer: Color(0xFFD4D4D4),
    onTertiaryContainer: Color(0xFFF0F0F0),
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
    displayLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Color(0xff403E43),
      decoration: TextDecoration.lineThrough,
    ),
    displaySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Color(0xff565656),
    ),
    headlineLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      color: Color.fromARGB(255, 189, 189, 189),
    ),
    headlineMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
  ),
  useMaterial3: true,
);
