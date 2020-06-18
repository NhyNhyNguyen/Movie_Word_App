import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RatingMovieDialog extends StatefulWidget {
  int lastRate;
  RatingMovieDialog (this.lastRate);
  @override
  _RatingMovieDialogState createState() => _RatingMovieDialogState(lastRate);
}

class _RatingMovieDialogState extends State<RatingMovieDialog> {
  int lastRate;
  _RatingMovieDialogState (this.lastRate);
  static dynamic data;
  //int lastRate = id;

//  get_rate(){
//    String url = UrlConstant.URL_GET_RATE +"userId=1" + "&filmId=" + id;
//    if (data == null) {
//      http.get(url).then((http.Response response) {
//        setState(() => data = json.decode(response.body) );
//      });
//    };
//    lastRate = data["point"];
//  }


  Widget _buildStar(int starCount) {
    return InkWell(
      child: Icon(
        Icons.star,
        size: 30.0,
        color: lastRate >= starCount ? Colors.orangeAccent : ColorConstant.GRAY_TEXT,
      ),
      onTap: () {
        setState(() {
          lastRate = starCount;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //get_rate();
    return AlertDialog(
      title: Center(child: Text('Rate this movie', style: TextStyle(fontSize: 25),),),
      content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildStar(1),
                  _buildStar(2),
                  _buildStar(3),
                  _buildStar(4),
                  _buildStar(5),
                ],
              ),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: Navigator.of(context).pop,
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            //post new rate point
          },
        )
      ],
    );
  }
}