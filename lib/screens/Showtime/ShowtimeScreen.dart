import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/model/Movie.dart';
import 'package:MovieWorld/screens/Homepage/BannerImage.dart';
import 'package:MovieWorld/screens/Homepage/CategoryMovie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import '../../constant/ColorConstant.dart';
import 'package:MovieWorld/screens/Homepage/Homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Showtime.dart';

class ShowtimeScreen extends StatefulWidget {
  @override
  _ShowtimeScreen createState() => _ShowtimeScreen();
}

class _ShowtimeScreen extends State<ShowtimeScreen>  {

  @override
  Widget build(BuildContext context) {
    return MainLayOut.getMailLayout(
        context,
        Container(
          color: ColorConstant.VIOLET,
          child: Column(
            children: <Widget>[
              Container(
                //height: 500,
                height: MediaQuery.of(context).size.height * 0.77,
                child:
                    MyShowtime(),
              )
            ],
          ),

        )
        ,
        "CAL");
  }
}
