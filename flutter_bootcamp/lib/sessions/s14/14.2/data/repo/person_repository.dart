import 'dart:convert';
import 'package:flutter_bootcamp/sessions/s14/14.2/data/entity/person.dart';
import 'package:flutter_bootcamp/sessions/s14/14.2/data/entity/person_return.dart';
import 'package:http/http.dart' as http;

class PersonRepository {
  List<Person> parsePersonReturn(String answer) {
    return PersonReturn.fromJson(json.decode(answer)).person;
  }

  Future<void> save(String person_name, String person_num) async {
    print("Kişi kaydet: $person_name - $person_num");
  }

  Future<void> update(
      int person_id, String person_name, String person_num) async {
    print("Kişi Güncelle: $person_id - $person_name - $person_num");
  }

  Future<List<Person>> showAllPerson() async {
    var url = Uri.parse('http://kasimadalan.pe.hu/kisiler/tum_kisiler.php');
    var answer = await http.get(url);
    return parsePersonReturn(answer.body);
  }

  Future<List<Person>> search(String searchWord) async {
    var personList = <Person>[];
    var p1 = Person(person_id: "1", person_name: "Ahmet", person_num: "1111");
    personList.add(p1);
    return personList;
  }

  Future<void> delete(int person_id) async {
    print("Kişi sil: $person_id");
  }
}
