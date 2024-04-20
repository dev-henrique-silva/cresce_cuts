import 'package:flutter/material.dart';

ThemeData customTheme = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Colors.white,
    secondary: Color(0xff007FBA),
    tertiary: Color(0xffE1E1E1),
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
  ),
  useMaterial3: true,
);
