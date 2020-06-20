
import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/model/Movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dart:math' as math;

import 'ShowtimeMovieItem.dart';

class CategoryShowtimeMovie extends StatelessWidget{
  List<dynamic> data;
  CategoryShowtimeMovie(this.data);

  @override
  Widget build(BuildContext context) {
    if (data == null) return Container(
      child: Text("No showtime in this day!", style: TextStyle(color: ColorConstant.WHITE),),
    );
    return GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 1.6,
        children:
        data.map(
                (item) =>ShowtimeMovieItem(item['film']['name'], item['film']['poster'], item['film']['genres'], item['film']['filmDescription']['timeLimit'], item['time'])
        ).toList()
    );

  }
}







