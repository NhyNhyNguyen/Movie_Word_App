import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
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
  final booking;

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Poster(
            imageUrl:
            "https://scontent.fdad3-1.fna.fbcdn.net/v/t1.0-9/104123205_2701158453487820_8112518029686976541_o.jpg?_nc_cat=110&_nc_sid=85a577&_nc_ohc=KodH-Mqof1gAX-PAT5Y&_nc_ht=scontent.fdad3-1.fna&oh=96b9b54c9802e2ee1e6635c095aaaf71&oe=5F0A3EAD",
          ),
          Container(
            padding: EdgeInsets.only(right: 5, bottom: 10, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: content
                  .map((e) => Container(
                        height: 35,
                        child: Text(e,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Open Sans",
                            )),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
