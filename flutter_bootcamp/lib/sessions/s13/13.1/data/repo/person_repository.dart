import 'package:flutter_bootcamp/sessions/s13/13.1/data/entity/person.dart';
import 'package:flutter_bootcamp/sessions/s13/13.1/data/sqlite/database.dart';

class PersonRepository {
  Future<void> save(String person_name, String person_num) async {
    var db = await DatabaseClass.connectDB();
    var info = Map<String, dynamic>();
    info["person_name"] = person_name;
    info["person_num"] = person_num;
    await db.insert("person", info);
  }

  Future<void> update(
      int person_id, String person_name, String person_num) async {
    var db = await DatabaseClass.connectDB();
    var info = Map<String, dynamic>();
    info["person_name"] = person_name;
    info["person_num"] = person_num;
    await db
        .update("person", info, where: "person_id=?", whereArgs: [person_id]);
  }

  Future<List<Person>> showAllPerson() async {
    var db = await DatabaseClass.connectDB();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM person");
    return List.generate(maps.length, (index) {
      var line = maps[index];
      return Person(
        person_id: line["person_id"],
        person_name: line["person_name"],
        person_num: line["person_num"],
      );
    });
  }

  Future<List<Person>> search(String searchWord) async {
    var db = await DatabaseClass.connectDB();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM person WHERE person_name like '%$searchWord%'");
    return List.generate(maps.length, (index) {
      var line = maps[index];
      return Person(
        person_id: line["person_id"],
        person_name: line["person_name"],
        person_num: line["person_num"],
      );
    });
  }

  Future<void> delete(int person_id) async {
    var db = await DatabaseClass.connectDB();
    await db.delete("person", where: "person_id=?", whereArgs: [person_id]);
  }
}
