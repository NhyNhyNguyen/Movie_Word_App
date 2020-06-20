import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ConstantVar.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/model/UserDetail.dart';
import 'package:MovieWorld/screens/ButtonGradientLarge.dart';
import 'package:MovieWorld/screens/User/Avatar.dart';
import 'package:MovieWorld/screens/User/ChooseProfile.dart';
import 'package:MovieWorld/screens/User/DetailScreen.dart';
import 'package:MovieWorld/screens/User/HistoryItem.dart';
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


  @override
  void initState() {
    UserDetail.fetchUserDetail(ConstantVar.jwt)
        .then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return ConstantVar.userDetail != null
        ? (type == 'history'
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
                        Avatar(UrlConstant.IMAGE + ConstantVar.userDetail.avt, ConstantVar.userDetail.username, ConstantVar.userDetail.email),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: SingleChildScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            padding: EdgeInsets.only(bottom: 50.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: List.generate(4, (index) => HistoryItem())
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    )),
                "USER", "History")
            : ChooseProfile())
        : LoginScreen();
  }
}
