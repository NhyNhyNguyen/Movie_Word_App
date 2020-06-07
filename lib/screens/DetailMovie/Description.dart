import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/screens/News/News.dart';
import 'package:flutter/material.dart';
import 'ButtonBookTicket.dart';
import 'Test.dart';


class Description extends StatelessWidget {
  final String premiere;
  final String timeLimit;
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
                Row(
                  children: <Widget>[
                    Text("Premiere: ", style: StyleConstant.mediumTxtStyle,),
                    Text(premiere, style: StyleConstant.smallTxtStyle,)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Duration: ", style: StyleConstant.mediumTxtStyle,),
                    Text(timeLimit+ " mins", style: StyleConstant.smallTxtStyle,)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Cast: ", style: StyleConstant.mediumTxtStyle,),
                    Text(cast, style: StyleConstant.smallTxtStyle,)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Director: ", style: StyleConstant.mediumTxtStyle,),
                    Text(director, style: StyleConstant.smallTxtStyle,)
                  ],
                ),
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
