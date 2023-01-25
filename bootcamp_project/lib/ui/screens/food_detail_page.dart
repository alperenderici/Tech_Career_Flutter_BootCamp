import 'package:bootcamp_project/data/entity/food.dart';
import 'package:bootcamp_project/ui/cubit/basket_cubit.dart';
import 'package:bootcamp_project/ui/cubit/homepage_cubit.dart';
import 'package:bootcamp_project/ui/screens/basket_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class FoodDetailPage extends StatefulWidget {
  Food food;

  FoodDetailPage({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage>
    with SingleTickerProviderStateMixin {
  String user_name = "Alperen_Derici";
  int counter = 1;
  bool isFav = false;
  late AnimationController addBasketAnimation;
  var text = lorem(paragraphs: 1, words: 15);

  @override
  void initState() {
    super.initState();
    context.read<FoodDetailPage>().food;
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
    addBasketAnimation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.food.food_name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 30,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                  "http://kasimadalan.pe.hu/yemekler/resimler/${widget.food.food_image_name}"),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 5,
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      text,
                      style: const TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 5,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (counter > 0) {
                              counter -= 1;
                            } else {}
                          });
                        },
                        icon: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 10,
                                color: Colors.green.shade200,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            // color: Colors.blueGrey.shade100,
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Icon(Icons.remove),
                            )),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 5,
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "$counter",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 5,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            counter += 1;
                          });
                        },
                        icon: Card(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 10,
                                color: Colors.green,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            // color: Colors.green,
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 10,
                      color: Colors.green.shade200,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Fiyat: ${counter * widget.food.food_price}₺",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width / 1.5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 10,
                        color: Colors.green.shade200,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    for (int i = 0; i < counter; i++) {
                      showAddedIcon();
                      context.read<BasketCubit>().addBasket(
                          widget.food.food_name,
                          widget.food.food_image_name,
                          widget.food.food_price.toString(),
                          counter.toString(),
                          user_name);
                    }
                  },
                  child: const Text(
                    "Sepete ekle",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
}
