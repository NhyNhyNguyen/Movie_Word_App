import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/screens/Booking/SeatStatus.dart';
import 'package:flutter/material.dart';

class Seat extends StatefulWidget {
  final SeatStatus status;

  Seat({this.status});

  @override
  _SeatState createState() => _SeatState(status: this.status);
}

class _SeatState extends State<Seat> {
  final SeatStatus status;

  _SeatState({this.status});

  @override
  Widget build(BuildContext context) {
    return status == SeatStatus.AVAILABLE
        ? Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: ColorConstant.LIGHT_VIOLET),
            child: FlatButton(
              onPressed: () => {},
            ))
        : (status == SeatStatus.SELECTED
            ? Container(
                margin: EdgeInsets.all(4),
                width: MediaQuery.of(context).size.width*0.095,
                height: MediaQuery.of(context).size.width*0.095,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: ColorConstant.RAINBOW_BUTTON,
                ),
                child: FlatButton(
                  onPressed: () => {},
                ))
            : Container(
                margin: EdgeInsets.all(4),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: ColorConstant.WHITE),
                child: FlatButton(
                  onPressed: () => {},
                )));
  }
}
