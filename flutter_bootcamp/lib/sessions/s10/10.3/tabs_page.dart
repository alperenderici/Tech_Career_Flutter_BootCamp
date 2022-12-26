import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/sessions/s10/10.3/page_one.dart';
import 'package:flutter_bootcamp/sessions/s10/10.3/page_second.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tabs"),
          backgroundColor: Colors.deepPurple,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Bir",
                icon: Icon(Icons.looks_one_outlined),
              ),
              Tab(
                text: "Iki",
                icon: Icon(Icons.looks_two_outlined),
              ),
            ],
            indicatorColor: Colors.pink,
            labelColor: Colors.orange,
          ),
        ),
        body: const TabBarView(
          children: [
            FirstPage(),
            SecondPage(),
          ],
        ),
      ),
    );
  }
}
