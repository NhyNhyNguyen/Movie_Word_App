
import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:flutter/material.dart';

class ButtonBookTicket extends StatelessWidget {
  final String text;
  final Function selectHandler;

  ButtonBookTicket( this.text, this.selectHandler);
  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: MediaQuery.of(context).size.width * 0.33,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: ColorConstant.RAINBOW_BUTTON_BOOK,
        ),
        child: FlatButton(
          child: Column(
            children: <Widget>[
              Image.asset(ImageConstant.TICKET, fit: BoxFit.cover,height: 50,),
              Text(text, style:StyleConstant.mediumTxtStyle ),
            ],
          ),
          onPressed: selectHandler,
        ),
      );
  }
}
