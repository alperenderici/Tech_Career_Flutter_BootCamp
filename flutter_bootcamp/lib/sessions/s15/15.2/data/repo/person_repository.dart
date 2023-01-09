import 'package:flutter_bootcamp/sessions/s15/15.2/data/entity/person.dart';

class PersonRepository {
  Future<void> save(String person_name, String person_num) async {
    print("Kişi kaydet: $person_name - $person_num");
  }

  Future<void> update(
      int person_id, String person_name, String person_num) async {
    print("Kişi Güncelle: $person_id - $person_name - $person_num");
  }

  Future<List<Person>> showAllPerson() async {
    var personList = <Person>[];
    var p1 = Person(person_id: 1, person_name: "Ahmet", person_num: "1111");
    var p2 = Person(person_id: 2, person_name: "Zeynep", person_num: "2222");
    var p3 = Person(person_id: 3, person_name: "Beyza", person_num: "3333");
    personList.add(p1);
    personList.add(p2);
    personList.add(p3);
    return personList;
  }

  Future<List<Person>> search(String searchWord) async {
    var personList = <Person>[];
    var p1 = Person(person_id: 1, person_name: "Ahmet", person_num: "1111");
    personList.add(p1);
    return personList;
  }

  Future<void> delete(int person_id) async {
    print("Kişi sil: $person_id");
  }
}
