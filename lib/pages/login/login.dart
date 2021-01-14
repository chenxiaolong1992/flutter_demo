import 'package:flutter/material.dart';
import '../../utils/http/http_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          print("点击了按钮");
          this.requestData();
        },
        child: Text("点击登录1111222"),
      ),
    );
  }
  Future<void> requestData() async {
    Map<String,dynamic> entry = {
      "account":'123',
      "password":"12333"
    };
     
    final response = await HttpUtils.post('login', data: entry);
    if(response["code"] == 0){

    }else{
      Fluttertoast.showToast(
        msg: response["message"],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        // backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
    print(response);
  }
}
