import 'package:flutter/material.dart';

ThemeData hmhasMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Color.fromRGBO(4, 4, 32, 1),
    primary: const Color.fromRGBO(250, 252, 255, 1),
    secondary: const Color.fromRGBO(253, 160, 53, 1),
    inversePrimary: Colors.grey.shade700,
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontFamily: 'Helvetica',
    ),
  ),
);