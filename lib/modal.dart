import 'package:MovieWorld/screens/User/LoginScreen.dart';
import 'package:flutter/material.dart';

import 'constant/ColorConstant.dart';
class Modal{
  static void showSimpleCustomDialog(BuildContext context, String text,Function onPressed) {
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 150.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(15.0),
                child: Center(child: Text(
                  text,
                  style: TextStyle(color: ColorConstant.BLACK, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      onPressed != null ?
                      onPressed(context) : Navigator.of(context, rootNavigator: true).pop('dialog')
                      ;
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
  }

}