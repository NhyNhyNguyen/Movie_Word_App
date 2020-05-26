
import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/screens/DetailMovie/Description.dart';
import 'package:MovieWorld/screens/DetailMovie/DuarationRate.dart';
import 'package:MovieWorld/screens/DetailMovie/MovieContent.dart';
import 'package:MovieWorld/screens/DetailMovie/Poster.dart';
import 'package:MovieWorld/screens/Homepage/FakeData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Trailer.dart';
import 'CommentMovie.dart';

class DetailMovieScreen extends StatelessWidget {
  final String id;
  DetailMovieScreen(@required this.id);

  @override
  Widget build(BuildContext context) {

    final detailMovie = FAKE_DATA.where((movie) {
      return movie.id.contains(id);
    }).toList();

    return MainLayOut.getMailLayout(
        context,
        Container(
          color: ColorConstant.VIOLET,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                Poster(detailMovie[0].imageUrl, detailMovie[0].name, detailMovie[0].genre, detailMovie[0].rate),
                Description(detailMovie[0].premiere, detailMovie[0].timeLimit, detailMovie[0].artist, detailMovie[0].director, detailMovie[0].nation),
                MovieContent(detailMovie[0].content),
                Trailer(),
                CommentMovie(),
                Text(detailMovie[0].timeLimit.toString()),


              ],
            ),
          ),
        )
        ,
        "DETAIL");
  }
}
