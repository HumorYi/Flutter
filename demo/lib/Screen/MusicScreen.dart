import 'package:flutter/material.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('音乐'),
        centerTitle: true,
      ),
      body:
        Center(
          child: Text('音乐'),
        ),
    );
  }
}