import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/model/Movie.dart';
import 'package:MovieWorld/screens/Homepage/BannerImage.dart';
import 'package:MovieWorld/screens/Homepage/CategoryMovie.dart';
import 'package:MovieWorld/screens/News/News.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import '../../constant/ColorConstant.dart';
import 'package:MovieWorld/screens/Homepage/Homepage.dart';
import '../ButtonGradient.dart';
import 'CommingsoonScreen.dart';
import 'OptionTab.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NowshowingScreen extends StatefulWidget {
  @override
  _NowshowingScreen createState() => _NowshowingScreen();
}

class _NowshowingScreen extends State<NowshowingScreen>  {
  String type = "now-showing";

//  String url;
//  List<Movie> data;

  void choseOption(type) {
    setState(() {
      this.type = type;
    });
  }

  @override
  void initState() {
    String url  = UrlConstant.URL_FILM + 'now-showing';
    {
      http.get(url).then((http.Response response) {
        setState((){
          data = new List<Movie>();
          json.decode(response.body).forEach((json) {
            data.add(Movie.fromJson(json));
          });
        });
      });
      print('222');
    };
  }

  @override
  Widget build(BuildContext context) {

//    url  = UrlConstant.URL_FILM + 'now-showing';
//    if (data == null) {
//      http.get(url).then((http.Response response) {
//        setState((){
//          data = new List<Movie>();
//          json.decode(response.body).forEach((json) {
//            data.add(Movie.fromJson(json));
//          });
//        });
//      });
//    };

    return (type== 'now-showing')
        ? MainLayOut.getMailLayout(
        context,
        Container(
          color: ColorConstant.VIOLET,
          child: Column(
            children: <Widget>[
              Container(
                //height: 500,
                height: MediaQuery.of(context).size.height * 0.77,
                child: ListView(
                  children: <Widget>[
                    BannerImage(),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 10.0),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ButtonGradient(
                              type,
                              "now-showing",
                              StringConstant.NOW_SHOWING,
                                  () => choseOption("now-showing")),
                          ButtonGradient(
                              type,
                              "coming-soon",
                              StringConstant.COMMING_SOON,
                                  () => choseOption("coming-soon")),
                        ],
                      ),
                    ),
                    //OptionTab('now-showing'),
                    Container(
                      // height: 435,
                        height: MediaQuery.of(context).size.height * 0.675,
                        child: CategoryMovie(type)),

//                      Container(
//                         // height: 435,
//                          height: MediaQuery.of(context).size.height * 0.675,
//                          child: MyHomepage()),
                    //MyHomepage(),
                  ],
                ),
              )
            ],
          ),

        )
        ,
        "HOME", "Home");
        : CommingsoonScreen();
  }
}
