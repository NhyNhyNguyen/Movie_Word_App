import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/screens/ButtonGradientLarge.dart';
import 'package:MovieWorld/screens/User/DetailScreen.dart';
import 'package:MovieWorld/screens/User/LoginScreen.dart';
import 'package:MovieWorld/screens/User/SignUpScreen.dart';
import 'package:MovieWorld/screens/User/TextfieldWidget.dart';
import 'package:MovieWorld/services/dynamic_link_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ButtonGradient.dart';

class ChooseProfile extends StatefulWidget {
  @override
  _ChooseProfile createState() => _ChooseProfile();
}

class _ChooseProfile extends State<ChooseProfile> {
  String type = "profile";

  Widget _editBtn(){
    return ButtonGradientLarge(
        StringConstant.EDIT,
            () => {Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen()))});
  }

  Widget _logoutBtn(){
    return ButtonGradientLarge(
        StringConstant.LOGOUT,
            () => {Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()))});
  }

//  Widget _signUpBtn() {
//    return Container(
//      padding: EdgeInsets.symmetric(vertical: 10),
//      width: double.infinity,
//      child: RaisedButton(
//        elevation: 5.0,
//        onPressed: () => {
//          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()))
//        },
//        padding: EdgeInsets.all(15.0),
//        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//        color: ColorConstant.RED,
//        child:
//            Text(StringConstant.SIGN_UP, style: StyleConstant.buttonTextStyle),
//      ),
//    );
// }
  void choseOption(type){
      setState(() {
        this.type = type;
      });
  }

  @override
  Widget build(BuildContext context) {
    DynamicLinkService().handleDynamicLinks();
    return MainLayOut.getMailLayout(
        context,
        Container(
            color: ColorConstant.VIOLET ,
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ButtonGradient(type, "profile", StringConstant.PROFILE, () => choseOption("profile")),
                      ButtonGradient(type, "history", StringConstant.HISTORY, () => choseOption("history")),

                    ],
                  ),
                ),
                type == "profile"? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(ImageConstant.LOGO1, height: 270),

                    SizedBox(
                      height: 20,
                    ),
                    _editBtn(),
                    _logoutBtn(),
                  ],
                ): Column()
              ],
            ))
        ,
        "USER");
  }
}
