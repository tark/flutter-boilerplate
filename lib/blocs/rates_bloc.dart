import 'dart:async';

import 'package:flutter_boilerplate/models/rate.dart';
import 'package:flutter_boilerplate/repository/rates_repository.dart';

import 'favorite_event.dart';

class RatesBloc {
  //
  var _rates = <Rate>[];
  var _favoritesCurrencies = Set<String>();
  final _ratesController = StreamController<List<RateData>>();
  final _favoriteEventController = StreamController<FavoriteEvent>();

  //
  RatesBloc() {
    _favoriteEventController.stream.listen(_mapEventToState);
  }

  fetchRates() async {
    print('fetchRates');
    _rates = await RatesRepository().getAll();
    _refreshRates();
  }

  Stream<List<RateData>> get rates => _ratesController.stream;

  Sink<FavoriteEvent> get favoriteEvents => _favoriteEventController.sink;

  //
  void dispose() {
    print('dispose');
    _ratesController.close();
    _favoriteEventController.close();
  }

  //
  _refreshRates() {
    print('refreshRates');
    _ratesController.sink.add(_rates
        .map((r) => RateData(r, _favoritesCurrencies.contains(r.currency)))
        .toList());
  }

  _mapEventToState(FavoriteEvent event) {
    print('_mapEventToState');

    switch (event.runtimeType) {
      case AddToFavoriteEvent:
        _favoritesCurrencies.add(event.currency);
        break;
      case RemoveFromFavoriteEvent:
        _favoritesCurrencies.remove(event.currency);
        break;
    }

    _refreshRates();
  }
}

class RateData {
  final Rate rate;
  final bool isFavorite;

  RateData(this.rate, this.isFavorite);
}
