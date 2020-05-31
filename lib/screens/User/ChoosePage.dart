import 'dart:convert';

import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ConstantVar.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/model/UserDetail.dart';
import 'package:MovieWorld/screens/ButtonGradientLarge.dart';
import 'package:MovieWorld/screens/User/ChooseProfile.dart';
import 'package:MovieWorld/screens/User/DetailScreen.dart';
import 'package:MovieWorld/screens/User/LoginScreen.dart';
import 'package:MovieWorld/screens/User/SignUpScreen.dart';
import 'package:MovieWorld/screens/User/TextfieldWidget.dart';
import 'package:MovieWorld/services/dynamic_link_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


class ChoosePageScreen extends StatefulWidget {
  @override
  _ChoosePageScreen createState() => _ChoosePageScreen();
}

class _ChoosePageScreen extends State<ChoosePageScreen> {

  Widget _signInBtn() {
    return ButtonGradientLarge(
        StringConstant.SIGN_IN,
        () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()))
            });
  }

  Widget _signUpBtn() {
    return ButtonGradientLarge(
        StringConstant.SIGN_UP,
        () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()))
            });
  }

  Future<bool> fetchUserDetail(String jwt) async {
    final response = await http.get(UrlConstant.PROFILE, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
      'Bearer $jwt',
    });
    print(json.decode(response.body));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      ConstantVar.isLogin = true;
      return true;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      ConstantVar.isLogin = false;
      return false;
    }
  }

  @override
  void initState(){
    fetchUserDetail(ConstantVar.jwt).then((value) => setState((){
      ConstantVar.isLogin = value;
    }));
  }



  @override
  Widget build(BuildContext context) {
    return MainLayOut.getMailLayout(
        context,
        !ConstantVar.isLogin ? Container(
            color: ColorConstant.VIOLET,
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(ImageConstant.LOGO1, height: 270),
                Text(
                  "NOT LOGIN",
                  textScaleFactor: 1.5,
                  style: StyleConstant.normalTextStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                _signInBtn(),
                _signUpBtn(),
              ],
            )) : ChooseProfile(),
        "USER");
  }
}
