import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DBProvider{
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if(_database != null)
      return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async{
    return await openDatabase(join(await getDatabasesPath(),
    "xy.db"), onCreate: (db, version) async{
      await db.execute(
        '''
        CREATE TABLE favorities (
           index TEXT PRIMARY KEY, text TEXT
        )
        ''');
    },
    version: 1
    );
  }
  newFav(newFav) async{
    final db = await database;

    var res = await db.rawInsert('''
    INSERT INTO favorities(
    index, text
    ) VALUES(?, ?)
    ''', [newFav.index, newFav.text]);

    return res;
  }

  Future<dynamic> getUser() async {
    final db = await database;
    var res = await db.query("favorities");
    if(res.length == 0){
      return null;
    } else {
      var resMap = res[0];
      return resMap.isNotEmpty ? resMap : null;
    }
  }



}