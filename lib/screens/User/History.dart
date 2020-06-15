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
import 'package:MovieWorld/screens/User/ResetPassword.dart';
import 'package:MovieWorld/screens/User/SignUpScreen.dart';
import 'package:MovieWorld/screens/User/TextfieldWidget.dart';
import 'package:MovieWorld/services/dynamic_link_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ButtonGradient.dart';
import 'ResetPass.dart';

class History extends StatefulWidget {
  @override
  _History createState() => _History();
}

class _History extends State<History> {
  String type = "history";
  String imageUrl = UrlConstant.IMAGE +
      "98307201_314497226215952_6080107368102756352_n-30987288442578.jpg";
  Widget _editBtn() {
    return ButtonGradientLarge(
        StringConstant.EDIT,
        () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailScreen()))
            });
  }

  Widget _resetPass() {
    return ButtonGradientLarge(
        StringConstant.CHANGE_PASS,
        () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResetPasswordScreen()))
            });
  }

  Widget _logoutBtn() {
    return ButtonGradientLarge(
        StringConstant.LOGOUT,
        () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()))
            });
  }

  void choseOption(type) {
    setState(() {
      this.type = type;
    });
  }

  @override
  void initState() {
    UserDetail.fetchUserDetail(ConstantVar.jwt)
        .then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return ConstantVar.userDetail != null
        ?
    (type == 'history' ?
    MainLayOut.getMailLayout(
            context,
            Container(
                color: ColorConstant.VIOLET,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ButtonGradient(
                              type,
                              "profile",
                              StringConstant.PROFILE,
                              () => choseOption("profile")),
                          ButtonGradient(
                              type,
                              "history",
                              StringConstant.HISTORY,
                              () => choseOption("history")),
                        ],
                      ),
                    ),
                        SingleChildScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            padding: EdgeInsets.only(bottom: 50.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[],
                            ),
                          )
                  ],
                )),
            "USER"): ChooseProfile())
        : LoginScreen();
  }
}
