import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/sessions/s7/game_screen.dart';
import 'package:flutter_bootcamp/sessions/s7/people.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  int counter = 0;
  bool controller = false;

  @override
  void initState() {
    super.initState();
    print("initState() calisti");
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive) {
      print("inactive working");
    }
    if (state == AppLifecycleState.paused) {
      print("paused working");
    }
    if (state == AppLifecycleState.resumed) {
      print("resumed working");
    }
    if (state == AppLifecycleState.detached) {
      print("detached working");
    }
  }

  Future<int> sum(int num, int num2) async {
    int sum = num + num2;
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    print("build() is working");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Counter : $counter",
              style: const TextStyle(fontSize: 36),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter += 1; //sayac = sayac + 1;
                });
              },
              child: const Text("Press"),
            ),
            ElevatedButton(
              onPressed: () {
                var people = People(
                    name: "Mehmet", age: 23, height: 1.92, single: false);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameScreen(
                      people: people,
                    ),
                  ),
                ).then((value) {
                  print("Back to homepage");
                });
              },
              child: const Text("Start"),
            ),
            Visibility(
              //True is visible / False is not
              visible: controller,
              child: const Text("Hello"),
            ),
            Text(
              controller ? "Hello" : "X",
              style: TextStyle(
                color: controller ? Colors.blue : Colors.red,
              ),
            ), //True is Hello / False is X
            (() {
              if (controller) {
                return const Text(
                  "Hello",
                  style: TextStyle(color: Colors.blue),
                );
              } else {
                return const Text(
                  "Hello",
                  style: TextStyle(color: Colors.red),
                );
              }
            }()),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  controller = true;
                });
              },
              child: const Text("Case 1 (True)"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  controller = false;
                });
              },
              child: const Text("Case 2 (False)"),
            ),
            FutureBuilder<int>(
              future: sum(10, 20),
              builder: ((context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("Error occured");
                }
                if (snapshot.hasData) {
                  return Text("Result : ${snapshot.data}");
                } else {
                  return const Text("No result");
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
