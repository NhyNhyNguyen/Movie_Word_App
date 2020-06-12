import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RatingMovieDialog extends StatefulWidget {
  String id;
  RatingMovieDialog (this.id);
  @override
  _RatingMovieDialogState createState() => _RatingMovieDialogState(id);
}

class _RatingMovieDialogState extends State<RatingMovieDialog> {
  String id;
  _RatingMovieDialogState (this.id);
  static dynamic data;
  int lastRate = 0;

  get_rate(){
    String url = UrlConstant.URL_GET_RATE +"userId=1" + "&filmId=" + id;
    if (data == null) {
      http.get(url).then((http.Response response) {
        setState(() => data = json.decode(response.body) );
      });
    };
    lastRate = data["point"];
  }


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
    get_rate();
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
            Navigator.of(context).pop(lastRate);
            print(lastRate);
          },
        )
      ],
    );
  }
}