import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // test();
    counterController();
  }

  Future<void> test() async {
    //tanimlama
    var sp = await SharedPreferences.getInstance();

    //veri kaydi
    sp.setString("ad", "Ahmet");
    sp.setInt("yas", 23);
    sp.setDouble("boy", 1.78);
    sp.setBool("bekar", true);

    var friendsList = <String>[];
    friendsList.add("Eda");
    friendsList.add("Ali");

    sp.setStringList("liste", friendsList);

    //veri silme
    // sp.remove("ad");

    //Veri okuma
    String receivedName = sp.getString("ad") ?? "isim yok";
    int receivedAge = sp.getInt("yas") ?? 0;
    double receivedBoy = sp.getDouble("boy") ?? 0.0;
    bool receivedBekar = sp.getBool("bekar") ?? false;
    var receivedList = sp.getStringList("liste") ?? <String>[];

    print("Gelen ad: $receivedName");
    print("Gelen yas: $receivedAge");
    print("Gelen boy: $receivedBoy");
    print("Gelen bekar: $receivedBekar");
    for (var i in friendsList) {
      print("Arkadas: $i");
    }
  }

  int counter = 0;
  Future<void> counterController() async {
    var sp = await SharedPreferences.getInstance();
    counter = sp.getInt("counter") ?? 0;
    setState(() {
      counter += 1;
    });
    sp.setInt("counter", counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preferences"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              counter.toString(),
              style: TextStyle(fontSize: 100),
            ),
          ],
        ),
      ),
    );
  }
}
