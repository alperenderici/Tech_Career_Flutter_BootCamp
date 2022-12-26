// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/sessions/s10/10.2/movies.dart';

class MoviesDetailPage extends StatefulWidget {
  Movies movie;

  MoviesDetailPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<MoviesDetailPage> createState() => _MoviesDetailPageState();
}

class _MoviesDetailPageState extends State<MoviesDetailPage> {
  @override
  Widget build(BuildContext context) {
    var m = widget.movie;
    return Scaffold(
      appBar: AppBar(
        title: Text(m.name),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/movie/${m.imageName}"),
            Text(
              "${m.price} ₺",
              style: const TextStyle(
                fontSize: 48,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "KİRALA",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
