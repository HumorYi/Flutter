import "package:flutter/material.dart";
import "package:project/discover/DiscoverScreen.dart";
import "package:project/manager/ManagerScreen.dart";
import "package:project/mine/MineScreen.dart";
import "package:project/trend/TrendScreen.dart";

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

  final double width = 24;
  final double height = 24;

  int _currentIndex = 0;

  List<Map> _navigationBarList = [
    {
      "imgUrl": "assets/images/invite_normal.png",
      "activeImgUrl": "assets/images/invite_selected.png",
      "text": "好友"
    },
    {
      "imgUrl": "assets/images/discovery_normal.png",
      "activeImgUrl": "assets/images/discovery_selected.png",
      "text": "发现"
    },
    {
      "imgUrl": "assets/images/manager_normal.png",
      "activeImgUrl": "assets/images/manager_selected.png",
      "text": "管理"
    },
    {
      "imgUrl": "assets/images/mine_normal.png",
      "activeImgUrl": "assets/images/mine_selected.png",
      "text": "我的"
    },
  ];

  // List<BottomNavigationBarItem> _itemList = [];

  List<BottomNavigationBarItem> _itemList = [
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/images/invite_normal.png",
        width: 24, height: 24,
      ),
      title: new Text("好友"),
      activeIcon: Image.asset(
        "assets/images/invite_selected.png",
        width: 24, height: 24
      )
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/images/discovery_normal.png",
        width: 24, height: 24
      ),
      title: new Text("发现"),
      activeIcon: Image.asset(
        "assets/images/discovery_selected.png",
        width: 24, height: 24
      )
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/images/manager_normal.png",
        width: 24, height: 24
      ),
      title: new Text("管理"),
      activeIcon: Image.asset(
        "assets/images/manager_selected.png",
        width: 24, height: 24
      )
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/images/mine_normal.png",
        width: 24, height: 24
      ),
      title: new Text("我的"),
      activeIcon: Image.asset(
        "assets/images/mine_selected.png",
        width: 24, height: 24
      )
    ),
  ];

  @override
  void initState() {
    super.initState();

    /* _navigationBarList.forEach((Map item) {
      _itemList.add(BottomNavigationBarItem(
        // icon: Image.asset(item["imgUrl"], width: width, height: height),
        icon: Image.asset("assets/images/mine_normal.png", width: width, height: height),
        title: Text(item["text"]),
        // activeIcon: Image.asset(item["activeImgUrl"], width: width,height: height)
        activeIcon: Image.asset("assets/images/mine_selected.png", width: width,height: height)
      ));
    }); */
  }

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