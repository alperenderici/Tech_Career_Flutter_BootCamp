import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "İki",
        style: TextStyle(
          fontSize: 30,
          color: Colors.black45,
        ),
      ),
    );
  }
}
