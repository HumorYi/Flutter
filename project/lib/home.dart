import 'package:flutter/material.dart';
import 'package:project/discover/DiscoverScreen.dart';
import 'package:project/manager/ManagerScreen.dart';
import 'package:project/mine/MineScreen.dart';
import 'package:project/trend/TrendScreen.dart';

class FlowerApp extends StatefulWidget {
  FlowerApp({Key key}) : super(key: key);

  @override
  _FlowerAppState createState() => _FlowerAppState();
}

class _FlowerAppState extends State<FlowerApp> {
  final List<Widget> _children = [
    TrendScreen(),
    DiscoverScreen(),
    ManagerScreen(),
    MineScreen()
  ];

  int _currentIndex = 0;

  List<BottomNavigationBarItem> _itemList = [
    BottomNavigationBarItem(
      icon: Icon(Icons.ac_unit),
      /* icon: Image.asset(
        'assets/images/discovery_normal.png',
        width: 24,
        height: 24,
      ), */
      title: Text('好友'),
      /* activeIcon: Image.asset(
        'assets/images/discovery_selected.png',
        width: 24,
        height: 24,
      ) */
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.ac_unit),
      /* icon: Image.asset(
        'assets/images/discovery_normal.png',
        width: 24,
        height: 24,
      ), */
      title: Text('发现'),
      /* activeIcon: Image.asset(
        'assets/images/discovery_selected.png',
        width: 24,
        height: 24,
      ) */
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.ac_unit),
      /* icon: Image.asset(
        'assets/images/discovery_normal.png',
        width: 24,
        height: 24,
      ), */
      title: Text('管理'),
      /* activeIcon: Image.asset(
        'assets/images/discovery_selected.png',
        width: 24,
        height: 24,
      ) */
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.ac_unit),
      /* icon: Image.asset(
        'assets/images/discovery_normal.png',
        width: 24,
        height: 24,
      ), */
      title: Text('我的'),
      /* activeIcon: Image.asset(
        'assets/images/discovery_selected.png',
        width: 24,
        height: 24,
      ) */
    ),
  ];

  onTapAction(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTapAction,
        items: _itemList,
        currentIndex: _currentIndex,
        selectedItemColor: Color.fromARGB(255, 242, 89, 63),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}