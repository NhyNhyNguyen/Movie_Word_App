import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String genre;
  final double rate;

  const Poster(this.imageUrl, this.name, this.genre, this.rate);


  @override
  Widget build(BuildContext context) {
//    return Stack(
//      children: <Widget>[
//        ClipRRect(
//          borderRadius: BorderRadius.all(Radius.circular(30)),
//          child: Container(
//              height: MediaQuery.of(context).size.height*0.3,
//              width: double.infinity,
//              child: Image.asset(imageUrl, fit: BoxFit.cover, )),),
//        Positioned(
//          bottom: 0,
//          child: Container(
//            padding: EdgeInsets.all(15),
//            width: MediaQuery.of(context).size.width * 0.89,
//            height: 70,
//            decoration: new BoxDecoration(
//              borderRadius: BorderRadius.only(
//                bottomRight: Radius.circular(30),
//                bottomLeft: Radius.circular(30),
//              ),
//              gradient: ColorConstant.RAINBOW_NAME,
//            ),
//            child:  Column(
//              mainAxisAlignment: MainAxisAlignment.end,
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Text(
//                  name,
//                  style: TextStyle(
//                    fontSize: 20,
//                    color: ColorConstant.WHITE,
//                  ),
//                ),
//                Text(
//                  genre,
//                  style: TextStyle(
//                    fontSize: 14,
//                    color: ColorConstant.GRAY_TEXT,
//                  ),
//                )
//              ],
//            ),
//          ),
//        )
//      ],
//    );
  
  return Stack(
    children: <Widget>[
      Container(
        height: 120,
        decoration: BoxDecoration(
            color: ColorConstant.LIGHT_VIOLET,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
        ),
      ),
      Positioned(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                height: MediaQuery.of(context).size.height*0.3,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(imageUrl, fit: BoxFit.cover, ),
                )
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1.0, color: ColorConstant.LIGHT_VIOLET)),
                ),
                padding: EdgeInsets.only(bottom: 20,left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name,
                    style: TextStyle(
                      fontSize: 24,
                      color: ColorConstant.WHITE,
                    ),
                  ),
                      Text(genre,
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorConstant.GRAY_TEXT,
                        ),
                      )
                    ],
                  ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorConstant.WHITE,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: InkWell(
                        onTap: (){print("taped!");},
                        child: Row(
                          children: <Widget>[
                            Text(rate.toString(),style: TextStyle(fontSize: 20, color: ColorConstant.WHITE),),
                            Image.asset(ImageConstant.RATE_ICON, fit: BoxFit.cover, height: 25,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      )
    ],
  );
  }
}
