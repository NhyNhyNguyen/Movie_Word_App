
import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/model/Movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'BannerImage.dart';
import 'MovieItem.dart';
import 'OptionTab.dart';
import 'dart:math' as math;

class CategoryMovie extends StatelessWidget{
  List<Movie> data;
  CategoryMovie(this.data);

  @override
  Widget build(BuildContext context) {

    if (data == null) return Container(
      child: Icon(Icons.cached, color: ColorConstant.GRAY_TEXT, size: 50,),
    );
        return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        children:
        data.map(
               (item) =>MovieItem(item.id.toString(), item.name, item.poster, item.genres)
        ).toList()
    );

  }
}







