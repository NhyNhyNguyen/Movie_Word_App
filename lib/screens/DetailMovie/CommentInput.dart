import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.0, color: ColorConstant.GRAY_TEXT)),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20, ),
      padding: EdgeInsets.symmetric(vertical: 10),
      height: MediaQuery.of(context).size.height * 0.13,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Image.asset(ImageConstant.POSTER, fit: BoxFit.cover, height: 50, width: 50, ),
              )
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              height:  MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  color: ColorConstant.GRAY_TEXT,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Leave your comment here...",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
