import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:flutter/material.dart';

class ButtonGradient extends StatelessWidget {
  final String type;
  final String typeoption;
  final String text;
  final Function selectHandler;

  ButtonGradient(this.type, this.typeoption, this.text, this.selectHandler);
  @override
  Widget build(BuildContext context) {
    return
      Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: ColorConstant.RAINBOW_BUTTON,
      ),
      child: FlatButton(
        child: type == typeoption
            ? Text(text, style: StyleConstant.btnSelectedStyle)
            : Text(text, style:StyleConstant.btnNormalStyle ),
        onPressed: selectHandler,
      ),
    );
  }
}
