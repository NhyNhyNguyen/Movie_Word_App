import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/screens/Booking/Poster.dart';
import 'package:MovieWorld/screens/Homepage/BannerImage.dart';
import 'package:flutter/material.dart';

class OrderTicket extends StatefulWidget {
  @override
  _OrderTicketState createState() => _OrderTicketState();
}

class _OrderTicketState extends State<OrderTicket> {
  String filmName;
  List<String> title = ["THEATRE", "SHOW TIME", "DATE", "AVALEBLE IN", "SEATS"];
  List<String> content = ["Chiec la cuon bay", "9:00 PM", "Tue 22/2/2020", "MAX4D", "F1, F2 & F3"];
   double infoHeight;
  @override
  Widget build(BuildContext context) {
    infoHeight = MediaQuery.of(context).size.height * 0.4;
    return MainLayOut.getMailLayout(
        context,
        Container(
          width: double.infinity,
          height: double.infinity,
          color: ColorConstant.VIOLET,
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  height: infoHeight + 10,
                  decoration: BoxDecoration(
                      color: ColorConstant.LIGHT_VIOLET,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30))),
                ),
                Container(
                  height: infoHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Chiec la cuon bay",
                            style: StyleConstant.headerTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Action, scrience",
                            style: StyleConstant.normalTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            height: infoHeight - MediaQuery.of(context).size.height * 0.05,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: title.map((e) => Container(
                                child: Text(e, style: StyleConstant.hintTextStyle,),
                              )).toList(),
                            ),
                          ),
                          Container(
                            padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            height: infoHeight - MediaQuery.of(context).size.height * 0.05,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: content.map((e) => Container(
                                child: Text(e, style: StyleConstant.smallTextStyle,),
                                margin: EdgeInsets.all(5),
                              )).toList(),
                            ),
                          ),
                          Poster(imageUrl: "https://scontent.fdad3-1.fna.fbcdn.net/v/t1.0-9/104123205_2701158453487820_8112518029686976541_o.jpg?_nc_cat=110&_nc_sid=85a577&_nc_ohc=KodH-Mqof1gAX-PAT5Y&_nc_ht=scontent.fdad3-1.fna&oh=96b9b54c9802e2ee1e6635c095aaaf71&oe=5F0A3EAD",),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        "FILM");
  }
}
