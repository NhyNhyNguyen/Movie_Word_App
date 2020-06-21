
import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/model/Movie.dart';
import 'package:MovieWorld/screens/DetailMovie/Description.dart';
import 'package:MovieWorld/screens/DetailMovie/DuarationRate.dart';
import 'package:MovieWorld/screens/DetailMovie/MovieContent.dart';
import 'package:MovieWorld/screens/DetailMovie/Poster.dart';
import 'package:MovieWorld/screens/Homepage/FakeData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Trailer.dart';
import 'CommentMovie.dart';

class DetailMovieScreen extends StatefulWidget {
  String id;
  DetailMovieScreen(this.id);
  @override
  _DetailMovieScreenState createState() => _DetailMovieScreenState(id);
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
   String id;
  _DetailMovieScreenState(this.id);

   String url;
   dynamic data;

  @override
  Widget build(BuildContext context) {
    url  = UrlConstant.URL_FILM + id;
    if (data == null) {
      http.get(url).then((http.Response response) {
       setState(() => data = json.decode(response.body) );
      });
    };
    if (data == null) return Container(
      child: Icon(Icons.cached, color: ColorConstant.GRAY_TEXT, size: 50,),
    );

        return MainLayOut.getMailLayout(
        context,
        Container(
          color: ColorConstant.VIOLET,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                Poster(data["poster"], data["name"], data["genres"], data["ratePoint"], data["id"].toString()),
                Description(data["filmDescription"]["premiere"], data["filmDescription"]["timeLimit"], data["filmDescription"]["artist"], data["filmDescription"]["director"], data["filmDescription"]["nation"],int.parse(id)),
                MovieContent(data["filmDescription"]["content"]),
//                Trailer(data["trailer"]),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: CommentMovie(data["id"].toString())),
//                Poster(data.poster, data.name, data.genres, data.ratePoint),
//                Description(data.premiere, data.timeLimit, data.artist, data.director, data.nation),
//                MovieContent(data.content),
//                Trailer(data.trailer),
//                CommentMovie(),


              ],
            ),
          ),
        )
        ,
        "DETAIL", "Detail");
  }
}


//class DetailMovieScreen extends StatelessWidget {
//  final String id;
//  DetailMovieScreen(@required this.id);
//
//  @override
//  Widget build(BuildContext context) {
//
//    final detailMovie = FAKE_DATA.where((movie) {
//      return movie.id.contains(id);
//    }).toList();
//
//    return MainLayOut.getMailLayout(
//        context,
//        Container(
//          color: ColorConstant.VIOLET,
//          child: SingleChildScrollView(
//            physics: AlwaysScrollableScrollPhysics(),
//            child: Column(
//              children: <Widget>[
//                Poster(detailMovie[0].imageUrl, detailMovie[0].name, detailMovie[0].genre, detailMovie[0].rate),
//                Description(detailMovie[0].premiere, detailMovie[0].timeLimit, detailMovie[0].artist, detailMovie[0].director, detailMovie[0].nation),
//                MovieContent(detailMovie[0].content),
//                Trailer(),
//                CommentMovie(),
//                Text(detailMovie[0].timeLimit.toString()),
//
//
//              ],
//            ),
//          ),
//        )
//        ,
//        "DETAIL");
//  }
//}
