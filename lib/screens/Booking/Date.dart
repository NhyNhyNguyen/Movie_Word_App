import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:flutter/material.dart';

class Date extends StatefulWidget {
  final String date;
  final int day;
  final bool selected;

  Date({this.date, this.day, this.selected});

  @override
  _DateState createState() =>
      _DateState(date: date, day: day, selected: selected);
}

class _DateState extends State<Date> {
  final String date;
  final int day;
  final bool selected;

  _DateState({this.date, this.day, this.selected});

  @override
  Widget build(BuildContext context) {
    return selected
        ? Container(
            width: 60,
            height: 83,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(22)),
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
                      day.toString(),
                      style: StyleConstant.formTextStyle,
                    ),
                    Text(
                      date,
                      style: StyleConstant.moreSmallTextStyle,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            )
          )
        : Container(
        width: 60,
        height: 83,
        child: FlatButton(
          onPressed: () => {},
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  day.toString(),
                  style: StyleConstant.formTextStyle,
                ),
                Text(
                  date,
                  style: StyleConstant.moreSmallTextStyle,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        )
    );
  }
}
