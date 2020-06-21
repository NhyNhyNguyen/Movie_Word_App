
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

class CategoryMovie extends StatefulWidget {
  String type;
  CategoryMovie(this.type);

  @override
  _CategoryMovieState createState() => _CategoryMovieState(type);
}

class _CategoryMovieState extends State<CategoryMovie>  {
  String type;
  _CategoryMovieState(this.type);

  @override
  Widget build(BuildContext context) {
    String url  = UrlConstant.URL_FILM + type;
    if(data == null){
      http.get(url).then((http.Response response) {
        setState((){
          data = new List<Movie>();
          json.decode(response.body).forEach((json) {
            data.add(Movie.fromJson(json));
          });
        });
      });
      print('111');
    };

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







