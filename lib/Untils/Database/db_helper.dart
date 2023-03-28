import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Database? db;

  Future<Database?> Checkdb() async {
    if (db == null) {
      return db;
    } else {
      return await Createdb();
    }
  }

  Future<Database> Createdb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, 'ronak.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE std(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,dic TEXT,image TEXT,author TEXT)";
        db.execute(query);
      },
    );
  }

  Future<void> insertdb(
      String name, String dic, String image, String author) async {
    db = await Checkdb();
    db?.insert('std',
        {"name": name, "Discretion": dic, "image": image, "author": author});
  }

  Future<List> readdb()
  async {
    db = await Checkdb();
    String query = "SELECT * FROM std";
    List l1 = await db!.rawQuery(query,null) ;
    return l1 ;
  }
}
