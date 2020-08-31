import 'package:flutter/material.dart';
import 'package:project/Application.dart';
import 'package:project/discover/Company.dart';
import 'package:project/discover/companyDetail/CompanyHotJob.dart';
import 'package:project/discover/companyDetail/CompanyInc.dart';
import 'package:project/discover/companyDetail/CompanyInfo.dart';
import 'package:project/discover/companyDetail/DotsIndicator.dart';

class CompanyDetailScreen extends StatefulWidget {
  final Company _company;

  CompanyDetailScreen(this._company);

  @override
  _CompanyDetailScreenState createState() => _CompanyDetailScreenState();
}

class _CompanyDetailScreenState extends State<CompanyDetailScreen> with TickerProviderStateMixin{
  final double _bannerHeight = 250;

  List<Widget> _imagePages = <Widget>[];
  List<String> _urls = [
    'https://img.bosszhipin.com/beijin/mcs/chatphoto/20170725/861159df793857d6cb984b52db4d4c9c.jpg',
    'https://img2.bosszhipin.com/mcs/chatphoto/20151215/a79ac724c2da2a66575dab35384d2d75532b24d64bc38c29402b4a6629fcefd6_s.jpg',
    'https://img.bosszhipin.com/beijin/mcs/chatphoto/20180207/c15c2fc01c7407b98faf4002e682676b.jpg'
  ];

  List<Tab> _tabs = [];
  TabController _controller;
  int _tabActiveIndex = 0;

  @override
  void initState() {
    super.initState();

    _urls.forEach((String url) {
      _imagePages.add(
        Container(
          color: Colors.black,
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Image.network(
              url,
              height: _bannerHeight,
              fit: BoxFit.cover
            ),
          ),
        )
      );
    });

    _tabs = [
      Tab(text: '公司概况'),
      Tab(text: '热招职位')
    ];

    _controller = TabController(length: _tabs.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _tabActiveIndex = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox.fromSize(
                  size: Size.fromHeight(_bannerHeight),
                  child: IndicatorViewPager(pages: _imagePages),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      CompanyInfo(widget._company),
                      Divider(),
                      TabBar(
                        tabs: _tabs,
                        controller: _controller,
                        labelColor: Colors.black,
                        labelStyle: TextStyle(
                          fontSize: 16
                        ),
                        indicatorWeight: 3,
                        // indicatorSize: TabBarIndicatorSize.label,
                        /* onTap: (index) {
                          this.setState(() {
                            _tabActiveIndex = index;
                          });
                        }, */
                      ),
                      IndexedStack(
                        index: _tabActiveIndex,
                        children: [
                          CompanyInc(),
                          CompanyHotJob()
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: Application.statusBarHeight,
            child: BackButton(color: Colors.white)
          )
        ],
      )
    );
  }
}