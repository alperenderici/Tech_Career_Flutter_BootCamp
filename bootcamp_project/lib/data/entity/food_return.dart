import 'package:bootcamp_project/data/entity/food.dart';

class FoodReturn {
  List<Food> food;
  int success;

  FoodReturn({
    required this.food,
    required this.success,
  });

  factory FoodReturn.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["yemekler"] as List;
    var food = jsonArray.map((e) => Food.fromJson(e)).toList();
    return FoodReturn(
      food: food,
      success: json["success"] as int,
    );
  }
}
