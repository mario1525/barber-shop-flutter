import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'negocios.db');
    Database theDb = await openDatabase(
      path,
      version: 8,
      onCreate: _onCreate,
    );
    return theDb;
  }

  static _onCreate(Database db, int version) async {
    db.execute(
        "CREATE TABLE servicios(id int primary key  ,nombre text , valor int);");
    db.execute(
        "CREATE TABLE usuario(id int primary key  ,nombre text ,apellido text , cell int, Fcumple date);");
    db.execute(
        "CREATE TABLE motiladas(id int primary key  , fecha date,id_servis int,id_user int ,FOREIGN KEY(id_user) REFERENCES usuario(id), FOREIGN KEY(id_servis) REFERENCES servicios(id));");
  }

//insertar ususario
  static Future<int> createItem(
      String name, String? ape, int cell, String cump) async {
    final Database database = await initDb();

    final data = {
      'nombre': name,
      'apellido': ape,
      'cell': cell,
      'Fcumple': cump
    };
    final id = await database.insert('usuario', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

//mostrar ususarios
  static Future<List<Map<String, dynamic>>> getItems() async {
    final Database database = await initDb();
    return database.query('usuario', orderBy: "id");
  }

//modificar usuarios
  static Future<int> updateuser(
      int id, String nombre, String ape, int cel, String fecha) async {
    final database = await initDb();

    final data = {
      'id': id,
      'nombre': nombre,
      'ape': ape,
      'cell': cel,
      'Fcumple': fecha,
    };

    final result2 = await database.update(
      'usuario',
      data,
      where: "id = ?",
      whereArgs: [id],
    );
    return result2;
  }

//eliminar usuarios
  static Future<void> deleteuser(int id) async {
    final database = await initDb();
    await database.delete("ususario", where: "id = ?", whereArgs: [id]);
  }

//funciones para la tabla servicio

//agregar servicio
  static Future<int> createItemser(String nombre, int valor) async {
    final Database database = await initDb();

    final data = {
      'nombre': nombre,
      'valor ': valor,
    };
    final id = await database.insert('servicios', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  //mostrar servicios
  static Future<List<Map<String, dynamic>>> getservis() async {
    final Database database = await initDb();
    return database.query('servicios', orderBy: "id");
  }

  //actualizar un servicio
  static Future<int> updateserv(int id, String nombre, int valor) async {
    final Database database = await initDb();
    final data = {
      'nombre': nombre,
      'valor': valor,
    };

    final result = await database
        .update('servicios', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // eliminar servicio
  static Future<void> deleteserv(int id) async {
    final Database database = await initDb();

    await database.delete("servicios", where: "id = ?", whereArgs: [id]);
  }

  //para servir el formulario de motiladas

//servir lista de usuario

//mostrar ususarios
  static Future<List<dynamic>> getClientes() async {
    final Database database = await initDb();
    var result = await database.rawQuery("SELECT nombre  FROM usuario");
    return result;
  }

//a??adir motilada
  static Future<int> createmotilada(int ususario, int servicio) async {
    final Database database = await initDb();

    final data = {
      'id_user': ususario,
      'id_servis ': servicio,
    };
    final id = await database.insert('motiladas', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }
}
