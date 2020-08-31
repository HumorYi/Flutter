import 'package:flutter/material.dart';
import 'package:project/WelcomPage.dart';
import 'package:project/discover/companyDetail/CompanyDetailScreen.dart';
import 'package:project/home.dart';
import 'package:project/manager/ThirdScreen.dart';
import 'package:project/provider/discover_lsit.dart';
import 'package:provider/provider.dart';

/* void main() {
  runApp(MyApp());
} */

void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => DiscoverListProvider())
  ],
  child: MyApp()
));


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