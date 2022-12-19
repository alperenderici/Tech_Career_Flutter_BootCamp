import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/homeworks/hw4/page_b.dart';

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page A"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => PageB()));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => const PageB())));
              },
              child: const Text("Route > B"),
            ),
          ],
        ),
      ),
    );
  }
}
