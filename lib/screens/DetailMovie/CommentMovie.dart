import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/screens/DetailMovie/CommentInput.dart';
import 'package:MovieWorld/screens/DetailMovie/CommentItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CommentMovie extends StatefulWidget {
  String idMovie;
  CommentMovie(this.idMovie);
  @override
  CommentMovieState createState() => CommentMovieState(idMovie);
}

class CommentMovieState extends State<CommentMovie> {

  String idMovie;
  CommentMovieState(this.idMovie);

  String url;
  List<dynamic> data;
  @override
  Widget build(BuildContext context) {

    url  = UrlConstant.URL_COMMENT + idMovie;
    if (data == null) {
      http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json; charset=utf-8',
      }).then((http.Response response) {
        setState(() => data = json.decode(response.body) );
      });
    };
    if (data == null) return Container(
      child: Icon(Icons.cached, color: ColorConstant.GRAY_TEXT, size: 50,),
    );
    return Container(
      margin: EdgeInsets.only(bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Comments", style: StyleConstant.bigTxtStyle ,),
          ),
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: ColorConstant.LIGHT_VIOLET,
                ),
              ),
              Positioned(
                child: Container(
                    child: Column(
                      children: <Widget>[
                        CommentInput(idMovie),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: GridView.count(
                            crossAxisCount: 1,
                            childAspectRatio: 4.5,
                            children:
                            data.map(
                              (item) =>CommentItem(item["avatarUser"], item["fullNameUser"], item["content"], item["timeCreate"])
                            ).toList()
                            ),

                        ),
                      ],
                    )
                ),
              )
            ]
          ),
        ],
      ),
    );
  }
}
