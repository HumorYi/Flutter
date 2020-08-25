import 'package:demo/Gesture_task.dart';
import 'package:demo/GridView_task.dart';
import 'package:demo/ListView_task.dart';
import 'package:demo/SingleChildScrollView_task.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.orange,
        // primarySwatch: Colors.red
      ),
      // home: GestureTask()
      // home: ListViewTask()
      // home: GridViewTask()
      home: SingleChildScrollViewTask()
    );
  }
}