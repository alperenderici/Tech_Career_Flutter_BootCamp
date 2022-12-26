import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/sessions/s10/10.2/movies.dart';
import 'package:flutter_bootcamp/sessions/s10/10.2/movies_detail_page.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  Future<List<Movies>> fetchMovies() async {
    var moviesList = <Movies>[];
    var m1 = Movies(
      id: 1,
      name: "Anadoluda",
      imageName: "anadoluda.png",
      price: 24.0,
    );
    var m2 = Movies(
      id: 2,
      name: "Django",
      imageName: "django.png",
      price: 18.0,
    );
    var m3 = Movies(
      id: 3,
      name: "Inception",
      imageName: "inception.png",
      price: 32.0,
    );
    var m4 = Movies(
      id: 4,
      name: "Interstellar",
      imageName: "interstellar.png",
      price: 21.0,
    );
    var m5 = Movies(
      id: 5,
      name: "The Hateful Eight",
      imageName: "thehatefuleight.png",
      price: 15.0,
    );
    var m6 = Movies(
      id: 6,
      name: "The Pianist",
      imageName: "thepianist.png",
      price: 14.0,
    );

    moviesList.add(m1);
    moviesList.add(m2);
    moviesList.add(m3);
    moviesList.add(m4);
    moviesList.add(m5);
    moviesList.add(m6);
    return moviesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filmler"),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder<List<Movies>>(
        future: fetchMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var moviesList = snapshot.data;
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 2 / 3.5),
                itemCount: moviesList!.length,
                itemBuilder: (context, index) {
                  var movie = moviesList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MoviesDetailPage(
                                    movie: movie,
                                  )));
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                                "assets/images/movie/${movie.imageName}"),
                          ),
                          Text(
                            movie.name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${movie.price} ₺",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
