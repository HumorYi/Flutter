import 'package:flutter/material.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('银行'),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body:
        /* Container(
          color: Colors.red,
        ), */
        Center(
          child: Column(
            children: <Widget>[
              Text('银行0', style: TextStyle(color: Colors.red, fontSize: 20)),
              Text('银行1', style: TextStyle(color: Colors.red, fontSize: 20)),
              Text('银行2', style: TextStyle(color: Colors.red, fontSize: 20)),
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                // margin: EdgeInsets.all(10),
                // margin: EdgeInsets.only(bottom: 10, right: 10),
                // margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                // margin: EdgeInsets.fromLTRB(10, 20, 30, 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('1'),
                    Text('2'),
                    Text('3'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('4'),
                        Text('5'),
                        Text('6'),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        /* Row(
          children: <Widget>[
            Text('银行0', style: TextStyle(color: Colors.red, fontSize: 20)),
            Text('银行1', style: TextStyle(color: Colors.red, fontSize: 20)),
            Text('银行2', style: TextStyle(color: Colors.red, fontSize: 20)),
          ],
        ), */
        /* Column(
          children: <Widget>[
            Text('银行0', style: TextStyle(color: Colors.red, fontSize: 20)),
            Text('银行1', style: TextStyle(color: Colors.red, fontSize: 20)),
            Text('银行2', style: TextStyle(color: Colors.red, fontSize: 20)),
          ],
        ), */
        /* Center(
          child: Text('银行'),
        ), */
      floatingActionButton: new Theme(
        data: ThemeData(accentColor: Colors.yellow),
        // data: Theme.of(context).copyWith(accentColor: Colors.yellow),
        child: new FloatingActionButton(
          onPressed: null,
          child: new Icon(Icons.add),
        ),
      ),
    );
  }
}