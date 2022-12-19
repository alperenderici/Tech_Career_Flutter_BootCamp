import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/homeworks/hw4/page_a.dart';
import 'package:flutter_bootcamp/homeworks/hw4/page_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => PageA()));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => const PageA())));
              },
              child: const Text("Route > A"),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => PageX()));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => const PageX())));
              },
              child: const Text("Route > B"),
            ),
          ],
        ),
      ),
    );
  }
}
