import 'package:bootcamp_project/data/entity/basket_return.dart';
import 'package:bootcamp_project/data/entity/food_order.dart';
import 'package:bootcamp_project/ui/cubit/basket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage>
    with SingleTickerProviderStateMixin {
  late AnimationController deleteBasketAnimation;
  String user_name = "Alperen_Derici";

  @override
  void initState() {
    super.initState();
    context.read<BasketCubit>().showBasket();
    deleteBasketAnimation = AnimationController(
      vsync: this,
    );
    deleteBasketAnimation.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        deleteBasketAnimation.reset();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    deleteBasketAnimation.dispose();
  }

  void showDeleteIcon() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) {
        return Dialog(
          child: Lottie.asset(
            "assets/icons/117346-microinteractions-icon-09.json",
            controller: deleteBasketAnimation,
            repeat: false,
            onLoaded: (p0) {
              deleteBasketAnimation.duration = const Duration(seconds: 1);
              deleteBasketAnimation.forward();
            },
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Sepet",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
              Text(
                "Tutar: ${context.read<BasketCubit>().showSum()}₺",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<BasketCubit, BasketReturn>(
        builder: (context, foodList) {
          List<FoodOrder> basketFoodList = foodList.food_order;
          if (foodList.success != 0 && basketFoodList.isNotEmpty) {
            // List distinctList = basketFoodList.toSet().toList();
            // for (int i = 0; i < basketFoodList.length; i++) {
            //   basketFoodList.remove(foodList.food_order);
            // }
            return ListView.builder(
              itemCount: basketFoodList.length,
              itemBuilder: ((context, index) {
                var food = basketFoodList[index];
                var counter = basketFoodList;
                var counts = counter.fold<Map<String, int>>({}, (map, element) {
                  map[element.food_name] = (map[element.food_name] ?? 0) + 1;
                  return map;
                });
                Map<String, dynamic> count = {};
                basketFoodList.forEach(
                    (i) => count[food.food_name] = (count[i] ?? 0) + 1);

                return Dismissible(
                  key: Key(food.food_name),
                  onDismissed: (direction) {
                    showDeleteIcon();
                    context.read<BasketCubit>().deleteBasket(
                          food.food_order_id,
                          user_name,
                        );
                  },
                  background: Container(
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text(
                            "Remove",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  child: Card(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width / 4,
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    child: Image.network(
                                        "http://kasimadalan.pe.hu/yemekler/resimler/${food.food_image_name}"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(food.food_name),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    child: IconButton(
                                      onPressed: () {
                                        if (counts.entries.isNotEmpty) {
                                          showDeleteIcon();
                                          context
                                              .read<BasketCubit>()
                                              .deleteBasket(
                                                food.food_order_id,
                                                user_name,
                                              );
                                        } else {}
                                      },
                                      icon: Card(
                                          color: Colors.blueGrey.shade100,
                                          child: const Icon(Icons.remove)),
                                    ),
                                  ),
                                  // Text(
                                  //   "${count[food.food_name].toString()}",
                                  //   // "${foodList.food_order.addAll(count[food.food_name])}",
                                  //   style:
                                  //       Theme.of(context).textTheme.bodyMedium,
                                  // ),
                                  SizedBox(
                                    child: IconButton(
                                      onPressed: () {
                                        context.read<BasketCubit>().addBasket(
                                            food.food_name,
                                            food.food_image_name,
                                            food.food_price.toString(),
                                            '1',
                                            user_name);
                                      },
                                      icon: const Card(
                                          color: Colors.green,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                  Text("${food.food_price}₺"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          } else if (basketFoodList.isEmpty) {
            return const Center(
              child: Text(
                "Sepetiniz boş gözükmekte",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, //*?check
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: null,
              onPressed: () {},
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person_outline_rounded,
                  color: Colors.orange,
                ),
              ),
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const BasketPage(),
                //   ),
                // ).then((value) {
                //   context.read<HomePageCubit>().showAllFood();
                // });
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.payment),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
