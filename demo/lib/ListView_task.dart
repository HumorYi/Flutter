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

  /**
   * 方式一：ListView()
   * 特点：代码简洁，对于小批量固定数据可以考虑使用 但是数据量大则性能不好，
   * 因为这种方式创建类似于RN中的scrollView，
   * 即使还没有出现在屏幕中但仍然会被ListView所创建
   * 这将是一项较大的开销，使用不当可能引起性能问题甚至卡顿
   */
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

  /**
   * 方式二：ListView.build()：
   *  绝大多数列表类的需求都可以用 ListView.build 构造函数来解决问题
   *  itemCount : 列表中元素的数量
   *  itemBuilder : 子元素的渲染方法，允许自定义子元素组件（等同于 rn 中 FlatList 组件的 renderItem 属性）
   */
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

  /**
   * 方式三：ListView.separated()：
   *  列表子项之间需要分割线 ，此时可以考虑用此方法 separatorBuilder :构造分割线
   */
  Widget getListView3() {
    return ListView.separated(
      // scrollDirection: Axis.vertical,
      /**
       * 列表滚动至边缘后继续拖动的物理效果，
       * 安卓是一个波纹状（对应ClampingScrollPhysics ），
       * iOS是有一个回弹的弹性效果（对应BouncingScrollPhysics ），
       * 如果想同的平台上呈现各自的效果可以使用 AlwaysScrollableScrollPhysics ，它会根据同平台自动选用各自的物理效果。
       * 如果你想禁用在边缘的拖动效果，可以使用 NeverScrollableScrollPhysics ；
      */
      physics: AlwaysScrollableScrollPhysics(),
      // 该属性将决定列表的长度是否仅包裹其内容的长度。
      // 当 ListView 嵌在一个无限长的容器组件中时， shrinkWrap 必须为true，否则会给出警告
      // shrinkWrap: false,
      // 子元素长度。当列表中的每一项长度是固定的情况下可以指定该值，有助于提⾼高列表的性能（因为它可以帮助 ListView 在未实际渲染子元素之前就计算出每一项元素的位置）
      // itemExtent: 130,
      // 预渲染区域长度， ListView 会在其可视区域的两边留一个 cacheExtent 长度的区域作为预渲染区域（对于 ListView.build 或 ListView.separated 构造函数创建的列表，在可视区域和预渲染区域内的子元素会被创建或会被销毁）children：容纳子元素的组件数组
      // cacheExtent: 0,
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