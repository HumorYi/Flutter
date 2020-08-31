import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TrendScreen extends StatefulWidget {

  @override
  _TrendScreenState createState() => _TrendScreenState();
}

class _TrendScreenState extends State<TrendScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String _username = '';

  @override
  void setState(fn) {
    super.setState(fn);

    readUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动态'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              savaUsername('HumorYi');
            },
            child: Text('set username'),
          ),
          RaisedButton(
            onPressed: () {
              savaUsername('');
            },
            child: Text('reset username'),
          ),
          FlatButton(
            onPressed: () {
              readUsername();
            },
            child: Text('read username'),
          ),
          Text('$_username')
        ],
      )
    );
  }

  savaUsername(String username) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('username', username);

    this.setState(() {
      _username = username;
    });
  }

  readUsername() async {
    final SharedPreferences prefs = await _prefs;
    var content = prefs.getString('username');

    this.setState(() {
      _username = content != null ? content : '';
    });
  }

}