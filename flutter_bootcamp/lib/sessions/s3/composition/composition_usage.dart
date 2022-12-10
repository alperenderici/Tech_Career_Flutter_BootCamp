import 'package:flutter_bootcamp/sessions/s3/composition/categories.dart';
import 'package:flutter_bootcamp/sessions/s3/composition/directors.dart';
import 'package:flutter_bootcamp/sessions/s3/composition/movies.dart';

void main() {
  var c1 = Categories(category_id: 1, category_name: "Drama");
  var c2 = Categories(category_id: 2, category_name: "Science Fiction");
  var d1 = Directors(director_id: 1, director_name: "Quentin Tarantino");
  var d2 = Directors(director_id: 2, director_name: "Martin Scorsese");
  var m1 = Movies(
    movie_id: 1,
    movie_name: "Django",
    movie_year: 2013,
    categories: c1,
    directors: d1,
  );
  print("Film id: ${m1.movie_id}");
  print("Film adi: ${m1.movie_name}");
  print("Film yili: ${m1.movie_year}");
  print("Film kategori: ${m1.categories.category_name}");
  print("Film yonetmeni: ${m1.directors.director_name}");
}
