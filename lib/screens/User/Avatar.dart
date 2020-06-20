import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/screens/RateMovie/RatingDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class Avatar extends StatelessWidget {
  final String imageUrl;
  final String username;
  final String email;

  const Avatar(this.imageUrl, this.username, this.email);

  @override
  Widget build(BuildContext context) {
    return Stack(
    children: <Widget>[
      Container(
        height: 120,
        decoration: BoxDecoration(
            color: ColorConstant.LIGHT_VIOLET,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
        ),
      ),
      Positioned(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                height: MediaQuery.of(context).size.height*0.3,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.network( imageUrl, fit: BoxFit.cover, ),
                )
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1.0, color: ColorConstant.LIGHT_VIOLET)),
                ),
                padding: EdgeInsets.only(bottom: 20,left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(username ,
                          style: StyleConstant.bigTxtStyle,
                        ),
                        Text(email,
                          style: StyleConstant.smallTxtStyle,
                        )
                      ],
                    ),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      )
    ],
  );
  }
}
