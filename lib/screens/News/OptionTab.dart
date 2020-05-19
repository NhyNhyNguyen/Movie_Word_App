
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
import '../ButtonGradient.dart';
import 'TicketPrice.dart';


class OptionTab extends StatelessWidget  {
  final String type;
  OptionTab(this.type);

  @override
  Widget build(BuildContext context) {
    void choseOption(type){
      if(type == "ticketprice"){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TicketPriceScreen()),
        );
      };
      if(type == "news"){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewsScreen()),
        );
      };
    }

      return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ButtonGradient(type, "ticketprice", StringConstant.TICKET_PRICE, () => choseOption("ticketprice")),
            ButtonGradient(type, "news", StringConstant.NEWS, () => choseOption("news")),

          ],
        ),
      );
    }


}
