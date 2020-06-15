import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/screens/DetailMovie/DetailMovieScreen.dart';
import 'package:MovieWorld/screens/DetailMovie/Test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';

class MovieItem extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;
  final List genres;

  MovieItem(
      @required this.id,
      @required this.name,
      @required this.imageUrl,
      @required this.genres
      ) ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailMovieScreen(id)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Container(
                height: 190,
                width: double.infinity,
                child: Image.network(UrlConstant.URL_IMAGE+ imageUrl, fit: BoxFit.cover, )),),
            Text(
              name,
              style: TextStyle(
                              fontSize: 16,
                              color: ColorConstant.WHITE,
                            ),),
            Text(genres[0]["name"], style: TextStyle(fontSize: 12, color: ColorConstant.GRAY_TEXT),)

          ],
        ),
      ),

//      child: Card(
//        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//        elevation: 4,
//        //margin: EdgeInsets.all(10.0),
//        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
//        child:
//            Stack(
//              children: <Widget>[
//                ClipRRect(
//                  borderRadius: BorderRadius.all(Radius.circular(10)),
//                child: Container(
//                  height: 170,
//                  width: double.infinity,
//                  child: Image.asset(imageUrl, fit: BoxFit.cover, )),),
//                Positioned(
//                  bottom: 0,
//
//                  child: Container(
//                    padding: EdgeInsets.all(5),
//                    width: MediaQuery.of(context).size.width * 0.945,
//                    height: 50,
//                    decoration: new BoxDecoration(
//                      borderRadius: BorderRadius.only(
//                        bottomRight: Radius.circular(10),
//                        bottomLeft: Radius.circular(10),
//                      ),
////                      gradient: LinearGradient(
////                        colors: [
////                          Color.fromARGB(250, 50, 50, 50),
////                          Color.fromARGB(0, 0, 0, 0)
////                        ],
////                        begin: Alignment.bottomCenter,
////                        end: Alignment.topCenter,
////                      ),
//                    gradient: ColorConstant.GRD_BLACK,
//                    ),
//                    child: Row(
//                      children: <Widget>[
//                        Expanded(
//                          flex: 8,
//                          child: Text(
//                            name,
//                            style: TextStyle(
//                              fontSize: 20,
//                              color: ColorConstant.WHITE,
//                            ),
//                          ),
//                        ),
//                        Expanded(
//                          flex: 1,
//                          child: Text(
//                            rate.toString(),
//                            style: TextStyle(
//                              fontSize: 20,
//                              color: ColorConstant.WHITE,),
//                            softWrap: true ,
//                            overflow: TextOverflow.fade,
//                          ),
//                        ),
//                        Expanded(
//                          flex: 1,
//                            //padding: EdgeInsets.all(5),
//                          child: Container(
//                            height: 30,
//                            child: Image.asset(ImageConstant.RATE_ICON, fit: BoxFit.cover,))),
//                      ],
//                    ),
//                  ),
//                )
//          ],
//        ),
//      ),
    );
  }
}
