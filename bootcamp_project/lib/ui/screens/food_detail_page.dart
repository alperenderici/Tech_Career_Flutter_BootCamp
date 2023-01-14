import 'package:bootcamp_project/data/entity/food.dart';
import 'package:bootcamp_project/ui/cubit/basket_cubit.dart';
import 'package:bootcamp_project/ui/cubit/food_detail_cubit.dart';
import 'package:bootcamp_project/ui/cubit/homepage_cubit.dart';
import 'package:bootcamp_project/ui/screens/basket_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class FoodDetailPage extends StatefulWidget {
  Food food;

  FoodDetailPage({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  String user_name = "Alperen_Derici";
  int counter = 0;
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.food.food_name),
        actions: [
          isFav
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isFav = false;
                    });
                  },
                  icon: const Icon(Icons.favorite),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isFav = true;
                    });
                  },
                  icon: const Icon(Icons.favorite_border),
                ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Image.network(
                    "http://kasimadalan.pe.hu/yemekler/resimler/${widget.food.food_image_name}"),
              ),
              Card(
                color: Colors.orange,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${widget.food.food_price.toString()}₺",
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (counter > 0) {
                              counter -= 1;
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
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<BasketCubit>().addBasket(
                          widget.food.food_name,
                          widget.food.food_image_name,
                          widget.food.food_price.toString(),
                          counter.toString(),
                          user_name);
                    },
                    child: const Text("Sepete ekle"),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BasketPage(),
            ),
          ).then((value) {
            context.read<HomePageCubit>().showAllFood();
          });
        },
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: LottieBuilder.asset(
            "assets/icons/92032-basket-pack.json",
            // controller: basketAnimation,
          ),
        ),
      ),
    );
  }
}
