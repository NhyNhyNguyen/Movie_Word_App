import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/model/Movie.dart';
import 'package:MovieWorld/screens/Homepage/BannerImage.dart';
import 'package:MovieWorld/screens/Homepage/CategoryMovie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import '../../constant/ColorConstant.dart';
import 'OptionTab.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CommingsoonScreen extends StatefulWidget {
  @override
  _CommingsoonScreen createState() => _CommingsoonScreen();
}

class _CommingsoonScreen extends State<CommingsoonScreen>  {

  String url;
  List<Movie> data;

  @override
  Widget build(BuildContext context) {

    url  = UrlConstant.URL_FILM + 'coming-soon';
    if (data == null) {
      http.get(url).then((http.Response response) {
        setState((){
          data = new List<Movie>();
          json.decode(response.body).forEach((json) {
            data.add(Movie.fromJson(json));
          });
        });
      });
    };

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
                    OptionTab('coming-soon'),
                    Container(
                      // height: 435,
                        height: MediaQuery.of(context).size.height * 0.675,
                        child: CategoryMovie(data)),
                  ],
                ),
              )
            ],
          ),

        )
        ,
        "HOME", "Home");
  }
}
