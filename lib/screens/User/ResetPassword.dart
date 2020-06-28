import 'dart:convert';

import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ConstantVar.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/screens/Homepage/NowshowingScreen.dart';
import 'package:MovieWorld/screens/User/ChooseProfile.dart';
import 'package:MovieWorld/screens/User/LoginScreen.dart';
import 'package:MovieWorld/screens/User/ResetPass.dart';
import 'package:MovieWorld/screens/User/TextfieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../modal.dart';
import '../ButtonGradientLarge.dart';


class ResetPasswordScreen extends StatefulWidget {
  final String jwt;

  const ResetPasswordScreen({Key key, this.jwt}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() =>
      _ResetPasswordScreenState(this.jwt);
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final String jwt;

  final _formKey = GlobalKey<FormState>();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();

  _ResetPasswordScreenState(this.jwt);

  Future<String> resetPass(BuildContext context) async {
    var uri = UrlConstant.HOST + '/api/save-password?token=' + jwt + '&newPassword=' + passConfirmController.text ;
    http.Response response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      Modal.showSimpleCustomDialog(
          context,
          "Change pass successfull!", "LOGIN");
      ConstantVar.resetPassWordToken = "";
      ConstantVar.userDetail = null;
      ConstantVar.jwt = "";
    } else {
      Modal.showSimpleCustomDialog(context, " Change pass  fail!", null);
      ConstantVar.resetPassWordToken = "";
    }
  }


//  }

  Widget _resetPassBtn(BuildContext context) {
    return ButtonGradientLarge(StringConstant.RESET_PASS, () {
      if (_formKey.currentState.validate()) {}
      resetPass(context);
    });
  }

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return ConstantVar.jwt == "" ? MainLayOut.getMailLayout(
            context,
            Container(
              color: ColorConstant.VIOLET,
              // margin: EdgeInsets.only(bottom:  MediaQuery.of(context).size.height*0.1),
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.only(left: 25, right: 20.0, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      ImageConstant.LOGO,
                      height: 200,
                      width: 240,
                      fit: BoxFit.fitWidth,
                    ),
                    Text("Reset your password",
                        style: StyleConstant.headerTextStyle),
                    SizedBox(
                      height: 13,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 25.0),
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
                                  StringConstant.PASSWORD,
                                  StringConstant.PASSWORD_HINT,
                                  Icon(Icons.lock, color: Colors.white),
                                  TextInputType.visiblePassword,
                                  passController),
                              TextFieldWidget.buildTextField(
                                  StringConstant.CONFIRM_PASSWORD,
                                  StringConstant.CONFIRM_PASSWORD_HINT,
                                  Icon(Icons.lock_open, color: Colors.white),
                                  TextInputType.emailAddress,
                                  passConfirmController),
                              SizedBox(
                                height: 15,
                              ),
                              _resetPassBtn(context),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    )
                  ],
                ),
              ),
            ),
            "USER",
            "Change Password") : NowshowingScreen();
  }
}
