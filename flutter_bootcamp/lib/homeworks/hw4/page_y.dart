import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/homeworks/hw4/homepage.dart';

class PageY extends StatelessWidget {
  const PageY({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page Y"),
        leading: IconButton(
          onPressed: () {
            // Navigator.of(context).popUntil((route) => route.isFirst);
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => HomePage()));
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) => const HomePage())));
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Container(),
      ),
    );
  }
}
