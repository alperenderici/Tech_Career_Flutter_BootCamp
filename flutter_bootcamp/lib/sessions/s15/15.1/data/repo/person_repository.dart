import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bootcamp/sessions/s15/15.1/data/entity/person.dart';
import 'package:flutter_bootcamp/sessions/s15/15.1/data/entity/person_return.dart';
// import 'package:http/http.dart' as http;

class PersonRepository {
  List<Person> parsePersonReturn(String answer) {
    return PersonReturn.fromJson(json.decode(answer)).person;
  }

  Future<void> save(String person_name, String person_num) async {
    // var url = Uri.parse('http://kasimadalan.pe.hu/kisiler/insert_kisiler.php');
    // var data = {"kisi_ad": person_name, "kisi_tel": person_num};
    // var answer = await http.post(url, body: data);
    // print("Kisi kayit: ${answer.body}");
    var url = "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php";
    var data = {"kisi_ad": person_name, "kisi_tel": person_num};
    var answer = await Dio().post(url, data: FormData.fromMap(data));
    print("Kisi kayit: ${answer.data.toString()}");
  }

  Future<void> update(
      int person_id, String person_name, String person_num) async {
    // var url = Uri.parse('http://kasimadalan.pe.hu/kisiler/update_kisiler.php');
    // var data = {
    //   "kisi_id": person_id.toString(), //http only accept string (dio not)
    //   "kisi_ad": person_name,
    //   "kisi_tel": person_num,
    // };
    // var answer = await http.post(url, body: data);
    // print("Kisi guncel: ${answer.body}");
    var url = "http://kasimadalan.pe.hu/kisiler/update_kisiler.php";
    var data = {
      "kisi_id": person_id,
      "kisi_ad": person_name,
      "kisi_tel": person_num,
    };
    var answer = await Dio().post(url, data: FormData.fromMap(data));
    print("Kisi guncel: ${answer.data.toString()}");
  }

  Future<List<Person>> showAllPerson() async {
    // var url = Uri.parse('http://kasimadalan.pe.hu/kisiler/tum_kisiler.php');
    // var answer = await http.get(url);
    // return parsePersonReturn(answer.body);
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php";
    var answer = await Dio().get(url);
    return parsePersonReturn(answer.data.toString());
  }

  Future<List<Person>> search(String searchWord) async {
    // var url =
    //     Uri.parse('http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php');
    // var data = {
    //   "kisi_ad": searchWord,
    // };
    // var answer = await http.post(url, body: data);
    // return parsePersonReturn(answer.body);
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php";
    var data = {
      "kisi_ad": searchWord,
    };
    var answer = await Dio().post(url, data: FormData.fromMap(data));
    return parsePersonReturn(answer.data.toString());
  }

  Future<void> delete(int person_id) async {
    // var url = Uri.parse('http://kasimadalan.pe.hu/kisiler/delete_kisiler.php');
    // var data = {
    //   "kisi_id": person_id.toString(),
    // };
    // var answer = await http.post(url, body: data);
    // print("Kisi sil: ${answer.body}");
    var url = "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php";
    var data = {
      "kisi_id": person_id,
    };
    var answer = await Dio().post(url, data: FormData.fromMap(data));
    print("Kisi sil: ${answer.data.toString()}");
  }
}
