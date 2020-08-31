import 'package:flutter/material.dart';
import 'package:project/discover/Company.dart';

class CompanyInfo extends StatelessWidget {
  final Company company;

  CompanyInfo(this.company);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10, right: 10),
              child: Image.network(company.logo, width: 50, height: 50),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  company.name,
                  style: TextStyle(fontSize: 15, color: Colors.black)
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    company.location,
                    style: TextStyle(fontSize: 13, color: Colors.grey)
                  ),
                ),
                Text(
                  company.type + ' | ' + company.size + ' | ' + company.employee,
                  style: TextStyle(fontSize: 13, color: Colors.grey)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}