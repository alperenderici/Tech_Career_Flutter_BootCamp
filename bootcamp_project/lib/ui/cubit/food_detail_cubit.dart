import 'package:bootcamp_project/data/repo/food_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDetailCubit extends Cubit<void> {
  FoodDetailCubit() : super(0);

  var foodRepo = FoodRepository();

  Future<void> addBasket(String food_name, String food_image_name,
      String food_price, String food_order_piece, String user_name) async {
    await foodRepo.addBasket(
        food_name, food_image_name, food_price, food_order_piece, user_name);
  }

  Future<void> deleteBasket(int basket_food_id, String user_name) async {
    await foodRepo.deleteBasket(basket_food_id, user_name);
  }
}
