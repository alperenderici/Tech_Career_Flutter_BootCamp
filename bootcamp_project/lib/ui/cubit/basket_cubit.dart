import 'package:bootcamp_project/data/entity/food.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketCubit extends Cubit<List<Food>> {
  BasketCubit() : super(<Food>[]); //check there

}
