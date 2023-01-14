import 'package:bootcamp_project/data/entity/food.dart';
import 'package:bootcamp_project/data/entity/food_order.dart';
import 'package:bootcamp_project/ui/cubit/basket_cubit.dart';
import 'package:bootcamp_project/ui/cubit/homepage_cubit.dart';
import 'package:bootcamp_project/ui/screens/food_detail_page.dart';
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
  int sum = 0;

  @override
  void initState() {
    super.initState();
    context.read<BasketCubit>().showBasket(user_name);
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
              // deleteBasketAnimation.duration = p0.duration;
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
              const Text("Basket"),
              Text("Tutar: ${sum}₺"),
            ],
          ),
        ),
      ),
      body: BlocBuilder<BasketCubit, List<FoodOrder>>(
        builder: (context, foodList) {
          if (foodList.isNotEmpty) {
            return ListView.builder(
              itemCount: foodList.length,
              itemBuilder: ((context, index) {
                var food = foodList[index];
                sum += food.food_price;
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: ((context) => FoodDetailPage(food: food,)),
                    //   ),
                    // ).then((value) {
                    //   context.read<BasketCubit>().showBasket(user_name);
                    // });
                  },
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text("${food.food_name} - ${food.food_price}₺"),
                        ),
                        IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("${food.food_name} silinsin mi?"),
                                  action: SnackBarAction(
                                      label: "Evet",
                                      onPressed: () {
                                        showDeleteIcon();
                                        context
                                            .read<BasketCubit>()
                                            .deleteBasket(
                                              food.food_order_id,
                                              user_name,
                                            );
                                      }),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.delete_outline_rounded,
                              color: Colors.red,
                            )
                            // Lottie.asset(
                            //   "assets/icons/117346-microinteractions-icon-09.json",
                            //   controller: deleteBasketAnimation,
                            //   repeat: false,
                            //   onLoaded: (p0) {
                            //     deleteBasketAnimation.duration = p0.duration;
                            //     deleteBasketAnimation.forward();
                            //   },
                            // ),
                            ),
                      ],
                    ),
                  ),
                );
              }),
            );
          } else {
            return const Center();
          }
        },
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
        child: const CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.payment),
        ),
      ),
    );
  }
}
