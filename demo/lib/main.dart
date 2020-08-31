import 'package:demo/Screen/BalanceScreen.dart';
import 'package:demo/Screen/ContactScreen.dart';
import 'package:demo/Screen/MusicScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/second',

      // ThemeData({
      //   Brightness brightness, //深⾊色还是浅⾊色
      //   MaterialColor primarySwatch, //主题颜⾊色样本
      //   Color primaryColor, //主⾊色，决定导航栏颜⾊色
      //   Color accentColor, //次级⾊色，决定⼤大多数Widget的颜⾊色，如进度条、开关等。
      //   Color cardColor, //卡⽚片颜⾊色
      //   Color dividerColor, //分割线颜⾊色
      //   ButtonThemeData buttonTheme, //按钮主题
      //   Color cursorColor, //输⼊入框光标颜⾊色
      //   Color dialogBackgroundColor,//对话框背景颜⾊色
      //   String fontFamily, //⽂文字字体
      //   TextTheme textTheme,// 字体主题，包括标题、body等⽂文字样式
      //   IconThemeData iconTheme, // Icon的默认样式
      //   TargetPlatform platform, //指定平台，应⽤用特定平台控件⻛风格
      // })
      theme: ThemeData(
        primaryColor: Colors.orange,
        backgroundColor: Colors.white,
        // accentColor: Colors.cyan[600],
        // primarySwatch: Colors.red
      ),
      routes: <String, WidgetBuilder> {
        '/first': (BuildContext context) => FirstScreen(),
        '/second': (BuildContext context) => SecondScreen(title: 'title', content: 'content',),
      },
      // onGenerateRoute: RouteFactory 类型，路由回调函数。
      // 当通过Navigator.of(context).pushNamed跳转的时候，如果routes查找不到会调用这个方法
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) => Text('404'));
      }
      // home: FirstScreen()
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen'), centerTitle: true,),
      body: Center(
        child: Text('first screen page content'),
      ),
    );
  }
}

/* class SecondScreen extends StatelessWidget {
 */

class SecondScreen extends StatefulWidget {
  final String title;
  final String content;

  SecondScreen({this.title, this.content});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final List<Widget> _children= [
    BalanceScreen(),
    ContactScreen(),
    MusicScreen()
  ];

  int _currentIndex = 0;

  void onTabTppend(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      drawer: Drawer(
        child: Center(
          child: Text(
            'Drawer',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.account_balance), title: Text('银行')),
          BottomNavigationBarItem(icon: Icon(Icons.contact_phone), title: Text('联系人')),
          BottomNavigationBarItem(icon: Icon(Icons.library_music), title: Text('音乐')),
        ],
        onTap: onTabTppend,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        selectedFontSize: 16,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 12,
      ),
    );
  }

}
