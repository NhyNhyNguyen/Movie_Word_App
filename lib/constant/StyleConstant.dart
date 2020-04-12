import 'package:flutter/material.dart';

class StyleConstant {
  static const TextStyle normalTextStyle = TextStyle(
      color: Colors.black,
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
      color: Colors.black,
      fontFamily: "Poppins-Medium",
      fontSize: 15,
      fontWeight: FontWeight.normal);
  static const TextStyle headerTextStyle = TextStyle(
      color: Colors.black,
      fontFamily: "Poppins-Medium",
      fontSize: 30,
      fontWeight: FontWeight.bold
  );

  static const TextStyle buttonTextStyle = TextStyle(
      color: Colors.white,
      fontFamily: "Poppins-Medium",
      fontSize: 30,
      fontWeight: FontWeight.bold
  );
  static const UnderlineInputBorder enabledBorder =
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey));
  static const focusedBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
  );
}
