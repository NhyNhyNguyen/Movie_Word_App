import 'dart:convert';

import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/screens/User/ChooseProfile.dart';
import 'package:MovieWorld/screens/User/TextfieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../ButtonGradientLarge.dart';
import 'DetailScreen.dart';
import 'SignUpScreen.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  Future<String> login(String username, String password) async {
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
      print(json.decode(response.body)['token']);
      return response.body;
    } else {
      return null;
    }
  }

//  }

  Widget _resetPassBtn(){
    return ButtonGradientLarge(
        StringConstant.RESET_PASS,
            () {
            if (_formKey.currentState.validate()) {
            }
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseProfile()));
        });
  }


  @override
  Widget build(BuildContext context) {
    return MainLayOut.getMailLayout(
      context,
      Container(
        color: ColorConstant.VIOLET,
       // margin: EdgeInsets.only(bottom:  MediaQuery.of(context).size.height*0.1),
        width: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Reset your password",
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
                            StringConstant.NEW_PASSWORD,
                            StringConstant.NEW_PASSWORD_HINT,
                            Icon(Icons.mail, color: Colors.white),
                            TextInputType.emailAddress,
                            passwordController),
                        SizedBox(
                          height: 15,
                        ),
                        TextFieldWidget.buildTextField(
                            StringConstant.CONFIRM_PASSWORD,
                            StringConstant.CONFIRM_PASSWORD_HINT,
                            Icon(Icons.lock, color: Colors.white),
                            TextInputType.visiblePassword,
                            confirmPassController),
                        SizedBox(
                          height: 15,
                        ),
                        _resetPassBtn(),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
      "USER"
    );
  }
}
