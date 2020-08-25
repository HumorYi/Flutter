import 'package:flutter/material.dart';

class GridViewTask extends StatefulWidget {
  GridViewTask({Key key}) : super(key: key);

  @override
  _GridViewTaskState createState() => _GridViewTaskState();
}

class _GridViewTaskState extends State<GridViewTask> {
  final List<String> items = List.generate(50, (index) => 'item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView 的使用'),
        centerTitle: true,
      ),
      body: getGridView3(),
    );
  }

  Widget getGridView1() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 20,
      // 宽高比，默认 1
      childAspectRatio: 2,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: getWidgetList(),
    );
  }

  Widget getGridView2() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // 横向展示个数
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        // 宽高比，默认 1
        childAspectRatio: 2,
      ),
      itemBuilder: (context, index) {
        return getItemContainer(items[index]);
      },
      itemCount: items.length,
    );
  }

  Widget getGridView3() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        // 横向最大宽度
        maxCrossAxisExtent: 100,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2
      ),
      itemBuilder: (context, index) {
        return getItemContainer(items[index]);
      },
      itemCount: items.length,
    );
  }

  List<Widget> getWidgetList() {
    return items.map((item) => getItemContainer(item)).toList();
  }

  Widget getItemContainer(String item) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        item,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
      ),
      color: Colors.blue,
    );
  }
}