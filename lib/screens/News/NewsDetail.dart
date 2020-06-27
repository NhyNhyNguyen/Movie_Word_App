import 'package:MovieWorld/screens/News/News.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';

import 'package:MovieWorld/screens/News/TicketPrice.dart';

import 'OptionTab.dart';


class NewsDetailScreen extends StatelessWidget  {
  final int index;
  final List data;
  NewsDetailScreen(this.index, this.data);


  @override
  Widget build(BuildContext context) {
    return MainLayOut.getMailLayout(
        context,
        Container(
          color: ColorConstant.VIOLET,
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Image.asset(data[index]['image'], height: 180, fit: BoxFit.cover,)),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: Text(data[index]['detail'], style: TextStyle(color: ColorConstant.WHITE),),
              )
              

            ],
          ),

        )
        ,
        "FILM", "NewDetail");
  }
}
