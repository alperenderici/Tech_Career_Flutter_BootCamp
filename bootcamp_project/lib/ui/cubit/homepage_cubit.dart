import 'package:bootcamp_project/data/entity/food.dart';
import 'package:bootcamp_project/data/repo/food_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<List<Food>> {
  HomePageCubit() : super(<Food>[]);

  var foodRepo = FoodRepository();

  Future<void> showAllFood() async {
    var list = await foodRepo.showAllFood();
    emit(list);
  }

  Future<void> search(String searchWord) async {
    var list = await foodRepo.search(searchWord);
    emit(list);
  }

  // bool showSum() {
  //   return foodRepo.showFavFood();
  // }
}
