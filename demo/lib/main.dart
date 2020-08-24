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
      theme: ThemeData(
        primaryColor: Colors.orange
        // primarySwatch: Colors.red
      ),
      routes: <String, WidgetBuilder> {
        '/first': (BuildContext context) => FirstScreen(),
        '/second': (BuildContext context) => SecondScreen(title: 'title', content: 'content',),
      },
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
