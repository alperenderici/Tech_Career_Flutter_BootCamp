import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/sessions/s10/10.1/foods_page.dart';

import 'package:flutter_bootcamp/homeworks/hw5/calculator.dart';
import 'package:flutter_bootcamp/sessions/s10/10.2/movies_page.dart';
import 'package:flutter_bootcamp/sessions/s10/10.3/tabs_page.dart';

import 'homeworks/hw5/hw5_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // theme: themeData(),
      // home: Calculator(),
      home: TabsPage(),
    );
  }
}
