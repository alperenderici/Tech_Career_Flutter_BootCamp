import 'package:bootcamp_project/data/entity/basket_return.dart';
import 'package:bootcamp_project/data/repo/food_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketCubit extends Cubit<BasketReturn> {
  BasketCubit() : super(BasketReturn(food_order: [], success: 1));

  var foodRepo = FoodRepository();

  Future<void> showBasket() async {
    var list = await foodRepo.showBasket();
    emit(list);
  }

  Future<void> addBasket(String food_name, String food_image_name,
      String food_price, String food_order_piece, String user_name) async {
    await foodRepo.addBasket(
        food_name, food_image_name, food_price, food_order_piece, user_name);
  }

  Future<void> deleteBasket(int basket_food_id, String user_name) async {
    await foodRepo.deleteBasket(basket_food_id, user_name);
    await showBasket();
  }

  int showSum() {
    return foodRepo.showSum;
  }
}
