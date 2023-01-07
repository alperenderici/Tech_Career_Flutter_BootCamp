import 'package:flutter_bootcamp/sessions/s14/14.1/person.dart';

class PersonReturn {
  List<Person> person;
  int success;

  PersonReturn({
    required this.person,
    required this.success,
  });

  factory PersonReturn.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["kisiler"] as List;
    var person = jsonArray
        .map((jsonArrayList) => Person.fromJson(jsonArrayList))
        .toList();
    return PersonReturn(person: person, success: json["success"] as int);
  }
}
