import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/screens/User/DetailScreen.dart';
import 'package:MovieWorld/screens/User/LoginScreen.dart';
import 'package:MovieWorld/screens/User/SignUpScreen.dart';
import 'package:MovieWorld/screens/User/TextfieldWidget.dart';
import 'package:MovieWorld/services/dynamic_link_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoosePageScreen extends StatefulWidget {
  @override
  _ChoosePageScreen createState() => _ChoosePageScreen();
}

class _ChoosePageScreen extends State<ChoosePageScreen> {
  Widget _signInBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: ColorConstant.RED,
        child:
            Text(StringConstant.SIGN_IN, style: StyleConstant.buttonTextStyle),
      ),
    );
  }

  Widget _signUpBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()))
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: ColorConstant.RED,
        child:
            Text(StringConstant.SIGN_UP, style: StyleConstant.buttonTextStyle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DynamicLinkService().handleDynamicLinks();
    return MainLayOut.getMailLayout(
        context,
        Container(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(ImageConstant.LOGO1, height: 270),

                Text("NOT LOGIN",
                    textScaleFactor: 1.5, style: StyleConstant.normalTextStyle,),
                SizedBox(
                  height: 20,
                ),
                _signInBtn(),
                _signUpBtn(),
              ],
            ))
        ,
        "USER");
}
}
