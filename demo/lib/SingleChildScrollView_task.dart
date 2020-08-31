import 'package:flutter/material.dart';

class SingleChildScrollViewTask extends StatelessWidget {
  final List<String> items = List.generate(150, (index) => 'item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollViewTask 的使用'),
      ),
      // 可滑动的view，类似于原生和 RN 中的 ScrollView
      body: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        // 是否按照阅读方向相反的方向滑动
        reverse: true,
        /**
         * primary：是否使用 widget 树中默认的 PrimaryScrollController 。
         * 当滑动方向为垂直方向（scrollDirection值为Axis.vertical）并且controller没有指定时，primary默认为true
         */
        /**
         * 属性接受一个ScrollPhysics对象，它决定可滚动Widget如何响应用户操作，
         * 比如用户滑动完抬起手指后，继续执行动画；或者滑动到边界时，如何显示。
         * 默认情况下，Flutter会根据具体平台分别使用不同的ScrollPhysics对象，应用不同的显示效果，
         * 如当滑动到边界时，继续拖动的话，在iOS上会出现弹性效果，而在Android上会出现微光效果。
         * 如果你想在所有平台下使用同一种效果，可以显式指定，
         *
         * Flutter SDK中包含了两个ScrollPhysics的子类可以直接使用：
         * ClampingScrollPhysics→Android下微光效果 / BouncingScrollPhysics→iOS下弹性效果
         */
        physics: AlwaysScrollableScrollPhysics(),
        // controller：此属性接受一个 ScrollController对象。ScrollController 的主要作用是控制滚动位置和监听滚动事件
        child: Center(
          child: Column(
            children: items.map((item) => Text(item, style: TextStyle(fontSize: 20))).toList(),
          ),
        ),
      ),
    );
  }
}