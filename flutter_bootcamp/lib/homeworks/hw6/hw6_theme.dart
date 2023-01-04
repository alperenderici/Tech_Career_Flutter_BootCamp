import 'package:flutter/material.dart';

ThemeData hw6ThemeData() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      // backgroundColor: Colors.black,
      textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      fontFamily: "Gotham",
      // textTheme: const TextTheme(),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ElevatedButton.styleFrom(
      //     textStyle: const TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
      //   ),
      // ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
      ),
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //   backgroundColor: Colors.black45,
      // ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black45,
        selectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.white),
        unselectedIconTheme: IconThemeData(color: Colors.white30),
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.white30),
      ),
      cardTheme: CardTheme(
        color: Colors.grey[850],
      ));
}
