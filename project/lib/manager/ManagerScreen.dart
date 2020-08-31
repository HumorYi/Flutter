import 'package:flutter/material.dart';
import 'package:project/manager/ManagerDetailScreen.dart';

class ManagerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('管理'),
      ),
      body: InkWell(
        child: Text('跳转到管理详情'),
        onTap: () {
          Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (context) => ManagerDetailScreen()
            )
          );
        },
      ),
    );
  }
}