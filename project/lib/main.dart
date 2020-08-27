import 'package:flutter/material.dart';
import 'package:project/WelcomPage.dart';
import 'package:project/discover/companyDetail/CompanyDetailScreen.dart';
import 'package:project/discover/companyDetail/ThirdScreen.dart';
import 'package:project/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      // home: FlowerApp(),
      home: WelcomePage(),
      routes: {
        '/third': (BuildContext context) {
          return ThirdScreen();
        }
        /* '/companyDetail': (BuildContext context) {
          return CompanyDetailScreen();
        } */
      },
    );
  }
}