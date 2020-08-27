import 'package:flutter/material.dart';
import 'package:project/discover/Company.dart';

class CompanyDetailScreen extends StatefulWidget {
  final Company _company;

  CompanyDetailScreen(this._company);

  @override
  _CompanyDetailScreenState createState() => _CompanyDetailScreenState();
}

class _CompanyDetailScreenState extends State<CompanyDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('公司详情'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              '${widget._company.name}',
              style: TextStyle(
                fontSize: 30
              ),
            ),
            RaisedButton(
              child: Text('返回方式一'),
              onPressed: () {
                // 出栈
                Navigator.of(context).pop('返回数据');
              },
            ),
            RaisedButton(
              child: Text('返回方式二'),
              onPressed: () {
                // 替换栈-路由-动画不一样（更自然）
                Navigator.of(context).pushReplacementNamed('/third');
              },
            ),
            RaisedButton(
              child: Text('返回方式三'),
              onPressed: () {
                // 替换栈-路由-动画不一样
                Navigator.of(context).popAndPushNamed('/third');
              },
            ),
          ],
        )
      )
    );
  }
}