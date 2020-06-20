import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateItem extends StatelessWidget {
  final DateTime date;
  final int duration;
  final String index;

  DateItem(this.date, this.duration, this.index);
  @override
  Widget build(BuildContext context) {
    DateTime newDate = date.add(Duration(days: duration));

    List<String> listDayOfWeek = ['','mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];


    return (index == duration.toString())
        ? Container(
        width: 45,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(22)),
          gradient: ColorConstant.RAINBOW_BUTTON,
        ),
        child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  DateFormat('d').format(newDate),
                  style: StyleConstant.formTextStyle,
                ),
                Text(
                  listDayOfWeek[newDate.weekday].toUpperCase(),
                  style: StyleConstant.moreSmallTextStyle,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        )
        : Container(
        width: 45,
        padding: EdgeInsets.all(0),
        child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  DateFormat('d').format(newDate),
                  style: StyleConstant.formTextStyle,
                ),
                Text(
                  listDayOfWeek[newDate.weekday].toUpperCase(),
                  style: StyleConstant.moreSmallTextStyle,
                  maxLines: 1,
                ),
              ],
            ),
          ),
    );
  }
}
