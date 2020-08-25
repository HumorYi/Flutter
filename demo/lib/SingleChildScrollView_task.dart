import 'package:flutter/material.dart';

class SingleChildScrollViewTask extends StatelessWidget {
  final List<String> items = List.generate(150, (index) => 'item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollViewTask 的使用'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: items.map((item) => Text(item, style: TextStyle(fontSize: 20))).toList(),
          ),
        ),
      ),
    );
  }
}