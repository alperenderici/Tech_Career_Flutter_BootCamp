import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/sessions/s14/14.1/crud_return.dart';
import 'package:flutter_bootcamp/sessions/s14/14.1/movies_return.dart';
import 'package:flutter_bootcamp/sessions/s14/14.1/person_return.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    crudReturnParse();
    personParse();
    moviesParse();
  }

  void crudReturnParse() {
    String data = '{"success":0,"message":"Required field(s) is missing"}';
    var jsondata = json.decode(data);
    var crudReturn = CRUDReturn.fromJson(jsondata);
    print("------------------------------");
    print("Basari : ${crudReturn.success}");
    print("Basari : ${crudReturn.message}");
  }

  void personParse() {
    String data =
        '{"kisiler":[{"kisi_id":"12819","kisi_ad":"Ahmet","kisi_tel":"0000"},{"kisi_id":"12821","kisi_ad":"Zeynep","kisi_tel":"9999"}],"success":1}';
    var jsondata = json.decode(data);
    var personReturn = PersonReturn.fromJson(jsondata);

    print("Basari : ${personReturn.success}");
    for (var i in personReturn.person) {
      print("------------------------------");
      print("Person id : ${i.person_id}");
      print("Person name : ${i.person_name}");
      print("Person number : ${i.person_num}");
    }
  }

  void moviesParse() {
    String data =
        '{"filmler":[{"film_id":"1","film_ad":"Interstellar","film_yil":"2015","film_resim":"interstellar.png","kategori":{"kategori_id":"4","kategori_ad":"Bilim Kurgu"},"yonetmen":{"yonetmen_id":"1","yonetmen_ad":"Christopher Nolan"}},{"film_id":"2","film_ad":"Inception","film_yil":"2010","film_resim":"inception.png","kategori":{"kategori_id":"4","kategori_ad":"Bilim Kurgu"},"yonetmen":{"yonetmen_id":"1","yonetmen_ad":"Christopher Nolan"}},{"film_id":"3","film_ad":"The Pianist","film_yil":"2002","film_resim":"thepianist.png","kategori":{"kategori_id":"3","kategori_ad":"Drama"},"yonetmen":{"yonetmen_id":"4","yonetmen_ad":"Roman Polanski"}},{"film_id":"4","film_ad":"Bir Zamanlar Anadoluda","film_yil":"2011","film_resim":"birzamanlaranadoluda.png","kategori":{"kategori_id":"3","kategori_ad":"Drama"},"yonetmen":{"yonetmen_id":"3","yonetmen_ad":"Nuri Bilge Ceylan"}},{"film_id":"5","film_ad":"The Hateful Eight","film_yil":"2015","film_resim":"thehatefuleight.png","kategori":{"kategori_id":"1","kategori_ad":"Aksiyon"},"yonetmen":{"yonetmen_id":"2","yonetmen_ad":"Quentin Tarantino"}},{"film_id":"18","film_ad":"Django","film_yil":"2013","film_resim":"django.png","kategori":{"kategori_id":"1","kategori_ad":"Aksiyon"},"yonetmen":{"yonetmen_id":"2","yonetmen_ad":"Quentin Tarantino"}}],"success":1}';
    var jsondata = json.decode(data);
    var moviesReturn = MoviesReturn.fromJson(jsondata);
    print("Basari : ${moviesReturn.success}");
    for (var i in moviesReturn.movies) {
      print("------------------------------");
      print("Film id : ${i.movie_id}");
      print("Film name : ${i.movie_name}");
      print("Film yil : ${i.movie_year}");
      print("Film resim : ${i.movie_image}");
      print("Film kategori : ${i.category.category_name}");
      print("Film yonetmen : ${i.director.director_name}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(),
    );
  }
}
