import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/screens/Booking/Date.dart';
import 'package:MovieWorld/screens/Booking/RoomType.dart';
import 'package:MovieWorld/screens/Booking/SeatStatus.dart';
import 'package:flutter/material.dart';

import 'Seat.dart';
import 'Time.dart';

class BookingTicket extends StatefulWidget {
  @override
  _BookingTicketState createState() => _BookingTicketState();
}

class _BookingTicketState extends State<BookingTicket> {
  @override
  Widget build(BuildContext context) {
    return MainLayOut.getMailLayout(
        context,
        Container(
          color: ColorConstant.VIOLET,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Tuesday 23 Jun", style: StyleConstant.formTextStyle),
                SizedBox(
                  height: 13,
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.height * 0.9,
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
                  decoration: BoxDecoration(
                      color: ColorConstant.LIGHT_VIOLET,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 15),
                            blurRadius: 15),
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, -10),
                            blurRadius: 10)
                      ]),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Date(date: "TUE", day: 23, selected: false),
                      Date(date: "TUE", day: 23, selected: false),
                      Date(date: "TUE", day: 23, selected: true),
                      Date(date: "TUE", day: 23, selected: false),
                      Date(date: "TUE", day: 23, selected: false),
                      Date(date: "TUE", day: 23, selected: false),
                      Date(date: "TUE", day: 23, selected: false),
                    ],
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Text("Vanue", style: StyleConstant.formTextStyle),
                SizedBox(
                  height: 13,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.height * 0.9,
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: ColorConstant.LIGHT_VIOLET,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 15),
                              blurRadius: 15),
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, -10),
                              blurRadius: 10)
                        ]),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Time(time: "1:00", hour: "AM", selected: false),
                            Time(time: "3:00", hour: "AM", selected: true),
                            Time(time: "9:00", hour: "AM", selected: false),
                            Time(time: "1:00", hour: "AM", selected: false),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            RoomType(type: "2D", selected: true),
                            RoomType(
                              type: "MX3D",
                              selected: false,
                            ),
                            RoomType(type: "MAX4D", selected: false),
                          ],
                        ),
                      ],
                    )),
                SizedBox(
                  height: 13,
                ),
                Container(
                  height: 80,
                  child: GridView.count(
                    crossAxisCount: 3,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Seat(status: SeatStatus.AVAILABLE),
                          Text(
                            "AVAILABLE",
                            style: StyleConstant.smallTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Seat(status: SeatStatus.RESERVED),
                          Text(
                            "RESERVED",
                            style: StyleConstant.smallTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Seat(status: SeatStatus.SELECTED),
                          Text(
                            "SELECTED",
                            style: StyleConstant.smallTextStyle,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.17,
                    width: MediaQuery.of(context).size.height * 0.9,
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Seat(status: SeatStatus.SELECTED),
                            Seat(status: SeatStatus.RESERVED),
                            Seat(status: SeatStatus.RESERVED),
                            Seat(status: SeatStatus.AVAILABLE),
                            Seat(status: SeatStatus.RESERVED),
                            Seat(status: SeatStatus.RESERVED),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Seat(status: SeatStatus.SELECTED),
                            Seat(status: SeatStatus.SELECTED),
                            Seat(status: SeatStatus.RESERVED),
                            Seat(status: SeatStatus.AVAILABLE),
                            Seat(status: SeatStatus.RESERVED),
                            Seat(status: SeatStatus.RESERVED),
                            Seat(status: SeatStatus.AVAILABLE),
                            Seat(status: SeatStatus.AVAILABLE),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
        "USER");
    ;
  }
}
