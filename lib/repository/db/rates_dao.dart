import 'package:flutter_boilerplate/models/rate.dart';

import 'base_dao.dart';
import 'db.dart';

class RatesDao extends BaseDao<Rate> {
  @override
  Rate buildModel(Map map) => Rate.fromJson(map);

  @override
  List<String> get columns => [
        RateModel.currency,
        RateModel.fifteenMinutes,
        RateModel.last,
        RateModel.buy,
        RateModel.sell,
        RateModel.symbol,
      ];

  @override
  String get tableName => Tables.rates;
}
