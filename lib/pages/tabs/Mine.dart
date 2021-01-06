import 'package:flutter/material.dart';
import "../Form.dart";

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);
 
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text("跳转到表单界面并传值"),
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
          onPressed: (){
            //路由跳转传值
            Navigator.of(context).push(
              MaterialPageRoute(builder: (content)=>FormPage())
            );
          }
        )
      ],
    );
  }
}