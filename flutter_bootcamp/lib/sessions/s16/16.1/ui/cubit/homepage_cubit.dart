import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp/sessions/s16/16.1/data/entity/person.dart';
import 'package:flutter_bootcamp/sessions/s16/16.1/data/repo/person_repository.dart';

class HomePageCubit extends Cubit<List<Person>> {
  HomePageCubit() : super(<Person>[]);

  var pRepo = PersonRepository();
  var refPerson = FirebaseDatabase.instance.ref().child("kisiler");

  Future<void> showAllPerson() async {
    // var sorgu = refPerson.orderByChild("kisi_ad").equalTo("Talat");
    // var sorgu = refPerson.limitTiLast(1);
    // sorgu.onValue.listen((event) {
    refPerson.onValue.listen((event) {
      var returnValues = event.snapshot.value as dynamic;
      if (returnValues != null) {
        var list = <Person>[];
        returnValues.forEach((key, object) {
          var person = Person.fromJson(key, object);
          list.add(person);
        });
        emit(list);
      } else {
        Center(child: CircularProgressIndicator());
      }
    });
  }

  Future<void> search(String searchWord) async {
    refPerson.onValue.listen((event) {
      var returnValues = event.snapshot.value as dynamic;
      if (returnValues != null) {
        var list = <Person>[];
        returnValues.forEach((key, object) {
          var person = Person.fromJson(key, object);
          if (person.person_name
              .toLowerCase()
              .contains(searchWord.toLowerCase())) {
            list.add(person);
          }
        });
        emit(list);
      }
    });
  }

  Future<void> delete(String person_id) async {
    await pRepo.delete(person_id);
  }
}
