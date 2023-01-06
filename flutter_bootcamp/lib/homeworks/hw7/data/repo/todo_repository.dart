import 'package:flutter_bootcamp/homeworks/hw7/data/entity/todo.dart';
import 'package:flutter_bootcamp/homeworks/hw7/data/sqlite/database.dart';

class TodoRepository {
  //save
  Future<void> save(String todo_name, String todo_description) async {
    var db = await DB.connectDB();
    var info = Map<String, dynamic>();
    info["todo_name"] = todo_name;
    info["todo_description"] = todo_description;
    await db.insert("todo", info);
  }

  //delete
  Future<void> delete(int todo_id) async {
    var db = await DB.connectDB();
    await db.delete("todo", where: "todo_id=?", whereArgs: [todo_id]);
  }

  //update
  Future<void> update(
      int todo_id, String todo_name, String todo_description) async {
    var db = await DB.connectDB();
    var info = Map<String, dynamic>();
    info["todo_name"] = todo_name;
    info["todo_description"] = todo_description;
    await db.update("todo", info, where: "todo_id=?", whereArgs: [todo_id]);
  }

  //search
  Future<List<Todo>> search(String searchWord) async {
    var db = await DB.connectDB();
    List<Map<String, dynamic>> maps = await db
        .rawQuery("SELECT * FROM todo WHERE todo_name like '%$searchWord%'");
    return List.generate(maps.length, (index) {
      var line = maps[index];
      return Todo(
        todo_id: line["todo_id"],
        todo_name: line["todo_name"],
        todo_description: line["todo_description"],
      );
    });
  }

  //list
  Future<List<Todo>> list() async {
    var db = await DB.connectDB();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM todo");
    return List.generate(maps.length, (index) {
      var line = maps[index];
      return Todo(
        todo_id: line["todo_id"],
        todo_name: line["todo_name"],
        todo_description: line["todo_description"],
      );
    });
  }
}
