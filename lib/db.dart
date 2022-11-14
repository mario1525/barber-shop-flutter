import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'Datos.db');
    Database theDb = await openDatabase(
      path,
      version: 8,
      onCreate: _onCreate,
    );
    return theDb;
  }

  static _onCreate(Database db, int version) async {
    db.execute(
        "CREATE TABLE usuario(id int primary key  ,nombre text ,apellido text , cell int, Fcumple text);");
    db.execute(
        "CREATE TABLE servicios(id int primary key  ,nombre text , valor int);");
    db.execute(
        "CREATE TABLE factura(id int primary key  , fecha date, id_user int ,FOREIGN KEY(id_user) REFERENCES usuario(id));");
    db.execute(
        "CREATE TABLE det_fac(id int primary key  ,id_fact int , id_serv int, FOREIGN KEY(id_fact) REFERENCES factura(id),FOREIGN KEY(id_serv) REFERENCES servicios(id));");
  }


//usuarios
//insertar ususario

  static Future<int> createItem(String name, String? ape, int cell,
      String cump) async {
    final Database database = await initDb();

    final data = {
      'nombre': name,
      'apellido': ape,
      'cell': cell,
      'Fcumple': cump
    };
    final id = await database.insert('usuario', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    //print(id);
    return id;
  }

//mostrar ususarios
  static Future<List<Map<String, dynamic>>> getItems() async {
    final Database database = await initDb();
    return database.query('usuario', orderBy: 'id');
  }

//modificar usuarios
  static Future<int> updateuser(int id,String nomb,String ape,int cel,String fec) async {
    final database = await initDb();

    final data = {
      'id': id,
      'nombre': nomb,
      'ape': ape,
      'cell': cel,
      'Fcumple': fec,
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
    await database.delete("ususario", where: 'id = ?', whereArgs: [id]);
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
  //numero de servicios creados


  //para servir el formulario de motiladas

//servir lista de usuario

//mostrar ususarios
  static Future<List<dynamic>> getClientes() async {
    final Database database = await initDb();
    var result = await database.rawQuery("SELECT nombre  FROM usuario");
    return result;
  }

// funciones para llenar facturas y dec_fac

// add dec_fac
static Future<int> createDecfac(int id_fac) async{
    final Database database = await initDb();

    final data = {
      'id_fac' :id_fac,
    };

    final id = await database.insert('dec_fac',data,
    conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
}

// add factura
  static Future<int> createFacture(int iduser, String fecha) async {
    final Database database = await initDb();

    final data = {
      'fecha': fecha,
      'id_user': iduser,

    };
    final id = await database.insert('factura', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  //mostrar facturas
  static Future<List<Map<String, dynamic>>> getfacture() async {
    final Database database = await initDb();
    return database.query('fatura', orderBy: "id");
  }

  //buscar el id de un sevicio
  static Future<int> idserv(String nombre) async {
    final Database database = await initDb();
    var result = await database.rawQuery("SELECT id  FROM servicios where: nombre = ?" );
    return 0;

//numero de facturas cargadas

//numero de dec_factura cargadas

}


}
