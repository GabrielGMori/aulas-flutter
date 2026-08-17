import 'package:gabrel_projeto_flutter/database/database_helper.dart';
import 'package:gabrel_projeto_flutter/models/treino.dart';
import 'package:sqflite/sqlite_api.dart';

class TreinoDao {
  TreinoDao._();
  static final TreinoDao instance = TreinoDao._();

  Future<List<Treino>> getTreinos() async {
    Database db = await DatabaseHelper.instance.database;
    var treinos = await db.query('treinos', orderBy: 'id DESC');
    return treinos.isNotEmpty
        ? treinos.map((item) => Treino.fromMap(item)).toList()
        : [];
  }

  Future<int> add(Treino newTreino) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.insert('treinos', newTreino.toMap());
  }

  Future<int> remove(Treino treino) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.delete('treinos', where: 'id = ?', whereArgs: [treino.id]);
  }

  Future<int> update(Treino treino) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.update('treinos', treino.toMap(), where: 'id = ?', whereArgs: [treino.id]);
  }
}
