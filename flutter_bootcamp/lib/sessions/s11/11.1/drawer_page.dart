import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/sessions/s10/10.3/page_one.dart';
import 'package:flutter_bootcamp/sessions/s10/10.3/page_second.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  int selectedIndex = 0;
  var pageList = [const FirstPage(), const SecondPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer"),
        backgroundColor: Colors.deepPurple,
      ),
      body: pageList[selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text(
                "Merhaba",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              decoration: BoxDecoration(color: Colors.deepPurple),
            ),
            ListTile(
              title: const Text("Bir"),
              leading: const Icon(
                Icons.looks_one_outlined,
              ),
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("İki"),
              leading: const Icon(
                Icons.looks_two_outlined,
              ),
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
