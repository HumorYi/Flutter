import 'package:flutter/material.dart';

class ManagerDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('管理详情'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              '管理详情',
              style: TextStyle(
                fontSize: 30
              ),
            ),
            RaisedButton(
              child: Text('出栈返回上一页'),
              onPressed: () {
                // 出栈
                Navigator.of(context).pop('返回数据');
              },
            ),
            RaisedButton(
              child: Text('路由替换跳转'),
              onPressed: () {
                // 替换栈-路由-动画不一样（更自然）
                Navigator.of(context).pushReplacementNamed('/third');
              },
            ),
            RaisedButton(
              child: Text('先出栈再跳转路由入栈'),
              onPressed: () {
                // 替换栈-路由-动画不一样
                Navigator.of(context).popAndPushNamed('/third');
              },
            ),
          ],
        )
      ),
    );
  }
}