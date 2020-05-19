
import 'package:MovieWorld/screens/ButtonGradient.dart';
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

    void choseOption(type){
      if(type == "nowshowing"){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NowshowingScreen()),
        );
      };
      if(type == "comingsoon"){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommingsoonScreen()),
        );
      };
    }

    return Container(
      //padding: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.only(bottom: 8),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ButtonGradient(type, "nowshowing", StringConstant.NOW_SHOWING, () => choseOption("nowshowing")),
          ButtonGradient(type, "comingsoon", StringConstant.COMMING_SOON, () => choseOption("comingsoon")),


        ],
      ),
    );
  }


}
