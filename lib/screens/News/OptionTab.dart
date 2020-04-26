
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';

import 'package:MovieWorld/screens/News/News.dart';

import '../../constant/ColorConstant.dart';
import '../../constant/StringConstant.dart';
import '../../constant/StyleConstant.dart';
import 'TicketPrice.dart';


class OptionTab extends StatelessWidget  {
  final String type;
  OptionTab(this.type);

  @override
  Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              elevation: 5.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TicketPriceScreen()),
                );
              },
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: ColorConstant.RED,
              child: type == 'ticketprice' ? Text(StringConstant.TICKET_PRICE, style:TextStyle(color:ColorConstant.YELLOW )) : Text(StringConstant.TICKET_PRICE, style:TextStyle(color:ColorConstant.BLACK )),
            ),
            RaisedButton(
              elevation: 5.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsScreen()),
                );
              },
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: ColorConstant.RED,
              child: type == 'news' ? Text(StringConstant.NEWS, style:TextStyle(color:ColorConstant.YELLOW )) : Text(StringConstant.NEWS, style:TextStyle(color:ColorConstant.BLACK )),
            ),
          ],
        ),
      );
    }


}
