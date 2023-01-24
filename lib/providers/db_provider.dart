import 'dart:io';

import 'package:examen_practic/models/despeses_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (database == null) _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'Despeses.db');
    print(path);

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE Despeses(
          id INTEGER PRIMARY KEY,
          titol TEXT,
          quantitat TEXT
        )
      ''');
      },
    );
  }

  Future<int> insertRawDespeses(DespesesModel nouDespeses) async {
    final id = nouDespeses.id;
    final titol = nouDespeses.titol;
    final quantitat = nouDespeses.quantitat;

    final db = await database;

    final res = await db.rawInsert('''
      INSERT INTO Despeses(id, titol, quantitat)
      VALUES ($id, $titol, $quantitat)
    ''');
    return res;
  }

  Future<int> insertDespesa(DespesesModel nouDespeses) async {
    final db = await database;

    final res = await db.insert('Despeses', nouDespeses.toMap());
    print(res);
    return res;
  }

  Future<List<DespesesModel>> getAllDespeses() async {
    final db = await database;
    final res = await db.query('Despeses');
    return res.isNotEmpty
        ? res.map((e) => DespesesModel.fromMap(e)).toList()
        : [];
  }

  Future<DespesesModel?> getDespesaById(int id) async {
    final db = await database;
    final res = await db.query('Despeses', where: 'id = ?', whereArgs: [id]);

    if (res.isNotEmpty) {
      return DespesesModel.fromMap(res.first);
    }
    return null;
  }

  Future<List<DespesesModel>> getDespesaByTitol(String titol) async {
    final db = await database;
    final res =
        await db.query('Despeses', where: 'titol = ?', whereArgs: [titol]);

    return res.isNotEmpty
        ? res.map((e) => DespesesModel.fromMap(e)).toList()
        : [];
  }

  Future<int> updateDespeses(DespesesModel nouDespeses) async {
    final db = await database;

    final res = db.update('Despeses', nouDespeses.toMap(),
        where: 'id = ?', whereArgs: [nouDespeses.id]);

    return res;
  }

  Future<int> deleteAllDespeses() async {
    final db = await database;
    final res = await db.rawDelete('''
      DELETE FROM Despeses
    ''');
    return res;
  }

  Future<int> deleteDespeses(int id) async {
    final db = await database;
    final res = await db.delete('Despeses', where: 'id ? ?', whereArgs: [id]);
    return res;
  }
}
