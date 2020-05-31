import 'package:flutter/material.dart';

import 'ColorConstant.dart';

class StyleConstant {
  static const TextStyle normalTextStyle = TextStyle(
      color: ColorConstant.WHITE,
      fontFamily: "Open Sans",
      fontSize: 20,
      fontWeight: FontWeight.normal);
  static const TextStyle formTextStyle = TextStyle(
      color: Colors.white70,
      fontFamily: "Open Sans",
      fontSize: 20,
      fontWeight: FontWeight.w600);

  static const TextStyle hintTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: "Open Sans",
  );

  static const TextStyle smallTextStyle = TextStyle(
      color: ColorConstant.WHITE,
      fontFamily: "Open Sans",
      fontSize: 15,
      fontWeight: FontWeight.normal);
  static const TextStyle headerTextStyle = TextStyle(
      color: ColorConstant.WHITE,
      fontFamily: "Open Sans",
      fontSize: 30,
      fontWeight: FontWeight.bold
  );

  static const TextStyle buttonTextStyle = TextStyle(
      color: Colors.white,
      fontFamily: "Open Sans",
      fontSize: 22,
      fontWeight: FontWeight.bold
  );

  static const TextStyle btnSelectedStyle = TextStyle(
    color: ColorConstant.WHITE,
      fontFamily: "Open Sans",
      fontWeight: FontWeight.bold,
      fontSize: 20
  );

  static const TextStyle btnNormalStyle = TextStyle(
    color: ColorConstant.BLACK,
      fontFamily: "Open Sans",
      fontWeight: FontWeight.bold,
      fontSize: 20
  );

  static const btnLargeStyle = TextStyle(
    color: ColorConstant.WHITE,
    fontSize: 30,
  );

  static const appBarText = TextStyle(
    color: ColorConstant.WHITE,
    fontSize: 25,
  );

  // style for detail page
  static const bigTxtStyle = TextStyle(
    fontSize: 24,
    color: ColorConstant.WHITE,
  );

  static const mediumTxtStyle = TextStyle(
    fontSize: 16,
    color: ColorConstant.WHITE,
  );

  static const smallTxtStyle = TextStyle(
    fontSize: 14,
    color: ColorConstant.GRAY_TEXT,
  );


  static const UnderlineInputBorder enabledBorder =
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey));
  static const focusedBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: ColorConstant.LIGHT_VIOLET),
  );



}
