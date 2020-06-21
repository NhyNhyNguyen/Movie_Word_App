import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';

import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/model/Seat.dart';
import 'package:MovieWorld/screens/Booking/OrderTicket.dart';
import 'package:MovieWorld/screens/ButtonGradientLarge.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

class SeatMap extends StatefulWidget {
  final int filmId;

  const SeatMap({Key key, this.filmId}) : super(key: key);

  @override
  _SeatMapState createState() => _SeatMapState( this.filmId);
}

class _SeatMapState extends State<SeatMap> {

  final int filmId;
   _SeatMapState(this.filmId);

  List<String> data;
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

  List<Widget> _getSeats() {
    final List<Widget> seatItems = <Widget>[];
    for (int i = 0; i <= col; i++) {
      for (int j = 0; j <= col; j++) {
        if( i == 0 && j == 0) {
          seatItems.add(Container(
              width: seatHeight,
              height: 15,
              margin: EdgeInsets.all(1),
          ));
        }else
        if(i == 0 && j > 0){
          seatItems.add(Container(
              width: seatHeight,
              height: 15,
              margin: EdgeInsets.all(1),
              child: Text((j).toString(), style: StyleConstant.normalTextStyle, textAlign: TextAlign.center,)
          ));
          if(j == 4){
            seatItems.add(SizedBox(height: seatHeight,width: 0,))
            ;
          }
        } else
        if(j == 0 && i > 0){
          seatItems.add(Container(
              width: 15,
              height: seatHeight,
              margin: EdgeInsets.all(1),
              child: Text(seatRow[i - 1], style: StyleConstant.normalTextStyle, textAlign: TextAlign.center,)
          ));
        }else
        {
          int status = (seats[i-1][j-1]).status;

          seatItems.add(Container(
              width: seatHeight,
              height: seatHeight,
              margin: EdgeInsets.all(1),
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
                    if (seats[i-1][j-1].status == 0) {
                      seats[i-1][j-1].status = 2;
                      seatSelected.add(seatRow[i - 1] + (j - 1).toString());
                    }
                  })
                },
              )));
          if(j == 4){
            seatItems.add(SizedBox(height: seatHeight,width: 0,))
            ;
          }
        }

      }
    }
    return seatItems;
  }

  @override
  void initState() {
    print("film id" + filmId.toString());
    fetchListSeat().then((value) => setState(() {}));
    createData();
  }

  Future<bool> fetchListSeat() async {
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
          data.add(json);
          print(json);
        });
      });
      return true;
    } else {
      // If the server did not return a 200 K response,
      // then throw an exception.

      return false;
    }
  }

  double seatHeight = 20;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              height: seatHeight*18 + 60,
              padding:
              EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
              child: new GridView.count(
                  crossAxisCount: 10,
                  childAspectRatio: 1.0,
                  padding: const EdgeInsets.all(4.0),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  physics: NeverScrollableScrollPhysics(),
                  children: _getSeats())),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Seat No: " + seatSelected.join(", "),
                  style: StyleConstant.normalTextStyle),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonGradientLarge(
                  "Choose your seat",
                      () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderTicket()))
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
