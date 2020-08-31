import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:project/discover/Company.dart';
import 'package:http/http.dart' as http;

class DiscoverListProvider with ChangeNotifier {
  int _page = 1;
  int _type = 1;

  List<Company> _companies = [];

  int get page => _page;

  List<Company> get companies => _companies;

  bool get isNull => _companies.length == 0;

  Future<bool> getList() async {
    var url = 'http://m.app.haosou.com/index/getData?_type=$_type&page=$_page';
    var response = await http.get(url);

    if (response.statusCode == 200) {

      if (_page == 1) {
        _companies = Company.mapToList(jsonDecode(response.body));
      }
      else {
        _companies.addAll(Company.mapToList(jsonDecode(response.body)));
      }

      notifyListeners();

      return true;
    }

    return false;
  }

  Future<bool> refresh() async {
    _page = 1;

    return await getList();
  }

  Future<bool> load() async {
    // TODO: 根据总页数来判断是否加载下一页还是提示已加载完成
    _page++;

    return await getList();
  }
}