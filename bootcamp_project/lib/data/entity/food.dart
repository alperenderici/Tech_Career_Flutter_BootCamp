class Food {
  int food_id;
  String food_name;
  String food_image_name;
  int food_price;

  Food({
    required this.food_id,
    required this.food_name,
    required this.food_image_name,
    required this.food_price,
  });

  factory Food.fromMap(Map<String, dynamic> json) {
    return Food(
      food_id: json['food_id'] as int,
      food_name: json['food_name'] as String,
      food_image_name: json['food_image_name'] as String,
      food_price: json['food_price'] as int,
    );
  }
}
