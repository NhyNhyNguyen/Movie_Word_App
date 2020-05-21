import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';

class MovieItem extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;
  final double rate;

  MovieItem(
      @required this.id,
      @required this.name,
      @required this.imageUrl,
      @required this.rate
      ) ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.only(bottom: 20, left: 12, right: 12),
        child:
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  height: 220,
                  width: double.infinity,
                  child: Image.asset(imageUrl, fit: BoxFit.fitHeight, )),),
                Positioned(
                  bottom: 0,

                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width * 0.945,
                    height: 50,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
//                      gradient: LinearGradient(
//                        colors: [
//                          Color.fromARGB(250, 50, 50, 50),
//                          Color.fromARGB(0, 0, 0, 0)
//                        ],
//                        begin: Alignment.bottomCenter,
//                        end: Alignment.topCenter,
//                      ),
                    gradient: ColorConstant.GRD_BLACK,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 8,
                          child: Text(
                            name,
                            style: TextStyle(
                              fontSize: 20,
                              color: ColorConstant.WHITE,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            rate.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              color: ColorConstant.WHITE,),
                            softWrap: true ,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                            //padding: EdgeInsets.all(5),
                          child: Container(
                            height: 30,
                            child: Image.asset(ImageConstant.RATE_ICON, fit: BoxFit.cover,))),
                      ],
                    ),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
