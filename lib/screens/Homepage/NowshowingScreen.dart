
import 'package:MovieWorld/screens/Homepage/BannerImage.dart';
import 'package:MovieWorld/screens/Homepage/CategoryMovie.dart';
import 'package:MovieWorld/screens/Homepage/Search.dart';
import 'package:MovieWorld/services/dynamic_link_service.dart';
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
import 'OptionTab.dart';

class NowshowingScreen extends StatefulWidget {
  @override
  _NowshowingScreen createState() => _NowshowingScreen();
}

class _NowshowingScreen extends State<NowshowingScreen>  {

  @override
  void initState(){
    DynamicLinkService().handleDynamicLinks();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayOut.getMailLayout(
        context,
        Container(
          color: ColorConstant.VIOLET,
          child: Column(
            children: <Widget>[
//              Container(
//                //color: ColorConstant.YELLOW,
//                  child: Search()),
              Container(
                //height: 500,
                height: MediaQuery.of(context).size.height * 0.77,
                  child: ListView(
                    children: <Widget>[
                      BannerImage(),
                      OptionTab('nowshowing'),
                      Container(
                         // height: 435,
                          height: MediaQuery.of(context).size.height * 0.675,
                          child: CategoryMovie('nowshowing')),
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
