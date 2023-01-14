import 'package:bootcamp_project/data/entity/food.dart';
import 'package:bootcamp_project/data/entity/food_order.dart';
import 'package:bootcamp_project/data/repo/food_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketCubit extends Cubit<List<FoodOrder>> {
  BasketCubit() : super(<FoodOrder>[]);
  // BasketCubit() : super(0);

  var foodRepo = FoodRepository();

  Future<void> showBasket(String user_name) async {
    var list = await foodRepo.showBasket(user_name);
    emit(list);
  }

  Future<void> addBasket(String food_name, String food_image_name,
      String food_price, String food_order_piece, String user_name) async {
    await foodRepo.addBasket(
        food_name, food_image_name, food_price, food_order_piece, user_name);
  }

  // Future<void> search(String searchWord) async {
  //   var list = await foodRepo.search(searchWord);
  //   emit(list);
  // }

  Future<void> deleteBasket(int basket_food_id, String user_name) async {
    await foodRepo.deleteBasket(basket_food_id, user_name);
    await showBasket(user_name);
  }
}
