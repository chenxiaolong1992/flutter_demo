import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          child: Text("跳转到搜索界面"),
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
          onPressed: (){
            //路由跳转不传值
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context)=> SearchPage()
            //   )
            // );
            Navigator.pushNamed(context, "/search",arguments: {
              "id":123344
            });
          }
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}