
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';

import 'package:MovieWorld/screens/News/News.dart';

import '../../constant/ColorConstant.dart';
import '../../constant/StringConstant.dart';
import '../../constant/StyleConstant.dart';
import 'CommingsoonScreen.dart';
import 'NowshowingScreen.dart';


class OptionTab extends StatelessWidget  {
  final String type;
  OptionTab(this.type);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.only(bottom: 9, top: 5),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            elevation: 5.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NowshowingScreen()),
              );
            },
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: ColorConstant.RED,
            child: type == 'nowshowing' ? Text(StringConstant.NOW_SHOWING, style:TextStyle(color:ColorConstant.YELLOW )) : Text(StringConstant.NOW_SHOWING, style:TextStyle(color:ColorConstant.BLACK )),
          ),
          RaisedButton(
            elevation: 5.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CommingsoonScreen()),
              );
            },
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: ColorConstant.RED,
            child: type == 'commingsoon' ? Text(StringConstant.COMMING_SOON, style:TextStyle(color:ColorConstant.YELLOW )) : Text(StringConstant.COMMING_SOON, style:TextStyle(color:ColorConstant.BLACK )),
          ),
        ],
      ),
    );
  }


}
