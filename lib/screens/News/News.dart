
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';

import 'package:MovieWorld/screens/News/TicketPrice.dart';

import '../../constant/ImageConstant.dart';
import '../../constant/StringConstant.dart';
import '../../constant/StringConstant.dart';
import '../User/ChoosePage.dart';
import 'NewsDetail.dart';
import 'OptionTab.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreen createState() => _NewsScreen();
}

class _NewsScreen extends State<NewsScreen>  {

  static const data = const
  [
    {'image':ImageConstant.NEWS1, 'detail': StringConstant.NEWSDETAIL1},
    {'image':ImageConstant.NEWS2, 'detail': StringConstant.NEWSDETAIL2},
    {'image':ImageConstant.NEWS3, 'detail': StringConstant.NEWSDETAIL3},
    {'image':ImageConstant.NEWS1, 'detail': StringConstant.NEWSDETAIL1},
  ];

//static const List<String> data = <String>[
//  ImageConstant.NEWS1,
//  ImageConstant.NEWS2,
//  ImageConstant.NEWS3,
//  ImageConstant.NEWS1
//];

 static List listImage() {
  return data.map((item) => Image.asset(item['image'], height: 150,)).toList();
}


  @override
  Widget build(BuildContext context) {
    List<InkWell> myWidgets = listImage().asMap().entries.map((item) {
      return InkWell(
        child: item.value,
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailScreen(item.key, data)));

        },
      );
    }).toList();


    Widget _listImage(){
      return Container(
        height: 500,
        child: ListView(
          children: myWidgets,
        ),

      );
    }
    return MainLayOut.getMailLayout(
        context,
        Container(
          color: ColorConstant.VIOLET,
          child: Column(
            children: <Widget>[
              OptionTab('news'),
              _listImage(),
            ],
          ),
          ),
        "FILM", "News");
  }
}
