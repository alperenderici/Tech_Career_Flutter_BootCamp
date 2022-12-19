import 'package:flutter/material.dart';

var button1Color = const Color.fromRGBO(0, 124, 80, 1); //elevated + icon button
var button2Color = const Color.fromRGBO(232, 246, 234, 1); //- icon button
var button3Color = const Color.fromRGBO(37, 37, 37, 1); //leading-textbutton
var text1Color = const Color.fromRGBO(0, 0, 0, 1); //normal text
var text2Color =
    const Color.fromRGBO(146, 146, 146, 1); //description-sunlight-humadity

ThemeData themeData() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: button3Color),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: button1Color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: button3Color,
      ),
    ),
    textTheme: TextTheme(
      //Elevated button text
      titleLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: button2Color,
      ),
      //Product name-about
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 23,
        color: text1Color,
      ),
      //Product - sunlight+humidity value
      titleSmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: text1Color,
      ),
      //Product price
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 23,
        color: text1Color,
      ),
      //Product description-sunlight-humidity
      bodySmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 15,
        color: text2Color,
      ),
    ),
  );
}
