import 'package:flutter_bootcamp/sessions/s14/14.1/movies.dart';

class MoviesReturn {
  List<Movies> movies;
  int success;

  MoviesReturn({
    required this.movies,
    required this.success,
  });

  factory MoviesReturn.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["filmler"] as List;
    var movies = jsonArray
        .map((jsonArrayList) => Movies.fromJson(jsonArrayList))
        .toList();
    return MoviesReturn(movies: movies, success: json["success"] as int);
  }
}
