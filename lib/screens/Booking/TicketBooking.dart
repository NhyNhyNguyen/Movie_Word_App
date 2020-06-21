import 'dart:convert';
import 'dart:math';

import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ConstantVar.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/model/DateTimeShowFilm.dart';
import 'package:MovieWorld/model/Seat.dart';
import 'package:MovieWorld/screens/Booking/RoomType.dart';
import 'package:MovieWorld/screens/Booking/SeatMap.dart';
import 'package:MovieWorld/screens/ButtonGradientLarge.dart';
import 'package:MovieWorld/screens/User/ChoosePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

class BookingTicket extends StatefulWidget {
  final int filmId;
  final String name;

  BookingTicket({Key key, this.filmId, this.name}) : super(key: key);

  @override
  _BookingTicketState createState() =>
      _BookingTicketState(this.filmId, this.name);
}

class _BookingTicketState extends State<BookingTicket> {
  List<DateTimeShowFilm> data = [];
  final int filmId;
  final String name;
  int selected = 0;
  int timeSelected = 0;

  _BookingTicketState(this.filmId, this.name);

  @override
  void initState() {
    print("film id" + filmId.toString());
    fetchShowTimeFilm().then((value) => setState(() {}));
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
        data = new List<DateTimeShowFilm>();
        json.decode(response.body).forEach((json) {
          List<String> time = [];
          json['timeList'].forEach((e) {
            time.add(e);
          });
          data.add(DateTimeShowFilm(json['date'], time));
          print("show time film $filmId" + data.toString());
        });
      });
      return true;
    } else {
      // If the server did not return a 200 K response,
      // then throw an exception.

      return false;
    }
  }

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
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        name,
                        style: StyleConstant.headerTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ]
                ),
                SizedBox(
                  height: 30,
                ),
                Text(data[selected].date, style: StyleConstant.formTextStyle),
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
                                      data[index].date.substring(5, 7),
                                      style: StyleConstant.formTextStyle,
                                    ),
                                    Text(
                                      data[index].date.substring(0, 3),
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
                            itemCount: data[selected].time.length,
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
                                            data[selected]
                                                .time[index]
                                                .substring(0, 5),
                                            style:
                                                StyleConstant.btnSelectedStyle,
                                          ),
                                          Text(
                                            data[selected]
                                                .time[index]
                                                .substring(8),
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
                SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonGradientLarge(
                        StringConstant.CHOOSE_YOUR_SEAT,
                        () => {
                              if (ConstantVar.jwt == "")
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChoosePageScreen()))
                                }
                              else
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SeatMap(
                                                filmId: filmId,
                                                dateTime: data[selected]
                                                        .date
                                                        .toString() +
                                                    " " +
                                                    data[selected]
                                                        .time[timeSelected]
                                                        .toString(), filmName: name
                                              )))
                                }
                            }),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                )
              ],
            ),
          ),
        ),
        "USER",
        "Choose Time");
  }
}
