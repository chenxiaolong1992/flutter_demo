import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_demo/utils/http/http.dart';
=======
>>>>>>> e7ea242341d86e29061e7a95c3d1c419c24a40c2
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
<<<<<<< HEAD
        onPressed: () {},
        child: Text("点击登录1111"),
=======
        onPressed: () {
          print("点击了按钮");
          this.requestData();
        },
        child: Text("点击登录1111222"),
>>>>>>> e7ea242341d86e29061e7a95c3d1c419c24a40c2
      ),
    );
  }
  Future<void> requestData() async {
    Map<String,dynamic> entry = {
      "account":'123',
      "password":"12333"
    };
     
    final response = await HttpUtils.post('login', data: entry);
    print(response);
  }
}
