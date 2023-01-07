import 'package:flutter_bootcamp/sessions/s14/14.1/categories.dart';
import 'package:flutter_bootcamp/sessions/s14/14.1/directors.dart';

class Movies {
  String movie_id;
  String movie_name;
  String movie_year;
  String movie_image;
  Categories category;
  Directors director;

  Movies({
    required this.movie_id,
    required this.movie_name,
    required this.movie_year,
    required this.movie_image,
    required this.category,
    required this.director,
  });

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      movie_id: json["film_id"] as String,
      movie_name: json["film_ad"] as String,
      movie_year: json["film_yil"] as String,
      movie_image: json["film_resim"] as String,
      category: Categories.fromJson(json["kategori"]),
      director: Directors.fromJson(json["yonetmen"]),
    );
  }
}
