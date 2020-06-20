import 'dart:convert';

import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ConstantVar.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/model/User.dart';
import 'package:MovieWorld/screens/User/ChooseProfile.dart';
import 'package:MovieWorld/screens/User/TextfieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../modal.dart';
import '../ButtonGradientLarge.dart';
import 'DetailScreen.dart';
import 'SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = true;
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();

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
              color: ColorConstant.BLUE_TEXT,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w600),
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
            checkColor: ColorConstant.WHITE,
            activeColor: ColorConstant.BLUE_TEXT,
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

  Widget _loginBtn(BuildContext context) {
    return ButtonGradientLarge(StringConstant.SIGN_IN, () {
      if (_formKey.currentState.validate()) {
        login(context, usernameController.text, passController.text);
      }
    });
  }

  Future<User> login(
      BuildContext context, String username, String password) async {
    http.Response response = await http.post(
      UrlConstant.LOGIN,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      ConstantVar.jwt = json.decode(response.body)["token"];
      print(response.body);
      Modal.showSimpleCustomDialog(
          context,
          "Login successfull!",
          onPressedLoginSuccess);
      return User.fromJson(json.decode(response.body));
    } else {
      //show popup
      print("show popup");
      Modal.showSimpleCustomDialog(
          context,
          "Login fail",
          onPressedLoginFail);
      return null;
    }
  }

  void onPressedLoginSuccess(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ChooseProfile()));
  }

  void onPressedLoginFail(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  Widget _signInBtn() {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpScreen()))
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: StringConstant.HAVE_ACCOUNT,
              style: StyleConstant.smallTextStyle),
          TextSpan(
              text: StringConstant.REGISTER_NOW,
              style: TextStyle(
                  color: ColorConstant.BLUE_TEXT,
                  fontWeight: FontWeight.bold,
                  fontSize: 18))
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    usernameController.text = "teo1";
    passController.text = "fun123";
    return MainLayOut.getMailLayout(
        context,
        Container(
          color: ColorConstant.VIOLET,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Sign into your account",
                    style: StyleConstant.headerTextStyle),
                SizedBox(
                  height: 13,
                ),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    decoration: BoxDecoration(
                        color: ColorConstant.LIGHT_VIOLET,
                        borderRadius: BorderRadius.circular(20),
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
                              Icon(Icons.mail, color: Colors.white),
                              TextInputType.emailAddress,
                              usernameController),
                          SizedBox(
                            height: 15,
                          ),
                          TextFieldWidget.buildTextField(
                              StringConstant.PASSWORD,
                              StringConstant.PASSWORD_HINT,
                              Icon(Icons.lock, color: Colors.white),
                              TextInputType.visiblePassword,
                              passController),
                          _forgetPassAndRememberMe(),
                          SizedBox(
                            height: 15,
                          ),
                          _loginBtn(context),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                _signInBtn(),
              ],
            ),
          ),
        ),
        "USER", "Login");
  }
}
