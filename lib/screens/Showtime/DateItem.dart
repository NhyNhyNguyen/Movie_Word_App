import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:flutter/material.dart';

class DateItem extends StatefulWidget {
  final String dayOfWeek;
  final int day;
  final bool isSelected;
  DateItem(this.dayOfWeek, this.day,  this.isSelected);
  @override
  _DateItemState createState() => _DateItemState(dayOfWeek, day, isSelected);
}
class _DateItemState extends State<DateItem> {
  final String dayOfWeek;
  final int day;
  final bool isSelected;
  _DateItemState(this.dayOfWeek, this.day,  this.isSelected);
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Container(
        width: 45,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(22)),
          gradient: ColorConstant.RAINBOW_BUTTON,
        ),
        child: InkWell(
          onTap: () => {},
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  day.toString(),
                  style:TextStyle(fontSize: 22, color: ColorConstant.WHITE, fontWeight:FontWeight.w600),
                ),
                Text(
                  dayOfWeek,
                  style:TextStyle(fontSize: 14, color: ColorConstant.WHITE),
                  maxLines: 1,
                ),
              ],
            ),
          ),
        )
    )
        : Container(
        width: 45,
        padding: EdgeInsets.all(0),
        child: InkWell(
          onTap: () => {},
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  day.toString(),
                  style:TextStyle(fontSize: 20, color: ColorConstant.GRAY_TEXT, fontWeight:FontWeight.w400),
                ),
                Text(
                  dayOfWeek,
                  style:TextStyle(fontSize: 14, color: ColorConstant.GRAY_TEXT),
                  maxLines: 1,
                ),
              ],
            ),
          ),
        )
    );
  }
}
