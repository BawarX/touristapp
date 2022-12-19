import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<void> insert(String table, Map<String, Object> data) async {
    final dbPath = await getDatabasesPath();
    final sqlDb =
        await openDatabase(join(dbPath, 'places.db'), onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
    }, version: 1);
    await sqlDb.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
    /*
    hmmm so let's stop for a moment what is that conflictAlgorithm, so that conflict algo
    is used if there a 'already' value there, that algo can replace it and stored as a new value,,
    as you can see there are many option's there like 'ignore' maybe, so think what it's job?
    you guessed right it will ignore the value, 
    --> Conflict has the same meaning that we covered in introduction dbms..
    -------------------------------------------------------------------------
    data parameter should be 'map' type.
    */
  }
}
