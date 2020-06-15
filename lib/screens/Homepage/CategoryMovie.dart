
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
  String status;
  CategoryMovie(this.status);
  @override
  CategoryMovieState createState() => CategoryMovieState(status);
}

class CategoryMovieState extends State<CategoryMovie> {
  String status;
  CategoryMovieState(this.status);

  String url;
  List<Movie> data;

  @override
  Widget build(BuildContext context) {
    url  = UrlConstant.URL_FILM + status;
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
    if (data == null) return Container(
      child: Icon(Icons.cached, color: ColorConstant.GRAY_TEXT, size: 50,),
    );

        return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        children:
        data.map(
                //(item) =>MovieItem(item["id"].toString(), item["name"], item["poster"], item["genres"])
               (item) =>MovieItem(item.id.toString(), item.name, item.poster, item.genres)
        ).toList()
    );
//    return new ListView.builder(
//        itemCount: data == null ? 1 : data.length,
//        itemBuilder: (context, index) {
//          if (data == null) return Text("null");
//          return new ListTile(
//            title: new Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                new Text(data[index]["name"], style: new TextStyle(color: Colors.red, fontSize: 16.0, fontWeight: FontWeight.bold),),
//                 ],
//            ),
//          );
//        }
//    );
  }
}


//class CategoryMovie extends StatelessWidget {
//  final String status;
//  CategoryMovie(@required this.status);
//
//  @override
//  Widget build(BuildContext context) {
//    final categoryMovie = FAKE_DATA.where((movie) {
//      return movie.status.contains(status);
//    }).toList();
//
//    return GridView.count(
//        crossAxisCount: 2,
//        childAspectRatio: 0.75,
//        children:
//        categoryMovie.map(
//                (item) =>MovieItem(item.id,item.name, item.imageUrl, item.rate)
//        ).toList()
//    );
//  }
//}





