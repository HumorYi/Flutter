import 'package:flutter/material.dart';
import 'package:project/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      home: FlowerApp(),
    );
  }
}