import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ConstantVar.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/screens/User/ChoosePage.dart';
import 'package:MovieWorld/screens/User/ChooseProfile.dart';
import 'package:MovieWorld/screens/User/History.dart';
import 'package:MovieWorld/screens/User/LoginScreen.dart';
import 'package:MovieWorld/screens/User/ResetPass.dart';
import 'package:MovieWorld/screens/User/SignUpScreen.dart';
import 'package:flutter/material.dart';

import 'MenuItem.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: Container(
          color: ColorConstant.LIGHT_VIOLET,
          child: ListView(
            children: <Widget>[
              /*   new UserAccountsDrawerHeader(
                accountName: new Text('Raja'),
                accountEmail: new Text('testemail@test.com'),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage(UrlConstant.IMAGE + "iu2.jpg"),
                ),
              ),*/
              Stack(alignment: Alignment.bottomCenter, children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.23,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: NetworkImage(UrlConstant.IMAGE +
                                "photo1528790532372-1528790532372684051980-15889023877795083171.jpg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: (ConstantVar.userDetail == null)
                              ? AssetImage(ImageConstant.LOGO1)
                              : ConstantVar.userDetail.avt != null
                              ? NetworkImage(UrlConstant.IMAGE +
                              ConstantVar.userDetail.avt)
                              : AssetImage(ImageConstant.LOGO1),
                          fit: BoxFit.cover,
                        ),
                        // border: Border.all(color: Colors.white70, width: 4),
                      ),
                    ),
                  ],
                ),
              ]),
              ConstantVar.userDetail == null
                  ? Container()
                  : Text(
                ConstantVar.userDetail.username,
                textAlign: TextAlign.center,
                style: StyleConstant.btnSelectedStyle,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
              ),
              ConstantVar.jwt == "" ? Column(
                children: <Widget>[
                  MenuItem(
                    text: StringConstant.LOGIN,
                    icon: Icons.person,
                    selectHandle: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginScreen()))
                    },
                  ),
                  MenuItem(
                    text: StringConstant.SIGN_UP,
                    icon: Icons.person_add,
                    selectHandle: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUpScreen()))
                    },
                  ),
                ],
              ): Column(
                children: <Widget>[
                  MenuItem(
                    text: StringConstant.PROFILE,
                    icon: Icons.person,
                    selectHandle: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChooseProfile()))
                    },
                  ),
                  MenuItem(
                    text: StringConstant.EDIT,
                    icon: Icons.edit,
                    selectHandle: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => History()))
                    },
                  ),
                  MenuItem(
                    text: StringConstant.HISTORY,
                    icon: Icons.history,
                    selectHandle: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => History()))
                    },
                  ),
                  MenuItem(
                    text: StringConstant.CHANGE_PASS,
                    icon: Icons.lock_open,
                    selectHandle: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ResetPassScreen()))
                    },
                  ),
                  MenuItem(
                    text: StringConstant.LOGOUT,
                    icon: Icons.arrow_forward,
                    selectHandle: () => {
                        ConstantVar.userDetail = null,
                      ConstantVar.jwt = "",
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChoosePageScreen()))
                    },

                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
