import 'dart:convert';

import 'package:flutter/foundation.dart';

class Company {
  final String logo;
  final String name;
  final String location;
  final String type;
  final String size;
  final String employee;
  final String hot;
  final String count;
  final String inc;

  Company({
    @required this.logo,
    @required this.name,
    @required this.location,
    @required this.type,
    @required this.size,
    @required this.employee,
    @required this.hot,
    @required this.count,
    @required this.inc
  });

  static List<Company> jsonToList(String json) {
    List<Company> modelList = new List<Company>();
    List list = jsonDecode(json)['list'];

    list.forEach((item) {
      modelList.add(Company.mapToModel(item));
    });

    return modelList;
  }

  static Company mapToModel(Map map) {
    return new Company(
      logo: map['logo'],
      name: map['name'],
      location: map['location'],
      type: map['type'],
      size: map['size'],
      employee: map['employee'],
      hot: map['hot'],
      count: map['count'],
      inc: map['inc']
    );
  }
}
