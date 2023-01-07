class Categories {
  String category_id;
  String category_name;

  Categories({
    required this.category_id,
    required this.category_name,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
        category_id: json["kategori_id"] as String,
        category_name: json["kategori_ad"] as String);
  }
}
