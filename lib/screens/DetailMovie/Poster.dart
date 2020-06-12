import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/screens/RateMovie/RatingDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class Poster extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String name;
  final List genre;
  final double rate;

  const Poster(this.imageUrl, this.name, this.genre, this.rate, this.id);

  @override
  Widget build(BuildContext context) {
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
                  child: Image.network(UrlConstant.URL_IMAGE + imageUrl, fit: BoxFit.cover, ),
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
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(name ,
                          style: StyleConstant.bigTxtStyle,
                        ),
                        Text(genre[0]["name"],
                          style: StyleConstant.smallTxtStyle,
                        )
                      ],
                    ),
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
                        onTap: () async {
                          int stars = await showDialog(
                              context: context,
                              builder: (_) => RatingMovieDialog(id)
                          );
                          if(stars == null) return;
                          print('Selected rate stars: $stars');
                        },
                        child: Row(
                          children: <Widget>[
                            Text(rate.toString(),style: StyleConstant.mediumTxtStyle,),
                            //Image.asset(ImageConstant.RATE_ICON, fit: BoxFit.cover, height: 25,)
                            Icon(Icons.star, color: ColorConstant.YELLOW, size: 20,),
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
