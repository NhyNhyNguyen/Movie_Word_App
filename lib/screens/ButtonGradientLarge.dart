
import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:flutter/material.dart';

class ButtonGradientLarge extends StatelessWidget {
  final String text;
  final Function selectHandler;

  ButtonGradientLarge( this.text, this.selectHandler);
  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: ColorConstant.RAINBOW_BUTTON,
        ),
        child: FlatButton(
          child: Text(text, style:StyleConstant.btnLargeStyle ),
          onPressed: selectHandler,
        ),
      );
  }
}
