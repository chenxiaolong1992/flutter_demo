import 'package:flutter/material.dart';
import '../../utils/http/http_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:encrypt/encrypt.dart' hide Key;

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  String name;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/login_bg.jpg"),
              fit: BoxFit.fill,
            )),
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 200, 30, 0),
              child: Column(
                children: <Widget>[
                  TextField(
                    autofocus: true,
                    focusNode: focusNode1, //关联focusNode1
                    cursorRadius: Radius.circular(20),
                    cursorWidth: 2,
                    onChanged: (value) {
                      this.name = value;
                    },
                    decoration: InputDecoration(
                      hintText: '请输入手机号',

                      /// 边框
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          /// 里面的数值尽可能大才是左右半圆形，否则就是普通的圆角形
                          Radius.circular(50),
                        ),
                      ),

                      ///设置内容内边距
                      contentPadding: EdgeInsets.only(
                        top: 0,
                        bottom: 0,
                      ),

                      /// 前缀图标
                      prefixIcon: Icon(Icons.phone_iphone),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    focusNode: focusNode2, //关联focusNode2
                    onChanged: (value) {
                      this.password = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: '请输入密码',

                      /// 边框
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          /// 里面的数值尽可能大才是左右半圆形，否则就是普通的圆角形
                          Radius.circular(50),
                        ),
                      ),

                      ///设置内容内边距
                      contentPadding: EdgeInsets.only(
                        top: 0,
                        bottom: 0,
                      ),

                      /// 前缀图标
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.all(0),
                      height: 50,
                      child: RaisedButton(
                        child: Text("登录"),
                        textColor: Colors.white,
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        onPressed: () {
                          //将焦点从第一个TextField移到第二个TextField
                          // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                          // 这是第二种写法
                          // if (null == focusScopeNode) {
                          //   focusScopeNode = FocusScope.of(context);
                          // }
                          // focusScopeNode.requestFocus(focusNode2);
                          //失去焦点
                          focusNode1.unfocus();
                          focusNode2.unfocus();
                          this.requestData();
                        },
                      ),
                    ))
                  ]),
                ],
              ),
              // RaisedButton(
              //   onPressed: () {
              //     print("点击了按钮");
              //     this.requestData();
              //   },
              //   child: Text("点击登录1111222"),
              // ),
            )));
  }

  Future<void> requestData() async {
    if (this.name == "") {
      Fluttertoast.showToast(
          msg: "请输入账号",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return null;
    }

    if (this.password == "") {
      Fluttertoast.showToast(
          msg: "请输入密码",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return null;
    }
    print("账号=${this.name}----密码 === ${this.password}");
    final publicKeyString  = '''-----BEGIN PUBLIC KEY-----
    MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCxUA2BUXJ63dkphlvRVYsYuP0Lg1r1KPRRUOuLHTGTGJouOawiOUX9aFY6LGERWzQfG0qICJbON49QDGwzF/BJ7B2JhgwC7JT9f0IaiiH3aSYsOqD85ytIbL4pXxYoLgeysjbyFh6sHUeKQvoxJ6/Io5XeunmqNPEaP30G2ja5kQIDAQAB-----END''';
    final encrypter = Encrypter(RSA(publicKey:RSAKeyParser().parse(publicKeyString)));
    print('----${encrypter.encrypt(this.password).base64}------');
    Map<String, dynamic> entry = {
      "userName": this.name,
      "password": encrypter.encrypt(this.password).base64
    };
    final response = await HttpUtils.post('login', data: entry);
    if (response["code"] == 0) {
    } else {
      Fluttertoast.showToast(
          msg: response["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    print(response);
  }
}
