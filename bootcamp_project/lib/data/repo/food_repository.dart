import 'dart:convert';
import 'package:bootcamp_project/data/entity/basket_return.dart';
import 'package:bootcamp_project/data/entity/food.dart';
import 'package:bootcamp_project/data/entity/food_return.dart';
import 'package:dio/dio.dart';

class FoodRepository {
  static String user_name = "Alperen_Derici";
  int sum = 0;
  bool isFav = false;

  int get showSum => sum;
  bool get showFav => isFav;

  List<Food> parseFoodReturn(String answer) {
    return FoodReturn.fromJson(json.decode(answer)).food;
  }

  Future<List<Food>> showAllFood() async {
    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var answer = await Dio().get(url);
    return parseFoodReturn(answer.data.toString());
  }

  // Future<FoodReturn> showFavFood() async {
  //   var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
  //   var answer = await Dio().get(url);
  //   if (answer.data.contains("success")) {

  //     for (var i
  //         in FoodReturn.fromJson(json.decode(answer.data)).food) {
  //       isFav != isFav;
  //     }
  //     return BasketReturn.fromJson(json.decode(answer.data)).food_order;
  //   } else {
  //     return parseFoodReturn(answer.data.toString());
  //   }
  // }

  Future<BasketReturn> showBasket() async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php";
    var data = {
      "kullanici_adi": user_name,
    };
    var answer = await Dio().post(url, data: FormData.fromMap(data));
    if (answer.data.contains("success")) {
      for (var i
          in BasketReturn.fromJson(json.decode(answer.data)).food_order) {
        sum += i.food_price * i.food_order_piece;
      }
      return BasketReturn.fromJson(json.decode(answer.data));
    } else {
      return BasketReturn(food_order: [], success: 1);
    }
  }

  Future<List<Food>> search(String searchWord) async {
    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var data = {
      "yemek_adi": searchWord,
    };
    var answer = await Dio().post(url, data: FormData.fromMap(data));
    return parseFoodReturn(answer.data.toString());
  }

  Future<void> addBasket(String food_name, String food_image_name,
      String food_price, String food_order_piece, String user_name) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php";
    var data = {
      "yemek_adi": food_name,
      "yemek_resim_adi": food_image_name,
      "yemek_fiyat": food_price,
      "yemek_siparis_adet": food_order_piece,
      "kullanici_adi": user_name,
    };
    var answer = await Dio().post(url, data: FormData.fromMap(data));
    print("Baskete yemek ekle: ${answer.data.toString()}");
  }

  Future<void> deleteBasket(int basket_food_id, String user_name) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php";
    var data = {
      "sepet_yemek_id": basket_food_id,
      "kullanici_adi": user_name,
    };
    var answer = await Dio().post(url, data: FormData.fromMap(data));
    print("Yemek sil: ${answer.data.toString()}");
  }
}
