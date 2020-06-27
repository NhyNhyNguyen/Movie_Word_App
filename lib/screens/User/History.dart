import 'dart:convert';

import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ConstantVar.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/model/Booking.dart';
import 'package:MovieWorld/model/UserDetail.dart';
import 'package:MovieWorld/screens/ButtonGradientLarge.dart';
import 'package:MovieWorld/screens/User/Avatar.dart';
import 'package:MovieWorld/screens/User/ChooseProfile.dart';
import 'package:MovieWorld/screens/User/DetailScreen.dart';
import 'package:MovieWorld/screens/User/HistoryItem.dart';
import 'package:MovieWorld/screens/User/LoginScreen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class History extends StatefulWidget {
  @override
  _History createState() => _History();
}

class _History extends State<History> {
  List<Booking> data;

  @override
  void initState() {
      fetchUserHistory(ConstantVar.jwt).then((value) => setState((){

      }));
  }

   Future<bool> fetchUserHistory(String jwt) async {
    if (jwt != "" && jwt != null) {
      final response = await http.get(UrlConstant.HISTORY, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $jwt',
      });
      print(json.decode(response.body));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON
        setState(() {
          data = new List<Booking>();
          json.decode(response.body).forEach((json) {
              data.add(Booking.fromJson(json));

          });
        });
        return true;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        if(response.statusCode == 403){
          ConstantVar.jwt = "";
          ConstantVar.userDetail = null;
        }
        return false;
      }
    }else{
      ConstantVar.isLogin = false;
      ConstantVar.userDetail = null;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return data != null
        ?  MainLayOut.getMailLayout(
                context,
                Container(
                    color: ColorConstant.VIOLET,
                    padding:
                        EdgeInsets.symmetric( vertical: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: SingleChildScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            padding: EdgeInsets.only(bottom: 50.0, left: 20, right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: List.generate(data.length, (index) => HistoryItem(booking: data[index]))
                                 .toList(),
                            ),
                          ),
                        ),
                      ],
                    )),
                "USER", "History")
        : Container();
  }
}
