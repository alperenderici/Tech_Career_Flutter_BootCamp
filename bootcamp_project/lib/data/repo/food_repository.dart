import 'dart:convert';
import 'package:bootcamp_project/data/entity/food.dart';
import 'package:bootcamp_project/data/entity/food_return.dart';
import 'package:dio/dio.dart';

class FoodRepository {
  List<Food> parseFoodReturn(String answer) {
    return FoodReturn.fromJson(json.decode(answer)).food;
  }

  Future<List<Food>> showAllFood() async {
    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var answer = await Dio().get(url);
    return parseFoodReturn(answer.data.toString());
  }
}
