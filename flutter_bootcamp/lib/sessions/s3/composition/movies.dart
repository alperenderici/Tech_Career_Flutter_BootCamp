// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bootcamp/sessions/s3/composition/categories.dart';
import 'package:flutter_bootcamp/sessions/s3/composition/directors.dart';

class Movies {
  int movie_id;
  String movie_name;
  int movie_year;
  Categories categories; //Composition
  Directors directors; //Composition

  Movies({
    required this.movie_id,
    required this.movie_name,
    required this.movie_year,
    required this.categories,
    required this.directors,
  });
}
