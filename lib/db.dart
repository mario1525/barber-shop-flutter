import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import './usuario.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'negocio.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE usuario(id int primary key , nombre text , apellido text , cell int, Fcumple date);",
        );
      },
      version: 1,
    );
  }

//insertar ususario
  static Future<int> createItem(
      String name, String? ape, int cell, String cump) async {
    final Database database = await _openDB();

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
    final Database database = await _openDB();
    return database.query('usuario', orderBy: "id");
  }

//modificar usuarios
  Future<void> updateuser(Usuario usuario) async {
    final database = await _openDB();

    await database.update(
      'usuario',
      usuario.toMap(),
      where: "id = ?",
      whereArgs: [usuario.id],
    );
  }

//eliminar usuarios
  Future<void> deleteuser(int id) async {
    final database = await _openDB();

    await database.delete(
      'usuario',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
