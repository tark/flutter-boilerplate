/*
{
  "USD" : {"15m" : 7153.53, "last" : 7153.53, "buy" : 7153.53, "sell" : 7153.53, "symbol" : "$"},
  "AUD" : {"15m" : 10463.39, "last" : 10463.39, "buy" : 10463.39, "sell" : 10463.39, "symbol" : "$"},
  "BRL" : {"15m" : 30082.02, "last" : 30082.02, "buy" : 30082.02, "sell" : 30082.02, "symbol" : "R$"},
  "CAD" : {"15m" : 9506.05, "last" : 9506.05, "buy" : 9506.05, "sell" : 9506.05, "symbol" : "$"},
  "CHF" : {"15m" : 7061.95, "last" : 7061.95, "buy" : 7061.95, "sell" : 7061.95, "symbol" : "CHF"},
  "CLP" : {"15m" : 5747859.78, "last" : 5747859.78, "buy" : 5747859.78, "sell" : 5747859.78, "symbol" : "$"},
  "CNY" : {"15m" : 50548.97, "last" : 50548.97, "buy" : 50548.97, "sell" : 50548.97, "symbol" : "¥"},
  "DKK" : {"15m" : 48244.36, "last" : 48244.36, "buy" : 48244.36, "sell" : 48244.36, "symbol" : "kr"},
  "EUR" : {"15m" : 6460.89, "last" : 6460.89, "buy" : 6460.89, "sell" : 6460.89, "symbol" : "€"},
  "GBP" : {"15m" : 5502.87, "last" : 5502.87, "buy" : 5502.87, "sell" : 5502.87, "symbol" : "£"},
  "HKD" : {"15m" : 56004.73, "last" : 56004.73, "buy" : 56004.73, "sell" : 56004.73, "symbol" : "$"},
  "INR" : {"15m" : 513551.76, "last" : 513551.76, "buy" : 513551.76, "sell" : 513551.76, "symbol" : "₹"},
  "ISK" : {"15m" : 869081.84, "last" : 869081.84, "buy" : 869081.84, "sell" : 869081.84, "symbol" : "kr"},
  "JPY" : {"15m" : 775829.39, "last" : 775829.39, "buy" : 775829.39, "sell" : 775829.39, "symbol" : "¥"},
  "KRW" : {"15m" : 8534659.44, "last" : 8534659.44, "buy" : 8534659.44, "sell" : 8534659.44, "symbol" : "₩"},
  "NZD" : {"15m" : 10980.51, "last" : 10980.51, "buy" : 10980.51, "sell" : 10980.51, "symbol" : "$"},
  "PLN" : {"15m" : 27641.68, "last" : 27641.68, "buy" : 27641.68, "sell" : 27641.68, "symbol" : "zł"},
  "RUB" : {"15m" : 458666.32, "last" : 458666.32, "buy" : 458666.32, "sell" : 458666.32, "symbol" : "RUB"},
  "SEK" : {"15m" : 68155.92, "last" : 68155.92, "buy" : 68155.92, "sell" : 68155.92, "symbol" : "kr"},
  "SGD" : {"15m" : 9761.2, "last" : 9761.2, "buy" : 9761.2, "sell" : 9761.2, "symbol" : "$"},
  "THB" : {"15m" : 216680.36, "last" : 216680.36, "buy" : 216680.36, "sell" : 216680.36, "symbol" : "฿"},
  "TWD" : {"15m" : 218246.97, "last" : 218246.97, "buy" : 218246.97, "sell" : 218246.97, "symbol" : "NT$"}
}
 */

import 'package:flutter_boilerplate/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rate.g.dart';

@JsonSerializable()
class Rate extends BaseModel {
  //
  String currency;
  double fifteenMinutes;
  double last;
  double buy;
  double sell;
  String symbol;

  //
  factory Rate.fromJson(Map<String, dynamic> json) => _$RateFromJson(json);

  Map<String, dynamic> toJson() => _$RateToJson(this);

  Rate();
}
