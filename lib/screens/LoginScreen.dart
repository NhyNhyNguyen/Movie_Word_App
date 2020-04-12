import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  Widget _buildEmailTf() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(StringConstant.EMAIL, style: StyleConstant.normalTextStyle),
        Container(
          alignment: Alignment.centerLeft,
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: StyleConstant.normalTextStyle,
            decoration: InputDecoration(
                enabledBorder: StyleConstant.enabledBorder,
                focusedBorder: StyleConstant.focusedBorder,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.black,
                ),
                hintText: StringConstant.EMAIL_HINT,
                hintStyle: StyleConstant.hintTextStyle),
          ),
        )
      ],
    );
  }

  Widget _buildPasswordTf() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(StringConstant.PASSWORD, style: StyleConstant.normalTextStyle),
        Container(
          alignment: Alignment.centerLeft,
          height: 60,
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            style: StyleConstant.normalTextStyle,
            decoration: InputDecoration(
                enabledBorder: StyleConstant.enabledBorder,
                focusedBorder: StyleConstant.focusedBorder,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
                hintText: StringConstant.PASSWORD_HINT,
                hintStyle: StyleConstant.hintTextStyle),
          ),
        )
      ],
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
        onPressed: () => {print("Login press button")},
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: ColorConstant.RED,
        child: Text("LOGIN", style: StyleConstant.buttonTextStyle),
      ),
    );
  }

  Widget _signIn() {
    return GestureDetector(
        onTap: () => {print("Tap to sign in")},
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: ColorConstant.WHITE,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 2), blurRadius: 6, color: Colors.black26)
              ],
              image: DecorationImage(
                  image: AssetImage(
                      '/Users/user10/A42/DA/MovieWorld/web/favicon.png'))),
        ));
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
            body: Stack(
      children: <Widget>[
        Container(
            height: double.infinity,
            color: ColorConstant.WHITE,
            width: double.infinity,
            child:
                new Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              new Image.asset(
                ImageConstant.BOTTOM_LOGIN_BACKGROUND,
                height: 170,
              ),
              SizedBox(
                height: 20,
              ),
            ])),
        Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 120.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      ImageConstant.LOGO,
                      width: 150,
                    ),
                  ],
                ),
                SizedBox(
                  height: 49,
                ),
                Text(StringConstant.SIGN_IN,
                    style: StyleConstant.headerTextStyle),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                  child: Column(
                    children: <Widget>[
                      _buildEmailTf(),
                      SizedBox(
                        height: 15,
                      ),
                      _buildPasswordTf(),
                      _forgetPassAndRememberMe()
                    ],
                  ),
                ),
                _loginBtn(),
                SizedBox(
                  height: 10,
                ),
                _signInBtn(),
              ],
            ),
          ),
        ),
      ],
    )));
  }
}
