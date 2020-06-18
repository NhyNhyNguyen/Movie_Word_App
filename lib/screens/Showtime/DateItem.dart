import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateItem extends StatefulWidget {
  final DateTime date;
  final bool isSelected;
  final int duration;
  DateItem( this.date,  this.isSelected, this.duration);
  @override
  _DateItemState createState() => _DateItemState( date, isSelected, duration);
}
class _DateItemState extends State<DateItem> {
  final DateTime date;
  final bool isSelected;
  final int duration;
  _DateItemState( this.date,  this.isSelected, this.duration);
  @override
  Widget build(BuildContext context) {
    DateTime newDate = date.add(Duration(days: duration));
    return isSelected
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
                  style:TextStyle(fontSize: 22, color: ColorConstant.WHITE, fontWeight:FontWeight.w600),
                ),
                Text(
                  DateFormat('EEEE').format(newDate),
                  style:TextStyle(fontSize: 14, color: ColorConstant.WHITE),
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
                  style:TextStyle(fontSize: 20, color: ColorConstant.GRAY_TEXT, fontWeight:FontWeight.w400),
                ),
                Text(
                  DateFormat('EEEE').format(newDate),
                  style:TextStyle(fontSize: 14, color: ColorConstant.GRAY_TEXT),
                  maxLines: 1,
                ),
              ],
            ),
          ),
    );
  }
}
