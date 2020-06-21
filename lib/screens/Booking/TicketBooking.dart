import 'dart:convert';
import 'dart:math';

import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/model/Seat.dart';
import 'package:MovieWorld/screens/Booking/RoomType.dart';
import 'package:MovieWorld/screens/Booking/Seat.dart';
import 'package:MovieWorld/screens/Booking/SeatMap.dart';
import 'package:MovieWorld/screens/Booking/SeatStatus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

class BookingTicket extends StatefulWidget {
  final int filmId;
  List<String> selectedSeat;

  BookingTicket({Key key, this.filmId}) : super(key: key);

  @override
  _BookingTicketState createState() => _BookingTicketState(this.filmId);
}

class _BookingTicketState extends State<BookingTicket> {
  List<String> data;
  List<String> time;
  final int filmId;
  int selected = 0;
  int timeSelected = 0;
  List<String> seatSelected = [];

  int row = 8;
  int col = 8;
  List<String> seatRow = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];

  var seats;

  void createData() {
    seats = List.generate(row, (i) => List(col), growable: false);
    for (int i = 0; i < row; i++) {
      for (int j = 0; j < col; j++) {
        String id = seatRow[i] + j.toString();
        int status = (Random()).nextInt(2);
        seats[i][j] = Seat(id, status);
      }
    }
    print(seats);
  }

  _BookingTicketState(this.filmId);

  List<Widget> _getSeats() {
    final List<Widget> seatItems = <Widget>[];
    for (int i = 0; i < col; i++) {
      for (int j = 0; j < col; j++) {
        int status = (seats[i][j]).status;
        seatItems.add(Container(
            width: seatHeight,
            height: seatHeight,
            margin: EdgeInsets.all(4),
            decoration: status == 0
                ? BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border:
                        Border.all(color: ColorConstant.LIGHT_VIOLET, width: 3))
                : status == 1
                    ? BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: ColorConstant.WHITE)
                    : BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: ColorConstant.RAINBOW_BUTTON,
                      ),
            child: FlatButton(
              onPressed: () => {
                setState(() {
                  if (seats[i][j].status == 0) {
                    seats[i][j].status = 2;
                    seatSelected.add(seatRow[i] + j.toString());
                    print(seatRow[i] + j.toString());
                  }
                })
              },
            )));
      }
    }
    return seatItems;
  }

  @override
  void initState() {
    print("film id" + filmId.toString());
    fetchShowTimeFilm().then((value) => setState(() {}));
    createData();
  }

  Future<bool> fetchShowTimeFilm() async {
    final response = await http
        .get(UrlConstant.SHOW_TIME_FILM + "?filmId=$filmId", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    print(json.decode(response.body));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      setState(() {
        data = new List<String>();
        json.decode(response.body).forEach((json) {
          data.add(json['date']);
          print(json['timeList']);
        });
      });
      return true;
    } else {
      // If the server did not return a 200 K response,
      // then throw an exception.

      return false;
    }
  }

  double seatHeight = 30;

  @override
  Widget build(BuildContext context) {
    seatHeight = MediaQuery.of(context).size.width * 0.08;
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
                Text(data[selected], style: StyleConstant.formTextStyle),
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
                    child: ListView.builder(
                      itemCount: data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                            width: 63,
                            height: 83,
                            decoration: selected == index
                                ? BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(22)),
                                    gradient: ColorConstant.RAINBOW_BUTTON,
                                  )
                                : BoxDecoration(),
                            child: FlatButton(
                              onPressed: () {
                                setState(() {
                                  selected = index;
                                });
                              },
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      data[index].substring(5, 7),
                                      style: StyleConstant.formTextStyle,
                                    ),
                                    Text(
                                      data[index].substring(0, 3),
                                      style: StyleConstant.moreSmallTextStyle,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      },
                    )),
                SizedBox(
                  height: 13,
                ),
                Text("Vanue", style: StyleConstant.formTextStyle),
                SizedBox(
                  height: 13,
                ),
                Container(
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
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.width * 0.23,
                          child: ListView.builder(
                            itemCount: data.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.22,
                                  height:
                                      MediaQuery.of(context).size.width * 0.21,
                                  margin: EdgeInsets.only(left: 3, right: 3),
                                  decoration: timeSelected == index
                                      ? BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          gradient:
                                              ColorConstant.RAINBOW_BUTTON,
                                        )
                                      : BoxDecoration(),
                                  child: FlatButton(
                                    onPressed: () => {
                                      setState(() {
                                        timeSelected = index;
                                      })
                                    },
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "2:00",
                                            style:
                                                StyleConstant.btnSelectedStyle,
                                          ),
                                          Text(
                                            "AM",
                                            style:
                                                StyleConstant.normalTextStyle,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                            },
                          ),
                        ),
                        SizedBox(height: 10),
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
                Container(
                  height: 90,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SeatScreen(status: SeatStatus.AVAILABLE),
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
                          SeatScreen(status: SeatStatus.RESERVED),
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
                          SeatScreen(status: SeatStatus.SELECTED),
                          Text(
                            "SELECTED",
                            style: StyleConstant.smallTextStyle,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SeatMap(filmId: filmId,),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                )
              ],
            ),
          ),
        ),
        "USER",
        "Ticket booking");
    ;
  }
}
