import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDataBase {
  Database? database;

  get getDatabase async {
    if (database != null) return database;

    return await initDatabase();
  }

  Future<Database> initDatabase() async {
    return await openDatabase(
      join(
        await getDatabasesPath(),
        'todo_list.db',
      ),
      version: 1,
      onCreate: _onCreateTables,
    );
  }

  _onCreateTables(Database database, int version) async {
    await database.execute(dailyActivity);
  }

  String get dailyActivity => ''' 
    CREATE TABLE ACTIVITYS(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      content TEXT,
      initHours TEXT,
      finalHours TEXT,
      status TEXT,
      createAt TEXT,
      updateAtt TEXT 
    )
  ''';
}
