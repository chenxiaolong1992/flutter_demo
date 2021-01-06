import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  FormPage({Key key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("表单界面")),
      floatingActionButton: FloatingActionButton(
        child: Text("返回"),
        onPressed: (){
          Navigator.of(context).pop(

          );
        },
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("我是表单界面"),
          ),
          ListTile(
            title: Text("我是表单界面"),
          ),
          ListTile(
            title: Text("我是表单界面"),
          ),
        ],
      ),
    );
  }
}
