import 'package:flutter/material.dart';

class ListViewTask extends StatefulWidget {
  ListViewTask({Key key}) : super(key: key);

  @override
  _ListViewTaskState createState() => _ListViewTaskState();
}

class _ListViewTaskState extends State<ListViewTask> {
  final List<String> items = List.generate(50, (index) => 'item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表的使用'),
        centerTitle: true,
      ),
      body: getListView3(),
    );
  }

  Widget getListView1() {
    return ListView(
      children: <Widget>[
        Text('data1'),
        Text('data2'),
        Text('data3'),
        Text('data4'),
        Text('data5'),
        Text('data6'),
      ],
    );
  }

  Widget getListView2() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Text(items[index]),
        );
      },
      itemCount: items.length,
    );
  }

  Widget getListView3() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Text(items[index]),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(color: Colors.red,);
      },
      itemCount: items.length
    );
  }
}