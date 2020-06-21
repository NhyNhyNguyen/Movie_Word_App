import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/model/Booking.dart';
import 'package:MovieWorld/screens/Booking/Poster.dart';
import 'package:flutter/material.dart';

class HistoryItem extends StatefulWidget {
  /* final Booking booking;

  const HistoryItem({Key key, this.booking}) : super(key: key);*/

  @override
  _HistoryItemState createState() => _HistoryItemState(Booking());
}

class _HistoryItemState extends State<HistoryItem> {
  final Booking booking;

  List<String> title = [
    "THEATRE",
    "SHOW TIME",
    "DATE",
    "AVALEBLE IN",
    "SEATS",
    ""
  ];
  List<String> content = [
    "Chiec la cuon bay",
    "9:00 PM Tue 22/2/2020",
    "MAX4D F1, F2 & F3"
  ];

  _HistoryItemState(this.booking);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 1.0, vertical: 5.0),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        decoration: BoxDecoration(
            color: ColorConstant.LIGHT_VIOLET,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 15), blurRadius: 15),
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, -10), blurRadius: 10)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Poster(imageUrl: UrlConstant.IMAGE + "iu2.jpg"),
                Container(
                  padding: EdgeInsets.only(right: 5, bottom: 10, top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ...content
                          .map((e) => Container(
                        height: 35,
                        child: Text(e,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Open Sans",
                            )),
                      ))
                          .toList(),
                      RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.white, width: 1.5)),
                        color: ColorConstant.LIGHT_VIOLET,
                        child: Text(
                          StringConstant.CANCEL,
                          style: StyleConstant.priceTextStyle,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
