import 'dart:async';
import 'package:sqflite/sqflite.dart';


final String tableTodo = "_Member";
final String columnId = "_id";
final String columnUser = "_user";
final String columnPass = "_password";
final String columnName = "_name";
final String columnAge = "_age";
final String columnQuaot = "_quaot";

class Todo{
  int id;
  String user;
  String pass;
  String name;
  String age;
  String quaot;

  Todo({String user, String name, String pass, String age, this.quaot}){
    this.user = user;
    this.pass = pass;
    this.name = name;
    this.age = age;
    this.quaot = quaot;
  }

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      columnUser:user,
      columnPass :pass,
      columnName :name,
      columnAge: age,
      columnQuaot:quaot
    };
    if(id != null){
      map[columnId] = id;
    }
    return map;
  }
  Todo.fromMap(Map<String,dynamic> map){
    this.id = map[columnId];
    this.user = map[columnUser];
    this.pass = map[columnPass];
    this.name = map[columnName];
    this.age = map[columnAge];
    this.quaot = map[columnQuaot];
  
  }
}

class TodoProvider{
  Database db;
  Future open() async{
    var dbpath = await getDatabasesPath();
    String path = dbpath + "\_Member.db";
    db = await openDatabase(path, version:1,
    onCreate: (Database db , int version) async{
      await db.execute('''
      create table $tableTodo (
        $columnId integer primary key autoincrement,
        $columnUser text not null unique,
        $columnPass text not null,
        $columnName text not null,
        $columnAge text not null,
        $columnQuaot text
        )
      ''');
    });
  }
  Future<Todo> insert(Todo todo) async {
    todo.id = await db.insert(tableTodo, todo.toMap());
    return todo;
  }
  Future<Todo> getTodo(int id) async {
    List<Map> maps = await db.query(
      tableTodo,
      columns: [columnId,columnUser,columnPass],
      where: "$columnId = ?",
      whereArgs: [id] 
      );
      if (maps.length > 0){
        return new Todo.fromMap(maps.first);
      }
      return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableTodo, where: "$columnId = ?",
    whereArgs: [id]);
  }

  Future<int> update(Todo todo) async {
    return await db.update(tableTodo, todo.toMap(),where: "$columnId = ?",
    whereArgs: [todo.id]);
  }
  Future<List<Todo>> userall() async{
    List<Map> data = await db.query(tableTodo,
    );
    return data.map((d) => Todo.fromMap(d)).toList();
  }
  Future close() async => db.close();
}