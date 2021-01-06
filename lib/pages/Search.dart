import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  // final arguments;
  Map arguments;
  SearchPage({Key key,this.arguments}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState(arguments:this.arguments);
}

class _SearchPageState extends State<SearchPage> {
  Map arguments;
  _SearchPageState({this.arguments});
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title:Text("搜索${arguments["id"]}"),
         ),
         body: Text("我是搜索界面"),
       ),
    );
  }
}