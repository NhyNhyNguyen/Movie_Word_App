
import 'package:MovieWorld/screens/Homepage/BannerImage.dart';
import 'package:MovieWorld/screens/Homepage/Search.dart';
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
import 'CategoryMovie.dart';
import 'OptionTab.dart';

class CommingsoonScreen extends StatefulWidget {
  @override
  _CommingsoonScreen createState() => _CommingsoonScreen();
}

class _CommingsoonScreen extends State<CommingsoonScreen>  {


  @override
  Widget build(BuildContext context) {
    return MainLayOut.getMailLayout(
        context,
        Container(
          color: ColorConstant.VIOLET,
          child: Column(
            children: <Widget>[
              Container(
                  child: Search()),
              Container(
                //height: 500,
                height: MediaQuery.of(context).size.height * 0.695,
                child: ListView(
                  children: <Widget>[
                    BannerImage(),
                    OptionTab('comingsoon'),
                    Container(
                        //height: 435,
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: CategoryMovie('comingsoon')),
                  ],
                ),
              )
            ],
          ),
        )
        ,
        "HOME");
  }
}
