import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/screens/Homepage/FakeData.dart';
import 'package:flutter/material.dart';

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
          child: Column(
            children: <Widget>[
              Container(
                child: Image.asset(detailMovie[0].imageUrl),
              ),


            ],
          ),
        )
        ,
        "HOME");
  }
}
