import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/screens/Homepage/Homepage.dart';
import 'package:MovieWorld/screens/Homepage/NowshowingScreen.dart';
import 'package:MovieWorld/screens/News/TicketPrice.dart';
import 'package:MovieWorld/screens/User/ChoosePage.dart';
import 'package:flutter/material.dart';

class MainLayOut {
  static Widget getMailLayout(
      BuildContext context, Widget widget, String type) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.grey,
          focusColor: Colors.blueAccent,
          hoverColor: Colors.yellow,
          fontFamily: "Open Sans"
        ),
        home: Scaffold(
          appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
              child: AppBar(
                elevation: 0,
                backgroundColor: ColorConstant.LIGHT_VIOLET,
              title: Text((() {
                if(type == "HOME") return "Homepage";
                if(type == "CAL") return "Showtime";
                if(type == "FILM") return "News";
                if(type == "USER") return "Profile";
                if(type == "DETAIL") return "Detail Movie";
              })(), style: StyleConstant.appBarText,),

              )),
          body: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: double.infinity,
              ),
              widget,
              Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.015,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              alignment: Alignment.bottomCenter,
                              color: ColorConstant.LIGHT_VIOLET,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: MediaQuery.of(context).size.height * 0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  NowshowingScreen()));
                                    },
                                    child: type == 'HOME'
                                        ? Image.asset(ImageConstant.HOME_YELLOW,
                                            height: MediaQuery.of(context).size.height * 0.05)
                                        : Image.asset(ImageConstant.HOME_GRAY,
                                            height: MediaQuery.of(context).size.height * 0.05),
                                  ),
                                  InkWell(
                                    onTap: ()  {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                 null));
                                    },
                                    child: type == 'CAL'
                                        ? Image.asset(
                                            ImageConstant.CALENDAR_YELLOW,
                                            height: MediaQuery.of(context).size.height * 0.06)
                                        : Image.asset(
                                            ImageConstant.CALENDAR_GRAY,
                                            height: MediaQuery.of(context).size.height * 0.06),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      height: MediaQuery.of(context).size.height * 0.06,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TicketPriceScreen()));
                                    },
                                    child: type == 'FILM'
                                        ? Image.asset(
                                          ImageConstant.FILM_YELLOW,
                                          height: 45)
                                        : Image.asset(
                                          ImageConstant.FILM_GRAY,
                                          height: 45),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChoosePageScreen()));
                                    },
                                    child: type == 'USER'
                                        ? Image.asset(
                                            ImageConstant.PERSON_YELLOW,
                                            height: MediaQuery.of(context).size.height * 0.06)
                                        : Image.asset(ImageConstant.PERSON_GRAY,
                                            height: MediaQuery.of(context).size.height * 0.06),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.015,
                              color: ColorConstant.LIGHT_VIOLET,
                            )
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {},
                            child: Image.asset(ImageConstant.TICKET,
                                height:
                                    MediaQuery.of(context).size.height * 0.1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),);
  }
}
