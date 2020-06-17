import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/screens/Bloc/homepage_bloc.dart';
import 'package:MovieWorld/screens/Bloc/homepage_event.dart';
import 'package:MovieWorld/screens/Bloc/homepage_state.dart';
import 'package:MovieWorld/screens/ButtonGradient.dart';
import 'package:MovieWorld/screens/Homepage/CategoryMovie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/model/Movie.dart';
import 'package:flutter/widgets.dart';
import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import '../../constant/ColorConstant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'DateItem.dart';
import 'ShowtimeMovieItem.dart';

class MyShowtime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Showtime();
  }
}

class Showtime extends StatefulWidget {
  @override
  _ShowtimeState createState() => _ShowtimeState();
}

class _ShowtimeState extends State<Showtime>  {
  @override
  Widget build(BuildContext context) {
    return MainLayOut.getMailLayout(
        context,
        Container(
          color: ColorConstant.VIOLET,
          child: Column(
            children: <Widget>[
              Container(
                height: 70,
                margin: EdgeInsets.all(10),
                //padding: EdgeInsets.only(top: 8, left: 20),
                decoration: BoxDecoration(
                    color: ColorConstant.LIGHT_VIOLET,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    DateItem('MON', 18, false),
                    DateItem('MON', 18, true),
                    DateItem('MON', 18, false),
                    DateItem('MON', 18, false),
                    DateItem('MON', 18, false),
                    DateItem('MON', 18, false),
                    DateItem('MON', 18, false),
                  ],
                ),
              ),
              Container(
                height: 500,
                child: Column(
                  children: <Widget>[
                    ShowtimeMovieItem('1', 'Avenger', 'kingdom.jpg', 'Action', '120'),
                    ShowtimeMovieItem('1', 'King Dom', 'avenger.jpg', 'Action', '120'),
                  ],
                ),
              )
            ],
          )),
        'CAL');
  }
}


