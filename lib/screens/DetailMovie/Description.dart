import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:flutter/material.dart';
import 'ButtonBookTicket.dart';

class Description extends StatelessWidget {
  final String premiere;
  final int timeLimit;
  final String cast;
  final String director;
  final String nation;

  const Description(this.premiere, this.timeLimit,this.cast, this.director, this.nation);

  @override
  Widget build(BuildContext context) {
    void choseBtn(type){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => null),
      );
    }

    return Container(
      height: 150,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment:  MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Premiere: " + premiere, style: TextStyle(color: ColorConstant.GRAY_TEXT), ),
                Text("Duration: " + timeLimit.toString() + " mins",  style: TextStyle(color: ColorConstant.GRAY_TEXT),),
                Text("Cast: " + cast, style: TextStyle(color: ColorConstant.GRAY_TEXT),),
                Text("Director: " + director, style: TextStyle(color: ColorConstant.GRAY_TEXT),),
                Text("Nation: " + nation, style: TextStyle(color: ColorConstant.GRAY_TEXT),),
              ],
            ),
          ),
          Container(
            child: ButtonBookTicket(StringConstant.BOOK_TICKET,() => choseBtn ),
          )
        ],
      ),
    );
  }
}
