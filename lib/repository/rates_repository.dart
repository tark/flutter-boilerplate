import 'dart:async';

import '../models/rate.dart';
import 'Api.dart';

class RatesRepository {
  //
  static final RatesRepository _singleton = RatesRepository._internal();

  factory RatesRepository() => _singleton;

  //
  Future<List<Rate>> getAll() async {
    return await Api().getRates();
  }

  ///
  RatesRepository._internal();
}
