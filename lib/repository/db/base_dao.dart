import 'package:flutter_boilerplate/models/base_model.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

import 'db.dart';

abstract class BaseDao<T extends BaseModel> {
  ///
  Future<T> insert(T model) async {
    model.id = await (await Db().get()).insert(
      tableName,
      model.toJson(),
    );
    return model;
  }

  Future<bool> insertAll(List<T> models) async {
    var batch = Db().batch;
    models.forEach((m) => batch.insert(
          tableName,
          m.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        ));
    await batch.commit();
    return true;
  }

  Future<T> get(int id) async {
    List<Map> maps = await (await Db().get()).query(
      tableName,
      columns: _columns(),
      where: "$fieldId = ?",
      whereArgs: [id],
    );
    if (maps.length > 0) {
      return buildModel(maps.first);
    }
    return null;
  }

  Future<List<T>> getAll() async {
    List<Map> maps = await (await Db().get()).query(
      tableName,
      columns: _columns(),
    );

    if (maps.isEmpty) {
      return List<T>();
    }

    return maps.map((m) => buildModel(m)).toList();
  }

  Future<int> delete(int id) async {
    return await (await Db().get()).delete(
      tableName,
      where: "$fieldId = ?",
      whereArgs: [id],
    );
  }

  Future<int> deleteAll() async {
    return await Db().db.delete(tableName);
  }

  Future<int> update(T model) async {
    return await (await Db().get()).update(
      tableName,
      model.toJson(),
      where: "$fieldId = ?",
      whereArgs: [model.id],
    );
  }

  Future<List<T>> getByField(String field, dynamic value) async {
    List<Map> maps = await Db().db.query(
      tableName,
      columns: _columns(),
      where: "$field = ?",
      whereArgs: [value],
    );

    if (maps.isEmpty) {
      return <T>[];
    }

    return maps.isEmpty ? <T>[] : maps.map((m) => buildModel(m)).toList();
  }

  Future<List<T>> getByFields(
    String field1,
    dynamic value1,
    String field2,
    dynamic value2,
  ) async {
    List<Map> maps = await Db().db.query(
      tableName,
      columns: _columns(),
      where: "$field1 = ? AND $field2 = ?",
      whereArgs: [value1, value2],
    );

    if (maps.isEmpty) {
      return <T>[];
    }

    return maps.map((m) => buildModel(m)).toList();
  }

  ///
  @protected
  T buildModel(Map map);

  @protected
  List<String> get columns;

  @protected
  String get tableName;

  //
  List<String> _columns() => [fieldId, ...columns];
}
