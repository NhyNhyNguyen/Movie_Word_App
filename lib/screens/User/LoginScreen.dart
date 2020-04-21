import 'dart:convert';

import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/screens/User/TextfieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();


  Future<http.Response> login(String username, String password) {
    return http.post(
      'http://',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
  }

  Widget _forgetPassAndRememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[_rememberMeCheckBox(), _buildForgotPassBtn()],
    );
  }

  Widget _buildForgotPassBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        padding: EdgeInsets.only(right: 0.0),
        onPressed: () => {print("test")},
        child: Text(
          StringConstant.FORGOT_PASS,
          style: TextStyle(
              color: Colors.blueAccent, decoration: TextDecoration.underline),
        ),
      ),
    );
  }

  Widget _rememberMeCheckBox() {
    return Container(
        child: Row(
          children: <Widget>[
            Theme(
              data: ThemeData(unselectedWidgetColor: Colors.black),
              child: Checkbox(
                value: _rememberMe,
                checkColor: ColorConstant.BLACK,
                activeColor: ColorConstant.RED,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value;
                  });
                },
              ),
            ),
            Text(
              StringConstant.REMEMBER_ME,
              style: StyleConstant.smallTextStyle,
            )
          ],
        ));
  }


  Widget _loginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Processing Data')));
          }
        },
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: ColorConstant.RED,
        child:
            Text(StringConstant.SIGN_IN, style: StyleConstant.buttonTextStyle),
      ),
    );
  }

  Widget _signInBtn() {
    return GestureDetector(
      onTap: () => {print("Tap button sign in")},
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: StringConstant.HAVE_ACCOUNT,
              style: StyleConstant.smallTextStyle),
          TextSpan(
              text: StringConstant.SIGN_UP,
              style: TextStyle(
                  color: ColorConstant.BLACK,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontSize: 18))
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: AppBar(
            backgroundColor: ColorConstant.RED,
            title: Stack(
              children: <Widget>[
                Container(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(ImageConstant.LOGO1, height: 60),
                    Text(
                      StringConstant.APP_NAME,
                      style: TextStyle(
                        color: ColorConstant.YELLOW,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
      body: Stack(
        children: <Widget>[
          Container(
              height: double.infinity,
              color: ColorConstant.WHITE,
              width: double.infinity,
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                  ])),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(StringConstant.SIGN_IN,
                      style: StyleConstant.headerTextStyle),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      decoration: BoxDecoration(
                          color: ColorConstant.WHITE,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 15),
                                blurRadius: 15),
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, -10),
                                blurRadius: 10)
                          ]),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFieldWidget.buildTextField(
                                StringConstant.USERNAME,
                                StringConstant.USERNAME_HINT,
                                Icon(Icons.mail),
                                TextInputType.emailAddress,
                                usernameController),
                            SizedBox(
                              height: 15,
                            ),
                            TextFieldWidget.buildTextField(
                                StringConstant.PASSWORD,
                                StringConstant.PASSWORD_HINT,
                                Icon(Icons.lock),
                                TextInputType.visiblePassword,
                                passController),
                            _forgetPassAndRememberMe()
                          ],
                        ),
                      )),
                  _loginBtn(),
                  SizedBox(
                    height: 10,
                  ),
                  _signInBtn(),
                ],
              ),
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: ColorConstant.RED,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Image.asset(ImageConstant.HOME_GRAY, height: 45),
                    ),
                    InkWell(
                      onTap: () {},
                      child:
                          Image.asset(ImageConstant.CALENDAR_GRAY, height: 45),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(ImageConstant.FILM_GRAY, height: 45),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(ImageConstant.PERSON_GRAY, height: 60),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
