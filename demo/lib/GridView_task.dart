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
      body: getGridView4(),
    );
  }

  Widget getGridView1() {
    return GridView.count(
      // 水平子Widget之间距
      crossAxisSpacing: 10,
      // 垂直子Widget之间距
      mainAxisSpacing: 10,
      // 子 Widget 宽高比，默认 1
      childAspectRatio: 2,
      // 一行展示 Widget 数量
      crossAxisCount: 2,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: getWidgetList(),
    );
  }

  Widget getGridView2() {
    return GridView.builder(
      // SliverGridDelegateWithFixedCrossAxisCount 构建⼀个横轴固定数量 Widget
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
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
      // 水平方向元素个数不再固定，其水平个数也就是有几列，由 maxCrossAxisExtent 和屏幕的宽度以及 padding 和 mainAxisSpacing 等决定
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

  Widget getGridView4() {
    return GridView.custom(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 20.0
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, position) => getItemContainer(items[position]),
        childCount: items.length
      )
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