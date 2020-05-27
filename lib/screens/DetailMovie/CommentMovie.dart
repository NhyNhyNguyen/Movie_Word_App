import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/screens/DetailMovie/CommentInput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class CommentMovie extends StatelessWidget {
//
//  Widget InputComment(){
//    return Container(
//      child: ,
//    )
//  }
  @override
  Widget build(BuildContext context) {
    return Column(
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
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: ColorConstant.LIGHT_VIOLET,
              ),
            ),
            Positioned(
              child: Container(
                  child: CommentInput()),
            )
          ]
        ),
      ],
    );
  }
}
