
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
      color: ColorConstant.LIGHT_VIOLET,
      padding: EdgeInsets.only(left: 15, right: 15),
      margin: EdgeInsets.only(bottom:5),
      child: TextFormField(
        style: StyleConstant.normalTextStyle,
        decoration: InputDecoration(
            enabledBorder: StyleConstant.enabledBorder,
            focusedBorder: StyleConstant.focusedBorder,
            contentPadding: EdgeInsets.only(top: 14),
            hintText: 'Enter a search term',
            prefixIcon: Icon(Icons.search, color: ColorConstant.GRAY_TEXT,),
            hintStyle: StyleConstant.hintTextStyle),
      ),

    );
  }


}
