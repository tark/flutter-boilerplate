// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rate _$RateFromJson(Map<String, dynamic> json) {
  return Rate()
    ..currency = json['currency'] as String
    ..fifteenMinutes = json['fifteenMinutes'] as double
    ..last = json['last'] as double
    ..buy = json['buy'] as double
    ..sell = json['sell'] as double
    ..symbol = json['symbol'] as String;
}

Map<String, dynamic> _$RateToJson(Rate instance) => <String, dynamic>{
      'currency': instance.currency,
      'fifteenMinutes': instance.fifteenMinutes,
      'last': instance.last,
      'buy': instance.buy,
      'sell': instance.sell,
      'symbol': instance.symbol,
    };
