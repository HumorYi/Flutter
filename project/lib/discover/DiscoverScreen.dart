import 'package:flutter/material.dart';
import 'package:project/discover/Company.dart';
import 'package:project/discover/CompanyItem.dart';
import 'package:project/discover/companyDetail/CompanyDetailScreen.dart';
import 'package:project/provider/discover_lsit.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DiscoverScreen extends StatefulWidget {
  DiscoverScreen({Key key}) : super(key: key);

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  ScrollController _scrollController = ScrollController();

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  DiscoverListProvider _provider;

  @override
  void initState() {
    super.initState();

    _provider = Provider.of<DiscoverListProvider>(context, listen: false);

    _provider.refresh();
  }

  _buildContent() {
    return Consumer<DiscoverListProvider> (
      builder: (context, provider, _) {
        return IndexedStack(
          index: provider.isNull ? 0 : 1,
          children: <Widget>[
            Center(child: CircularProgressIndicator()),
            _buildListView()
          ],
        );
      },
    );
  }

  _buildListView() {
    return SmartRefresher(
      child: ListView.builder(
        itemBuilder: (context, index) {
          Company model = _provider.companies[index];

          return InkWell(
            child: CompanyItem(model),
            onTap: () {
              // 方式1：动态路由跳转 - 传输数据
              Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
                return CompanyDetailScreen(model);
              })).then((value) {
                // value 进入页面时传递的参数，跳转路由、导航等
                print(value);
              });
            },
          );
        },
        itemCount: _provider.companies.length,
      ),
      enablePullDown: true,
      enablePullUp: true,
      header: ClassicHeader(
        refreshingText: '正在加载更多...',
        idleText: '下拉刷新',
        completeText: '加载完成',
        releaseText: '松开刷新',
      ),
      footer: ClassicFooter(
        idleText: '加载更多数据',
        loadingText: '玩命加载中...',
        noDataText: '没有更多数据',
        canLoadingText: '松开加载',
      ),
      onLoading: _onLoading,
      onRefresh: _onRefresh,
      controller: _refreshController,
    );
  }

  _onLoading() async {
    bool isSuccess = await _provider.load();

    isSuccess ? _refreshController.loadComplete() : _refreshController.loadFailed();
  }

  _onRefresh() async {
    bool isSuccess = await _provider.refresh();

    isSuccess ? _refreshController.refreshCompleted() : _refreshController.refreshFailed();
  }

  // https://pub.flutter-io.cn/packages/pull_to_refresh
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发现'),
      ),
      body: _buildContent()
    );
  }
}
