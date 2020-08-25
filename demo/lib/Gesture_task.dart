import 'package:flutter/material.dart';

class GestureTask extends StatelessWidget {
  const GestureTask({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手势的使用'),
        centerTitle: true,
        // 设置阴影
        elevation: 10,
        leading: Text('左侧'),
        actions: <Widget>[
          Text('右侧')
        ],
      ),
      body: GestureDetector(
        onTap: () {
          print('onTap');
        },
        onLongPress: () {
          print('onLongPress');
        },
        child: Container(
          color: Color.fromARGB(255, 220, 220, 220),
          // child: Text('flutter 手势'),
          child: Center(
            child: Text('flutter 手势'),
          ),
        ),
      ),
    );
  }
}