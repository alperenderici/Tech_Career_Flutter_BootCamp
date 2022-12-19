import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/sessions/s7/people.dart';
import 'package:flutter_bootcamp/sessions/s7/result_screen.dart';

class GameScreen extends StatefulWidget {
  People people;

  GameScreen({
    Key? key,
    required this.people,
  }) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Future<bool> backButton(BuildContext context) async {
    print("navigation geri tuusu tiklandi");
    return true;
  }

  @override
  Widget build(BuildContext context) {
    var p = widget.people;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Screen"),
        leading: IconButton(
          onPressed: () {
            print("Appbar geri tusu tiklandi.");
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: WillPopScope(
        onWillPop: () => backButton(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${p.name}-${p.age}-${p.height}-${p.single}"),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const ResultScreen())));
                  },
                  child: const Text("Bitti"))
            ],
          ),
        ),
      ),
    );
  }
}
