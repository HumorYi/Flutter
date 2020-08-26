import 'package:flutter/material.dart';
import 'package:project/discover/Company.dart';

class CompanyItem extends StatelessWidget {
  final Company model;

  CompanyItem(this.model);

  @override
  Widget build(BuildContext context) {
    double left = 10;
    double top = 5;

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
        child: Card(
          elevation: 10,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: left, top: top, right: left),
                child: Row(
                  children: <Widget>[
                    Image.network(model.logo, width: 50, height: 50),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                      child: Text(
                        model.location.substring(
                            0,
                            model.location.length > 6
                                ? 6
                                : model.location.length),
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '| ' + model.type,
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '| ' + model.size,
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '| ' + model.employee,
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(left: left, top: top, bottom: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "热招：" + model.hot + " 等" + model.count + " 个职位",
                      style: new TextStyle(fontSize: 13.0, color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Icon(Icons.keyboard_arrow_right, color: Colors.grey)
                        ],
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
        ));
  }
}
