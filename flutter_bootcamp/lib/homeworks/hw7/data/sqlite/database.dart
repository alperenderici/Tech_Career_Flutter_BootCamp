import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static final String databaseName = "todo.sqlite";

  static Future<Database> connectDB() async {
    String dbWay = join(await getDatabasesPath(), databaseName);

    if (await databaseExists(dbWay)) {
      print("Veritabani zaten var.");
    } else {
      ByteData data =
          await rootBundle.load("lib/homeworks/hw7/database/$databaseName");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbWay).writeAsBytes(
        bytes,
        flush: true,
      );
      print("Veritabani kopyalandi");
    }
    return openDatabase(dbWay);
  }
}
