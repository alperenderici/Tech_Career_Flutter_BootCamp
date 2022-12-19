import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String receivedData = "";
  var tfController = TextEditingController();
  // String imageName = "image1.png";
  String imageName = "baklava.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets Usage"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(receivedData),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                controller: tfController,
                decoration: const InputDecoration(hintText: "Data"),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  receivedData = tfController.text;
                });
              },
              child: const Text("Try"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      imageName = "kofte.png";
                    });
                  },
                  child: const Text("Image 1"),
                ),
                // Image.asset("assets/images/$imageName"),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: Image.network(
                    "http://kasimadalan.pe.hu/yemekler/resimler/$imageName",
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      imageName = "ayran.png";
                    });
                  },
                  child: const Text("Image 2"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
