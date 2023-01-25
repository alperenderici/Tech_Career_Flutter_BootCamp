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
  String user_name = "Alperen_Derici";
  bool isSearch = false;
  bool isFav = false;
  bool isFavSelected = false;
  List<Food> favs = [];
  List<Food> ulist = [];
  // late AnimationController basketAnimation;
  late AnimationController addBasketAnimation;
  bool isDescending = false;
  bool isAscending = false;
  bool isAlphabetic = false;
  bool isDefault = true;

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().showAllFood();
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
                  context.read<HomePageCubit>().search(searchResult);
                },
              )
            : const Text(
                "Yemekler",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
        actions: [
          isSearch
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = false;
                    });
                  },
                  icon: const Icon(Icons.cancel),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = true;
                      context.read<HomePageCubit>().showAllFood();
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
          isFavSelected
              ? IconButton(
                  //isFav selected true
                  onPressed: () {
                    // isFav = false;
                    setState(() {
                      isFavSelected = false;
                      isFav = false;
                    });
                  },
                  icon: const Icon(Icons.favorite),
                )
              : IconButton(
                  //isFav selected false
                  onPressed: () {
                    // isFav = true;
                    setState(() {
                      isFavSelected = true;
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
                  setState(() {
                    isDefault = true;
                    isAscending = false;
                    isDescending = false;
                    isAlphabetic = false;
                  });
                  break;
                case 'Ascending':
                  setState(() {
                    isAscending = true;
                    isDefault = false;
                    isDescending = false;
                    isAlphabetic = false;
                  });
                  break;
                case 'Descending':
                  setState(() {
                    isDescending = true;
                    isAscending = false;
                    isDefault = false;
                    isAlphabetic = false;
                  });
                  break;
                case 'Alphabetic':
                  setState(() {
                    isAlphabetic = true;
                    isAscending = false;
                    isDescending = false;
                    isDefault = false;
                  });
                  break;
                default:
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Default',
                child: Text('Normal'),
              ),
              const PopupMenuItem<String>(
                value: 'Ascending',
                child: Text('Artan Fiyat'),
              ),
              const PopupMenuItem<String>(
                value: 'Descending',
                child: Text('Azalan Fiyat'),
              ),
              const PopupMenuItem<String>(
                value: 'Alphabetic',
                child: Text('Alfabetik'),
              ),
            ],
          ),
        ],
      ),
      body: BlocBuilder<HomePageCubit, List<Food>>(
        builder: (context, foodList) {
          if (foodList.isNotEmpty) {
            if (isFavSelected == false) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: foodList.length,
                itemBuilder: ((context, index) {
                  if (isDefault == true) {
                    var food = foodList[index];
                    return _component(context, food, foodList, index);
                  } else if (isAscending == true) {
                    var sortedList = sortAscending(foodList);
                    var food = sortedList[index];
                    return _component(context, food, foodList, index);
                  } else if (isDescending == true) {
                    var sortedList = sortDescending(foodList);
                    var food = sortedList[index];
                    return _component(context, food, foodList, index);
                  } else if (isAlphabetic == true) {
                    var sortedList = sortAlphabetic(foodList);
                    var food = sortedList[index];
                    return _component(context, food, foodList, index);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
              );
            } else if (isFavSelected == true && favs.isNotEmpty) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: favs.length,
                itemBuilder: ((context, index) {
                  var food = favs[index];
                  // return _component(context, food, foodList, index);
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
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, right: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    isFav = !isFav;
                                    favs.remove(foodList[index]);
                                  },
                                  child: isFav
                                      ? const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                      : const Icon(
                                          Icons.favorite_border,
                                          color: Colors.red,
                                        ),
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
                                  Card(
                                    shape: const CircleBorder(),
                                    color: Colors.green,
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
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Card(
                                shape: const CircleBorder(),
                                color: Colors.green,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${food.food_price}₺",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Expanded(
                                flex: 4,
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width / 2.5,
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: Image.network(
                                      "http://kasimadalan.pe.hu/yemekler/resimler/${food.food_image_name}"),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      food.food_name,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                    ),
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
              return const Center(
                child: Text("Favoriniz bulunmamaktadır."),
              );
            }
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
          ],
        ),
      ),
    );
  }

  GestureDetector _component(
      BuildContext context, Food food, List<Food> foodList, int index) {
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, right: 5),
                      child: GestureDetector(
                        onTap: () {
                          isFav = !isFav;
                          if (isFav = true) {
                            favs.add(foodList[index]);
                          } else if (isFav = false) {
                            favs.remove(foodList[index]);
                          }
                          for (int i = 0; i < favs.length; i++) {}
                        },
                        child: isFav
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        showAddedIcon();
                        context.read<BasketCubit>().addBasket(
                            food.food_name,
                            food.food_image_name,
                            food.food_price.toString(),
                            '1',
                            user_name);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.green,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  shape: const CircleBorder(),
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${food.food_price}₺",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                      // style: const TextStyle(color: Colors.white),
                    ),
                  ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          food.food_name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<Food> sortAlphabetic(List<Food> foodList) {
  final sortedList = foodList
    ..sort((a, b) {
      return a.food_name.toLowerCase().compareTo(b.food_name.toLowerCase());
    });
  return sortedList;
}

List<Food> sortDescending(List<Food> foodList) {
  final sortDescendingList = foodList
    ..sort((food1, food2) {
      return food2.food_price.compareTo(
        food1.food_price,
      );
    });
  return sortDescendingList;
}

List<Food> sortAscending(List<Food> foodList) {
  final sortAscendingList = foodList
    ..sort((food1, food2) {
      return food1.food_price.compareTo(
        food2.food_price,
      );
    });
  return sortAscendingList;
}
