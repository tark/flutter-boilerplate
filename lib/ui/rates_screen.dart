import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/favorite_event.dart';
import 'package:flutter_boilerplate/blocs/rates_bloc.dart';
import 'package:intl/intl.dart';

class RatesScreen extends StatefulWidget {
  RatesScreen({Key key}) : super(key: key);

  @override
  createState() => _RatesState();
}

class _RatesState extends State<RatesScreen> {
  var _bloc = RatesBloc();
  final _formatNumber = NumberFormat('#,##0');

  @override
  void initState() {
    super.initState();
    _bloc.fetchRates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Exchange rates'),
        ),
        body: Center(
          child: StreamBuilder<List<RateData>>(
            stream: _bloc.rates,
            initialData: [],
            builder: (context, snapshot) {
              if (snapshot.data.isEmpty) {
                return CircularProgressIndicator();
              }

              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) => _rateItem(snapshot.data[index]),
              );
            },
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  //
  Widget _rateItem(RateData rateData) {
    final rate = rateData.rate;
    return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 2.0,
            margin: EdgeInsets.only(
              top: 12.0,
              right: 12.0,
              left: 12.0,
            ),
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BTC/${rate.currency.toUpperCase()}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.black26,
                          ),
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: _formatNumber.format(rate.last),
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: '  ${rate.symbol}',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black26,
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(rateData.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border),
                    onPressed: () {
                      if (rateData.isFavorite) {
                        _removeFromFavorite(rate.currency);
                      } else {
                        _addToFavorite(rate.currency);
                      }
                    },
                    iconSize: 30.0,
                    color:
                        rateData.isFavorite ? Colors.red[600] : Colors.black26,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _addToFavorite(String currency) {
    print('_addToFavorite');
    _bloc.favoriteEvents.add(AddToFavoriteEvent(currency));
  }

  _removeFromFavorite(String currency) {
    print('_removeFromFavorite');
    _bloc.favoriteEvents.add(RemoveFromFavoriteEvent(currency));
  }

  _formattedRate(double lastRate) {
    return _formatNumber.format(lastRate);
  }
}
