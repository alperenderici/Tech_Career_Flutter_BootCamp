import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/homeworks/hw4/page_y.dart';

class PageX extends StatelessWidget {
  const PageX({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page X"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => PageY()));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => const PageY())));
              },
              child: const Text("Route > Y"),
            ),
          ],
        ),
      ),
    );
  }
}
