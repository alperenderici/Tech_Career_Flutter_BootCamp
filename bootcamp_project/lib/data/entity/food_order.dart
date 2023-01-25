class FoodOrder {
  int food_order_id;
  String food_name;
  String food_image_name;
  int food_price;
  int food_order_piece;
  String user_name;
  // Food food;

  FoodOrder({
    required this.food_order_id,
    required this.food_name,
    required this.food_image_name,
    required this.food_price,
    required this.food_order_piece,
    required this.user_name,
    // required this.food,
  });

  factory FoodOrder.fromJson(Map<String, dynamic> json) {
    return FoodOrder(
      food_order_id: int.parse(json['sepet_yemek_id']) as int,
      food_name: json['yemek_adi'] as String,
      food_image_name: json['yemek_resim_adi'] as String,
      food_price: int.parse(json['yemek_fiyat']) as int,
      food_order_piece: int.parse(json['yemek_siparis_adet']) as int,
      user_name: json['kullanici_adi'] as String,
    );
  }

  // factory FoodOrder.fromJson(Map<String, dynamic> json) {
  //   return FoodOrder(
  //     food_order_id: int.parse(json['sepet_yemek_id']) as int,
  //     // food_name: Food.fromJson(json['yemek_adi']) as Map<String, dynamic>,
  //     food_name: Food.fromJson(json['yemek_fiyat']).food_name.toString(),
  //     // food_image_name: Food.fromJson(json['yemek_resim_adi']) as String,
  //     food_image_name: Food.fromJson(json['yemek_fiyat']).food_image_name,
  //     // food_price: Food.fromJson(json['yemek_fiyat']) as int,
  //     food_price: Food.fromJson(json['yemek_fiyat']).food_price,
  //     food_order_piece: int.parse(json['yemek_siparis_adet']) as int,
  //     user_name: json['kullanici_adi'] as String,
  //     food: Food.fromJson(json['yemekler'] as Map<String, dynamic>),
  //   );
  // }
}
