import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, ),
      padding: EdgeInsets.all(0),
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Image.asset(ImageConstant.POSTER2, fit: BoxFit.cover, height: 50, width: 50, ),
              )
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,),
              height:  MediaQuery.of(context).size.height * 0.1,
              child: Column(
                mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Lam Thi Bong" , style: StyleConstant.mediumTxtStyle,),
                  Text("Phim hay thiet nheeee", style: StyleConstant.smallTxtStyle,)
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}
