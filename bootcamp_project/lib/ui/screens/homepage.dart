import 'package:bootcamp_project/data/entity/food.dart';
import 'package:bootcamp_project/ui/cubit/homepage_cubit.dart';
import 'package:bootcamp_project/ui/screens/food_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch = false;

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().showAllFood();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch
            ? TextField(
                decoration: const InputDecoration(hintText: "Ara"),
                onChanged: (searchResult) {
                  print("Yemek ara: $searchResult");
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
                  icon: const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<HomePageCubit, List<Food>>(
        builder: (context, foodList) {
          if (foodList.isNotEmpty) {
            return ListView.builder(
              itemCount: foodList.length,
              itemBuilder: ((context, index) {
                var food = foodList[index]; //key code!
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
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${food.food_name} - ${food.food_price}"),
                        ),
                        Spacer(),
                        // IconButton(
                        //   onPressed: () {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //       SnackBar(
                        //         content:
                        //             Text("${person.person_name} silinsin mi?"),
                        //         action: SnackBarAction(
                        //             label: "Evet",
                        //             onPressed: () {
                        //               print("Kisi sil: ${person.person_id}");
                        //               context
                        //                   .read<HomePageCubit>()
                        //                   .delete(int.parse(person.person_id));
                        //             }),
                        //       ),
                        //     );
                        //   },
                        //   icon: const Icon(
                        //     Icons.delete_outline,
                        //     color: Colors.black54,
                        //   ),
                        // ),
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
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const PersonRecordPage(),
          //   ),
          // ).then((value) {
          //   context.read<HomePageCubit>().showAllFood();
          // });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
