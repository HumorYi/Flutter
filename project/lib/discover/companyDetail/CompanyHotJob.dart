import 'package:flutter/material.dart';

class CompanyHotJob extends StatelessWidget {
  const CompanyHotJob({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: '富文本',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black
                ),
                children: <InlineSpan>[
                  TextSpan(
                    text: '富文本 children1 ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red
                    )
                  ),
                  TextSpan(
                    text: '富文本 children2 ',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue
                    )
                  ),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}