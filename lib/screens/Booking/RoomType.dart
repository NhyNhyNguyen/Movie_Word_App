import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:flutter/material.dart';

class RoomType extends StatefulWidget {
  final String type;
  final bool selected;

  RoomType({this.type, this.selected});

  @override
  _RoomTypeState createState() =>
      _RoomTypeState(type: this.type);
}

class _RoomTypeState extends State<RoomType> {
  final String type;
  final bool selected;


  _RoomTypeState({this.type, this.selected});

  @override
  Widget build(BuildContext context) {
    return selected
        ? Container(
        margin: EdgeInsets.only(left: 3,right: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              gradient: ColorConstant.RAINBOW_BUTTON,
            ),
            child: FlatButton(
              onPressed: () => {},
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      type.toString(),
                      style: StyleConstant.btnSelectedStyle,
                    ),
                  ],
                ),
              ),
            ))
        : Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.width * 0.15,
            margin: EdgeInsets.only(left: 3,right: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: ColorConstant.VIOLET
            ),
            child: FlatButton(
              onPressed: () => {},
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      type.toString(),
                      style: StyleConstant.btnSelectedStyle,
                    ),
                  ],
                ),
              ),
            ));
  }
}
