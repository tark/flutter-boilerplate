import 'package:flutter/material.dart';

import 'ui/rates_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exchange rates',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: RatesScreen(),
    );
  }
}
