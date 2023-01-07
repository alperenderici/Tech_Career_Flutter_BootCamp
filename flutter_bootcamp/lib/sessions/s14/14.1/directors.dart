class Directors {
  String director_id;
  String director_name;

  Directors({
    required this.director_id,
    required this.director_name,
  });

  factory Directors.fromJson(Map<String, dynamic> json) {
    return Directors(
        director_id: json["yonetmen_id"] as String,
        director_name: json["yonetmen_ad"] as String);
  }
}
