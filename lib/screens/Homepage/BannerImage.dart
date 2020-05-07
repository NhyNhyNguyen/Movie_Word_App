import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:flutter/material.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
ImageConstant.POSTER2,
ImageConstant.POSTER1,
ImageConstant.POSTER8,
ImageConstant.POSTER9,
];

final List<Widget> imageSliders = imgList.map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      child:
      Image.asset(item, fit: BoxFit.cover, width: 1000.0),
    ),
  ),
)).toList();



class BannerImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 200,
      height: MediaQuery.of(context).size.height * 0.27,
       color: ColorConstant.YELLOW,
       child:
       CarouselSlider(
         options: CarouselOptions(
           autoPlay: true,
           enlargeCenterPage: true,
         ),
         items: imageSliders,
       ),

    );
  }
}
