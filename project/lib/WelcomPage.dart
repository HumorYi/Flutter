import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/Application.dart';
import 'package:project/home.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int second = 5;
  int interval = 1;

  Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: interval), (timer) {
      if (second == 1) {
        _timer.cancel();
        _timer = null;

        goHomePage();
      }

      setState(() {
        second -= 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryContext = MediaQuery.of(context);
    final size = mediaQueryContext.size;

    Application.screenWidth = size.width;
    Application.screenHeight = size.height;
    Application.statusBarHeight = mediaQueryContext.padding.top;
    Application.bottomBarHeight = mediaQueryContext.padding.bottom;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.zero,
            child: Image.asset(
              'assets/images/SplashBgImage.jpg',
              height: Application.screenHeight,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: Application.statusBarHeight,
            right: 20,
            child: Chip(
              label: Text('$second秒'),
              backgroundColor: Colors.transparent,
            ),
          )
        ],
      ),
    );
  }

  goHomePage() {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (conetxt) => FlowerApp()),
      (route) => route == null
    );
  }
}