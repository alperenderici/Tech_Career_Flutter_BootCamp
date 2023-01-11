import 'package:bootcamp_project/data/entity/food.dart';
import 'package:bootcamp_project/ui/cubit/food_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yemek Detay"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Food id",
              ),
              Card(
                child: Text(
                  widget.food.food_id,
                ),
              ),
              Text(
                "Food name",
              ),
              Card(
                child: Text(
                  widget.food.food_name,
                ),
              ),
              Text(
                "Food image name",
              ),
              Card(
                child: Text(
                  widget.food.food_image_name,
                ),
              ),
              Text(
                "Food price",
              ),
              Card(
                child: Text(
                  widget.food.food_price,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // context.read<FoodDetailCubit>().update(
                  //       int.parse(widget.food.food_id),
                  //       tfPersonName.text,
                  //       tfPersonNum.text,
                  //     );
                },
                child: const Text("Sepete ekle"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
