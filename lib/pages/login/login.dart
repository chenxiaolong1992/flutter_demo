import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/http/http.dart';
import '../../utils/http/http_utils.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  login() {
   HttpUtils.post('./login')
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {},
        child: Text("点击登录1111"),
      ),
    );
  }
}
