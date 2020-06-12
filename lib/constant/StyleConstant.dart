import 'package:flutter/material.dart';

import 'ColorConstant.dart';

class StyleConstant {
  static const TextStyle normalTextStyle = TextStyle(
      color: ColorConstant.GRAY_TEXT,
      fontFamily: "Poppins-Medium",
      fontSize: 20,
      fontWeight: FontWeight.normal);
  static const TextStyle hintTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: "Poppins-Medium",
  );

  static const TextStyle smallTextStyle = TextStyle(
      color: ColorConstant.GRAY_TEXT,
      fontFamily: "Poppins-Medium",
      fontSize: 15,
      fontWeight: FontWeight.normal);
  static const TextStyle headerTextStyle = TextStyle(
      color: ColorConstant.GRAY_TEXT,
      fontFamily: "Poppins-Medium",
      fontSize: 30,
      fontWeight: FontWeight.bold
  );

  static const TextStyle buttonTextStyle = TextStyle(
      color: Colors.white,
      fontFamily: "Poppins-Medium",
      fontSize: 23,
      fontWeight: FontWeight.bold
  );

  static const TextStyle btnSelectedStyle = TextStyle(
    color: ColorConstant.WHITE,
    fontSize: 17
  );

  static const TextStyle btnNormalStyle = TextStyle(
    color: ColorConstant.BLACK,
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
    fontWeight: FontWeight.w500,
  );

  static const smallTxtStyle = TextStyle(
    fontSize: 14,
    color: ColorConstant.GRAY_TEXT,
  );

  static const smallTxtStyleWhite = TextStyle(
    fontSize: 14,
    color: ColorConstant.WHITE,
  );

  static const txtStyleTime = TextStyle(
    fontSize: 14,
    color: ColorConstant.GRAY_TEXT,
  );



  static const UnderlineInputBorder enabledBorder =
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey));
  static const focusedBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: ColorConstant.RED),
  );



}
