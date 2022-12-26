import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/sessions/s10/10.1/foods.dart';
import 'package:flutter_bootcamp/sessions/s10/10.1/foods_detail_page.dart';

class FoodsPage extends StatefulWidget {
  const FoodsPage({super.key});

  @override
  State<FoodsPage> createState() => _FoodsPageState();
}

class _FoodsPageState extends State<FoodsPage> {
  Future<List<Foods>> fetchFoods() async {
    var foodsList = <Foods>[];
    var f1 = Foods(id: 1, name: "Köfte", imageName: "kofte.png", price: 50.0);
    var f2 = Foods(id: 2, name: "Ayran", imageName: "ayran.png", price: 10.0);
    var f3 = Foods(id: 3, name: "Fanta", imageName: "fanta.png", price: 12.0);
    var f4 =
        Foods(id: 4, name: "Makarna", imageName: "makarna.png", price: 48.0);
    var f5 =
        Foods(id: 5, name: "Kadayıf", imageName: "kadayif.png", price: 35.0);
    var f6 =
        Foods(id: 6, name: "Baklava", imageName: "baklava.png", price: 60.0);
    foodsList.add(f1);
    foodsList.add(f2);
    foodsList.add(f3);
    foodsList.add(f4);
    foodsList.add(f5);
    foodsList.add(f6);

    return foodsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Foods"),
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder<List<Foods>>(
        future: fetchFoods(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var foodsList = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                var food = foodsList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodsDetailPage(food: food),
                      ),
                    );
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                          child: Image.asset(
                              "assets/images/food/${food.imageName}"),
                          width: 150,
                          height: 150,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food.name,
                              style: const TextStyle(fontSize: 25),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Text(
                              "${food.price} ₺",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.blue),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                );
              },
              itemCount: foodsList!.length,
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
