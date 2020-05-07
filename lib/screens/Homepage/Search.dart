
import 'package:MovieWorld/screens/User/TextfieldWidget.dart';
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


class Search extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 40,
      margin: EdgeInsets.fromLTRB(10, 8, 10, 8),
      decoration: new BoxDecoration(
        border: Border.all( color: Colors.black38),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),
        color: ColorConstant.WHITE,
      ),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter a search term',
            icon: Image.asset(ImageConstant.SEARCH_ICON, height: 30, width: 30, ),

        ),
      ),
    );
  }


}
