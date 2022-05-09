
import 'package:nota/Model/node_model.dart';
import 'package:nota/data/local/db/constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{

  DbHelper._instance();
  static final helper = DbHelper._instance();
  factory DbHelper(){
    return helper;
  }

  Future<String> _getPath() async{
    String dbPath = await getDatabasesPath();
    return join(dbPath,DB_NAME);
  }

  Future<void> _onCreate(Database db) async{
    String sqlCommand = 'create table $NOTES_TABLE ($NOTE_ID integer primary key autoincrement, $NOTE_TITLE text, $NOTE_BODY text, $NOTE_BACKGROUND_COLOR text, $NOTE_DATE text)';
    await db.execute(sqlCommand);
  }

  Future<Database> _getInstance() async{
    String dbPath = await _getPath();
    return openDatabase(dbPath,version: DB_VERSION,onCreate: (db,version)=>_onCreate(db));
  }

  Future<int> insert(Note note)async{
    var db = await _getInstance();
    return await db.insert(NOTES_TABLE, note.toMap());
  }

  Future<List<Note>> getAll()async{
   var db = await _getInstance();
   List<Map<String,dynamic>> query =  await db.query(NOTES_TABLE,orderBy: '$NOTE_DATE desc');
   return query.map((e)=> Note.fromMap(e)).toList();
  }

  Future<int> update(Note note)async{
    var db = await _getInstance();
    return await db.update(NOTES_TABLE,note.toMap(),where: '$NOTE_ID = ?',whereArgs: [note.id]);
  }

  Future<int> delete(Note note)async{
    var db = await _getInstance();
    return await db.delete(NOTES_TABLE,where: '$NOTE_ID = ?',whereArgs: [note.id]);
  }
}