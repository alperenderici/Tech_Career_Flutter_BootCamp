import 'package:bootcamp_project/data/entity/food.dart';
import 'package:bootcamp_project/ui/cubit/basket_cubit.dart';
import 'package:bootcamp_project/ui/cubit/homepage_cubit.dart';
import 'package:bootcamp_project/ui/screens/basket_page.dart';
import 'package:bootcamp_project/ui/screens/food_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool isSearch = false;
  bool isFav = false;
  List<Food> favs = [];
  // late AnimationController basketAnimation;
  late AnimationController addBasketAnimation;
  bool isDescending = false;
  bool isAscending = false;
  bool isAlphabetic = false;
  String user_name = "Alperen_Derici";

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().showAllFood();
    // basketAnimation = AnimationController(
    //   vsync: this,
    //   // duration: const Duration(seconds: 3),
    // );
    addBasketAnimation = AnimationController(
      vsync: this,
    );
    addBasketAnimation.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        addBasketAnimation.reset();
      }
    });
  }

  void showAddedIcon() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) {
          return Dialog(
            child: Lottie.asset(
              "assets/icons/110118-add-to-cart.json",
              controller: addBasketAnimation,
              repeat: false,
              onLoaded: (p0) {
                addBasketAnimation.duration = p0.duration;
                addBasketAnimation.forward();
              },
            ),
          );
        }));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // basketAnimation.dispose();
    addBasketAnimation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch
            ? TextField(
                decoration: const InputDecoration(hintText: "Ara"),
                onChanged: (searchResult) {
                  // context.read<HomePageCubit>().search(searchResult);
                },
              )
            : const Text("Yemekler"),
        actions: [
          isSearch
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = false;
                      context.read<HomePageCubit>().showAllFood();
                    });
                  },
                  icon: const Icon(Icons.cancel),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = true;
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
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
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list),
            onSelected: (String result) {
              switch (result) {
                case 'Default':
                  print('Default clicked');
                  break;
                case 'Ascending':
                  List<Food> sortAscending(List<Food> foodList) {
                    final sortedList = foodList
                      ..sort((food1, food2) {
                        return food1.food_price.compareTo(
                          food2.food_price,
                        );
                      });
                    return sortedList;
                  }
                  break;
                case 'Descending':
                  List<Food> sortDescending(List<Food> foodList) {
                    final sortedList = foodList
                      ..sort((food1, food2) {
                        return food2.food_price.compareTo(
                          food1.food_price,
                        );
                      });
                    return sortedList;
                  }

                  break;
                case 'Alphabetic':
                  List<Food> sortAlphabetic(List<Food> foodList) {
                    final sortedList = foodList
                      ..sort((a, b) {
                        return a.food_name
                            .toLowerCase()
                            .compareTo(b.food_name.toLowerCase());
                      });
                    return sortedList;
                  }
                  break;
                default:
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Default',
                child: Text('Default'),
              ),
              const PopupMenuItem<String>(
                value: 'Ascending',
                child: Text('Ascending Price'),
              ),
              const PopupMenuItem<String>(
                value: 'Descending',
                child: Text('Descending Price'),
              ),
              const PopupMenuItem<String>(
                value: 'Alphabetic',
                child: Text('Alphabetic'),
              ),
            ],
          ),
        ],
      ),
      body: BlocBuilder<HomePageCubit, List<Food>>(
        builder: (context, foodList) {
          if (foodList.isNotEmpty) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: foodList.length,
              itemBuilder: ((context, index) {
                // var sortedList = sortDescending(foodList);
                var food = foodList[index];
                // var food = sortedList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => FoodDetailPage(
                              food: food,
                            )),
                      ),
                    ).then((value) {
                      context.read<HomePageCubit>().showAllFood();
                    });
                  },
                  child: Card(
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  favs.add(food);
                                  print("${food.food_name} added favs list");
                                  print(favs);
                                  isFav != isFav;
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.yellow,
                                child: isFav
                                    ? const Icon(Icons.favorite)
                                    : const Icon(Icons.favorite_border),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.yellow,
                                  child: IconButton(
                                    onPressed: () {
                                      showAddedIcon();
                                      context.read<BasketCubit>().addBasket(
                                          food.food_name,
                                          food.food_image_name,
                                          food.food_price.toString(),
                                          '1',
                                          user_name);
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.yellow,
                              child: Text("${food.food_price}₺"),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: SizedBox(
                                height: MediaQuery.of(context).size.width / 2.5,
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: Image.network(
                                    "http://kasimadalan.pe.hu/yemekler/resimler/${food.food_image_name}"),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("${food.food_name}"),
                                ],
                              ),
                            ),
                          ],
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
