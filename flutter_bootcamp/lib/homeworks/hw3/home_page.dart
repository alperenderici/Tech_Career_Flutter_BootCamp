import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/homeworks/hw3/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 1;
  double newPrice = 40.50;

  Product product = Product(
    name: "Alovera",
    price: 40.50,
    sunglight: "27-35",
    huminidity: "65",
    description:
        "Aloe vera is a succulent plant species of the genus Aloe. It is widely distributed, and is considered an invasive species in many world regions.",
    star: 4.9,
    isFav: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          style: Theme.of(context).textButtonTheme.style,
          onPressed: () {},
          icon: const Icon(Icons.chevron_left_rounded),
        ),
        actions: [
          IconButton(
            color: Colors.red,
            onPressed: () {
              setState(() {
                product.isFav = !product.isFav;
              });
            },
            icon: product.isFav
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Image.asset("assets/images/aloe-vera.png"),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  product.name,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  "${product.star}",
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 216, 201, 62),
                                    fontSize: 18,
                                  ),
                                ),
                                TextButton(
                                  style:
                                      Theme.of(context).textButtonTheme.style,
                                  onPressed: () {},
                                  child: const Text(
                                    "(420 Reviews)",
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "\$$newPrice",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (counter > 0) {
                                          counter -= 1;
                                          newPrice = counter * product.price;
                                        } else {}
                                      });
                                    },
                                    icon: Card(
                                        color: Colors.blueGrey.shade100,
                                        child: const Icon(Icons.remove)),
                                  ),
                                ),
                                Text(
                                  "$counter",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        counter += 1;
                                        newPrice = counter * product.price;
                                      });
                                    },
                                    icon: const Card(
                                        color: Colors.green,
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.wb_sunny_outlined),
                            ),
                            Column(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Text(
                                    "Sunlight",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "${product.sunglight}%",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.water_drop_outlined),
                            ),
                            Column(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Text(
                                    "Humidity",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "${product.huminidity}%",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "About",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      product.description,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width / 1,
                      child: ElevatedButton(
                        style: Theme.of(context).elevatedButtonTheme.style,
                        onPressed: () {},
                        child: Text(
                          "BUY NOW",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
