import 'package:bootcamp_project/data/entity/food_order.dart';

class BasketReturn {
  List<FoodOrder> food_order;
  int success;

  BasketReturn({
    required this.food_order,
    required this.success,
  });

  factory BasketReturn.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["sepet_yemekler"] as List;
    var food = jsonArray.map((e) => FoodOrder.fromJson(e)).toList();
    return BasketReturn(
      food_order: food,
      success: json["success"] as int,
    );
  }
}
