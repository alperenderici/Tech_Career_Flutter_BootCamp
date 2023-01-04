import 'package:flutter/material.dart';

ThemeData hw6ThemeData() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      // backgroundColor: Colors.black,
      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      // textTheme: const TextTheme(),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ElevatedButton.styleFrom(
      //     textStyle: const TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
      //   ),
      // ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black54,
        elevation: 0,
        selectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.white),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
      ),
      cardTheme: CardTheme(
        color: Colors.grey[850],
      ));
}
