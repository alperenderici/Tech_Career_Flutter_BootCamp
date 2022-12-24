import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
      textTheme: const TextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
        ),
      ),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
      ));
}
