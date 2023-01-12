import 'dart:collection';
import 'package:firebase_database/firebase_database.dart';

class PersonRepository {
  var refPerson = FirebaseDatabase.instance.ref().child("kisiler");

  Future<void> save(String person_name, String person_num) async {
    var newPerson = HashMap<String, dynamic>();
    newPerson["kisi_id"] = "";
    newPerson["kisi_ad"] = person_name;
    newPerson["kisi_tel"] = person_num;
    refPerson.push().set(newPerson);
  }

  Future<void> update(
      String person_id, String person_name, String person_num) async {
    var updatePerson = HashMap<String, dynamic>();
    updatePerson["kisi_ad"] = person_name;
    updatePerson["kisi_tel"] = person_num;
    refPerson.child(person_id).update(updatePerson);
  }

  Future<void> delete(String person_id) async {
    refPerson.child(person_id).remove();
  }
}
