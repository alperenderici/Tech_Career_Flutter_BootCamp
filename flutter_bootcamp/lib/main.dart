import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/sessions/s8/homepage.dart';

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
