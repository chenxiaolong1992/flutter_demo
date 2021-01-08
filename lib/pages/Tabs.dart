import 'package:flutter/material.dart';
import './tabs/Home.dart';
import './tabs/Setting.dart';
import './tabs/Mine.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  
  int _currentIndex = 0;
  List _pagesList = [
    HomePage(),
    SettingPage(),
    MinePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
        appBar: AppBar(
          title: Text("flutter Demo"),
        ),
        body: this._pagesList[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,//配置当前的索引值
          onTap: (int index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          fixedColor: Colors.red,//设置底部导航栏颜色
          iconSize: 25,//设置底部导航栏icon的大小
          type: BottomNavigationBarType.fixed,//设置底部导航栏可以有多个
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text("我的")),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("设置")),
        ]),
      ),
    );
  }
}
