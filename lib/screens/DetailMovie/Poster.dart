import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class Poster extends StatelessWidget {
  final String imageUrl;
  final String name;
  final List genre;
  final double rate;

  const Poster(this.imageUrl, this.name, this.genre, this.rate);


  @override
  Widget build(BuildContext context) {

    void _showRatingDialog() {
      showDialog(
          context: context,
          barrierDismissible: false, // set to false if you want to force a rating
          builder: (context) {
            return RatingDialog(
              icon: Icon(Icons.movie, color: ColorConstant.VIOLET, size: 50,), // set your own image/icon widget
              title: "The Rating Dialog",
              description:
              "Tap a star to set your rating.",
              submitButton: "SUBMIT",
              positiveComment: "We are so happy to hear :)", // optional
              negativeComment: "We're sad to hear :(", // optional
              accentColor: Colors.yellow, // optional
              onSubmitPressed: (int rating) {
                print("onSubmitPressed: rating = $rating");
                // TODO: open the app's page on Google Play / Apple App Store
              },
            );
          });
    }


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
                        onTap: _showRatingDialog,
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
