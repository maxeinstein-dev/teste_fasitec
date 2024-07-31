import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: const Color(0xFF041357),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Colors.grey.shade700),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      minimumSize: WidgetStateProperty.all(const Size(150, 50)),
      padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 15, horizontal: 25)),
      textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 20)),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF041357),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
);
