import 'package:sqflite/sqflite.dart';

import 'rates_dao.dart';

const path = 'flutter-boilerplate.db';
const fieldId = 'id';

class Db {
  //
  var ratesDao = RatesDao();

  //
  Database _db;

  Database get db {
    _check();
    return _db;
  }

  ///
  static final Db _singleton = Db._internal();

  factory Db() => _singleton;

  Future<Database> get() async {
    return db ?? await _initDb();
  }

  Batch get batch {
    _check();
    return _db.batch();
  }

  Future close() async => _db.close();

  ///
  Db._internal() {
    init();
  }

  ///
  init() async {
    _db = await _initDb();
  }

  _check() {
    if (_db == null) {
      throw Exception('Database wasn\'t initialized');
    }
  }

  Future<Database> _initDb() async {
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          create table ${Tables.rates} ( 
            $fieldId integer primary key autoincrement, 
            ${RateModel.currency} text,
            ${RateModel.fifteenMinutes} real,
            ${RateModel.last} real,
            ${RateModel.buy} real,
            ${RateModel.sell} real,
            ${RateModel.symbol} text)
          ''');
      },
    );
  }
}

class Tables {
  static final rates = "rates";
}

class RateModel {
  static final currency = "currency";
  static final fifteenMinutes = "fifteenMinutes";
  static final last = "last";
  static final buy = "buy";
  static final sell = "sell";
  static final symbol = "symbol";
}
