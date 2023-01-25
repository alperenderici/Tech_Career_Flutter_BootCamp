import 'package:flutter/material.dart';

ThemeData projectThemeData() => ThemeData(
    appBarTheme: const AppBarTheme(
      color: Colors.green,
    ),
    // cardColor: Colors.orange[200],
    textTheme: TextTheme(
        // headline1: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        // displayMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
    ));
