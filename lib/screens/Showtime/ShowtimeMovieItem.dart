import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/screens/DetailMovie/DetailMovieScreen.dart';
import 'package:MovieWorld/screens/DetailMovie/Test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';

class ShowtimeMovieItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final List genres;
  final String timeLimit;
  final List showtime;

  ShowtimeMovieItem(
      @required this.name,
      @required this.imageUrl,
      @required this.genres,
      @required this.timeLimit,
      @required this.showtime
      ) ;

  Widget TimeItem(String time){
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: ColorConstant.GRAY_TEXT,
          ),
      ),
      child: InkWell(
        onTap: null,
          child: Text(time, style: StyleConstant.mediumTxtStyle,)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstant.LIGHT_VIOLET,
          borderRadius: BorderRadius.all(Radius.circular(30)),),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Container(
                      height: 120,
                      width: 120,
                      child: Image.network(UrlConstant.URL_IMAGE+ imageUrl, fit: BoxFit.cover, )),),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style:TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: ColorConstant.WHITE,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,),
                      Text(genres[0]["name"], style: StyleConstant.mediumTxtStyle,),
                      Text(timeLimit + ' mins', style: StyleConstant.mediumTxtStyle,),
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only( top: 10),
              child: Row(
              children: <Widget>[
                TimeItem(showtime[0]),
                TimeItem(showtime[0]),
              ],),
            ),
          ],
          )
        ),
    );
  }
}
