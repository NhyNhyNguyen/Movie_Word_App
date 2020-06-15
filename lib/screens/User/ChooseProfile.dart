import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ConstantVar.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/model/UserDetail.dart';
import 'package:MovieWorld/screens/ButtonGradientLarge.dart';
import 'package:MovieWorld/screens/User/DetailScreen.dart';
import 'package:MovieWorld/screens/User/History.dart';
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

class ChooseProfile extends StatefulWidget {
  @override
  _ChooseProfile createState() => _ChooseProfile();
}

class _ChooseProfile extends State<ChooseProfile> {
  String type = "profile";
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
        ? (type == 'profile'
            ? MainLayOut.getMailLayout(
                context,
                Container(
                    color: ColorConstant.VIOLET,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.0, vertical: 10.0),
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
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: /*ConstantVar.userDetail.avt == null ? AssetImage(ImageConstant.LOGO):*/ NetworkImage(
                                        "http://10.0.2.2:9000/api/image/${ConstantVar.userDetail.avt}"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                ConstantVar.userDetail.username,
                                style: StyleConstant.btnSelectedStyle,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.email,
                                      color: ColorConstant.WHITE, size: 20),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    ConstantVar.userDetail.fullName,
                                    style: StyleConstant.smallTextStyle,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.location_on,
                                      color: ColorConstant.WHITE, size: 20),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    ConstantVar.userDetail.address,
                                    style: StyleConstant.smallTextStyle,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.phone,
                                      color: ColorConstant.WHITE, size: 20),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    ConstantVar.userDetail.phone,
                                    style: StyleConstant.smallTextStyle,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              _editBtn(),
                              _resetPass(),
                              _logoutBtn(),
                            ],
                          ),
                        )
                      ],
                    )),
                "USER")
            : History())
        : LoginScreen();
  }
}
