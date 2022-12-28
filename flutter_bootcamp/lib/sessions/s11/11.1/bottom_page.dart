import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/sessions/s10/10.3/page_one.dart';
import 'package:flutter_bootcamp/sessions/s10/10.3/page_second.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int selectedValue = 0;
  var pageList = [const FirstPage(), const SecondPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Navigation"),
        backgroundColor: Colors.deepPurple,
      ),
      body: pageList[selectedValue],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.looks_one_outlined), label: "Bir"),
          BottomNavigationBarItem(
              icon: Icon(Icons.looks_two_outlined), label: "İki"),
        ],
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white38,
        currentIndex: selectedValue,
        onTap: (value) {
          setState(() {
            selectedValue = value;
          });
        },
      ),
    );
  }
}
