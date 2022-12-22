import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/homeworks/hw4/homepage.dart';

// import 'package:flutter_bootcamp/homeworks/hw3/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // theme: themeData(),
      home: HomePage(),
    );
  }
}
