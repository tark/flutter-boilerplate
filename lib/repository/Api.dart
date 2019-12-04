import 'dart:async';
import 'dart:convert';

import 'package:flutter_boilerplate/models/rate.dart';
import 'package:http/http.dart' as http;

class HttpStatus {
  static const ok = 200;
  static const badRequest = 400;
  static const notFound = 404;
  static const notAllowed = 405;
}

class Api {
  //
  static final Api _singleton = Api._internal();

  factory Api() => _singleton;

  Future<List<Rate>> getRates() async {
    var response = await http.read("https://blockchain.info/ticker");
    Map<dynamic, dynamic> responseObject = jsonDecode(response);
    print(responseObject);
    return responseObject.entries
        .map((entry) => Rate.fromJson(entry.value)
          ..currency = (entry.key as String).toLowerCase())
        .toList();
  }

  //
  Api._internal();
}
