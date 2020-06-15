import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/screens/Booking/Poster.dart';
import 'package:MovieWorld/screens/ButtonGradient.dart';
import 'package:MovieWorld/screens/ButtonGradientLarge.dart';
import 'package:MovieWorld/screens/Homepage/BannerImage.dart';
import 'package:flutter/material.dart';

class OrderTicket extends StatefulWidget {
  @override
  _OrderTicketState createState() => _OrderTicketState();
}

class _OrderTicketState extends State<OrderTicket> {
  String filmName;
  List<String> title = ["THEATRE", "SHOW TIME", "DATE", "AVALEBLE IN", "SEATS"];
  List<String> content = [
    "Chiec la cuon bay",
    "9:00 PM",
    "Tue 22/2/2020",
    "MAX4D",
    "F1, F2 & F3"
  ];
  double infoHeight;
  double priceHeight;
  @override
  Widget build(BuildContext context) {
    infoHeight = MediaQuery.of(context).size.height * 0.42;
    priceHeight = MediaQuery.of(context).size.height * 0.4;
    return MainLayOut.getMailLayout(
        context,
        Container(
          width: double.infinity,
          height: double.infinity,
          color: ColorConstant.VIOLET,
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      height: infoHeight,
                      decoration: BoxDecoration(
                          color: ColorConstant.LIGHT_VIOLET,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25))),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: priceHeight,
                      decoration: BoxDecoration(
                          color: ColorConstant.LIGHT_VIOLET,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                    ),
                  ],
                ),
                Container(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: title
                                  .map((e) => Container(
                                        height: 35,
                                        padding: EdgeInsets.all(5),
                                        child: Text(e,
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Open Sans",
                                            )),
                                      ))
                                  .toList(),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(right: 10, bottom: 10, top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                        padding: EdgeInsets.all(5),
                                      ))
                                  .toList(),
                            ),
                          ),
                          Poster(
                            imageUrl:
                                "https://scontent.fdad3-1.fna.fbcdn.net/v/t1.0-9/104123205_2701158453487820_8112518029686976541_o.jpg?_nc_cat=110&_nc_sid=85a577&_nc_ohc=KodH-Mqof1gAX-PAT5Y&_nc_ht=scontent.fdad3-1.fna&oh=96b9b54c9802e2ee1e6635c095aaaf71&oe=5F0A3EAD",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                                color: ColorConstant.LIGHT_VIOLET,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25))),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "SUMMARY",
                                    style: StyleConstant.headerTextStyle,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Sub fee",
                                            style: StyleConstant.priceTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Quantity",
                                            style: StyleConstant.priceTextStyle,
                                          ),
                                          Container(
                                            width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
//                                            decoration: BoxDecoration(
//                                                border: Border(
//                                                    top: BorderSide(width: 1, color: ColorConstant.WHITE))),
                                            margin: EdgeInsets.only(
                                                left: 20, top: 10, bottom: 10),
                                          ),
                                          Text(
                                            "Total fee",
                                            style: StyleConstant.priceTextStyle,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "  :     200\$",
                                            style: StyleConstant.priceTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "  :     3",
                                            style: StyleConstant.priceTextStyle,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(
                                                        color:
                                                            ColorConstant.WHITE,
                                                        width: 1))),
                                            margin: EdgeInsets.only(
                                                right: 20, top: 10, bottom: 10),
                                          ),
                                          Text(
                                            "  :     600\$",
                                            style: StyleConstant.priceTextStyle,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      ButtonGradientLarge("Buy ticket", () => {})
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      )
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
