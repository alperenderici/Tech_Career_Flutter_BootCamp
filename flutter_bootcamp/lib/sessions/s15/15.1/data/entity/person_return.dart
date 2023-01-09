import 'package:flutter_bootcamp/sessions/s15/15.1/data/entity/person.dart';

class PersonReturn {
  List<Person> person;
  int success;

  PersonReturn({
    required this.person,
    required this.success,
  });
  factory PersonReturn.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["kisiler"] as List;
    var person = jsonArray.map((e) => Person.fromJson(e)).toList();
    return PersonReturn(
      person: person,
      success: json["success"] as int,
    );
  }
}
