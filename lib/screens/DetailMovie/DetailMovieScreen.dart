
import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/constant/ConstantVar.dart';
import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:MovieWorld/model/Movie.dart';
import 'package:MovieWorld/screens/DetailMovie/Description.dart';
import 'package:MovieWorld/screens/DetailMovie/DuarationRate.dart';
import 'package:MovieWorld/screens/DetailMovie/MovieContent.dart';
import 'package:MovieWorld/screens/DetailMovie/Poster.dart';
import 'package:MovieWorld/screens/Homepage/FakeData.dart';
import 'package:MovieWorld/screens/User/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'CommentItem.dart';
import 'Trailer.dart';
import 'CommentMovie.dart';

class DetailMovieScreen extends StatefulWidget {
  String id;
  DetailMovieScreen(this.id);
  @override
  _DetailMovieScreenState createState() => _DetailMovieScreenState(id);
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  final _key = GlobalKey<FormState>();
  TextEditingController control = TextEditingController();

   String id;
  _DetailMovieScreenState(this.id);

   String url;
   dynamic data;

  Future<http.Response> postComment() async {
    print("hello");
    final http.Response response = await http.post(
      UrlConstant.URL_POST_COMMENT,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization':
        'Bearer ' + ConstantVar.jwt,
      },
      body: jsonEncode(<String, String>{
        "content": control.text,
        "filmId": id
      }),
    );
    print(id);
    print(control.text + "hhhh");
    print(response.statusCode);
    if (response.statusCode == 200) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DetailMovieScreen(id)));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => LoginScreen(handel: "")));
    }
    return response;
  }

  @override
  Widget build(BuildContext context) {



    url  = UrlConstant.URL_FILM + id;
    if (data == null) {
      http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json; charset=utf-8',
      }).then((http.Response response) {
       setState(() => data = json.decode(response.body) );
      });
    };
    if (data == null) return Container(
      child: Icon(Icons.cached, color: ColorConstant.GRAY_TEXT, size: 50,),
    );

        return MainLayOut.getMailLayout(
        context,
        Container(
          color: ColorConstant.VIOLET,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                Poster(data["poster"], data["name"], data["genres"], data["ratePoint"], data["id"].toString()),
                Description(data["filmDescription"]["premiere"], data["filmDescription"]["timeLimit"], data["filmDescription"]["artist"], data["filmDescription"]["director"], data["filmDescription"]["nation"],int.parse(id), data['name'], data['poster']),
                MovieContent(data["filmDescription"]["content"]),

                // comment//
                Container(
                  width: MediaQuery.of(context).size.height * 0.45,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text("Comments", style: StyleConstant.bigTxtStyle , textAlign: TextAlign.left,),
                ),

                Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: MediaQuery.of(context).size.height * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: ColorConstant.LIGHT_VIOLET,
                        ),
                      ),
                      Positioned(
                        child: Container(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children : <Widget>[
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 30, top: 20, bottom: 10),
                                        height:  MediaQuery.of(context).size.height * 0.1,
                                        decoration: BoxDecoration(
                                          color: ColorConstant.GRAY_TEXT,
                                          borderRadius: BorderRadius.all(Radius.circular(15)),
                                        ),
                                        child: Form(
                                          key: _key,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              hintText: "Leave your comment here...",
                                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                              border: InputBorder.none,
                                            ),
                                            controller: control,
                                          ),
                                        ),
                                      ),

                                  ),
                                    Container(
                                      margin: EdgeInsets.only(right: 20, top:10),
                                      child: IconButton(
                                        icon: Icon(Icons.send, color: ColorConstant.WHITE),
                                        onPressed: () => {
                                          (ConstantVar.jwt != "")
                                              ? postComment()
                                              : Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => LoginScreen(handel: "")),
                                          ) },
                                      ),
                                    )
                                  ]
                                ),
                                Container(
                                  child: CommentMovie(data['id'].toString()),
                                ),
                              ],
                            )
                        ),
                      )
                    ]
                ),


//                Trailer(data["trailer"]),

//                Container(
//                  height: MediaQuery.of(context).size.height * 0.7,
//                  child: CommentMovie(data["id"].toString())),
//                Poster(data.poster, data.name, data.genres, data.ratePoint),
//                Description(data.premiere, data.timeLimit, data.artist, data.director, data.nation),
//                MovieContent(data.content),
//                Trailer(data.trailer),
//                CommentMovie(),


              ],
            ),
          ),
        )
        ,
        "DETAIL", "Detail");
  }
}


//class DetailMovieScreen extends StatelessWidget {
//  final String id;
//  DetailMovieScreen(@required this.id);
//
//  @override
//  Widget build(BuildContext context) {
//
//    final detailMovie = FAKE_DATA.where((movie) {
//      return movie.id.contains(id);
//    }).toList();
//
//    return MainLayOut.getMailLayout(
//        context,
//        Container(
//          color: ColorConstant.VIOLET,
//          child: SingleChildScrollView(
//            physics: AlwaysScrollableScrollPhysics(),
//            child: Column(
//              children: <Widget>[
//                Poster(detailMovie[0].imageUrl, detailMovie[0].name, detailMovie[0].genre, detailMovie[0].rate),
//                Description(detailMovie[0].premiere, detailMovie[0].timeLimit, detailMovie[0].artist, detailMovie[0].director, detailMovie[0].nation),
//                MovieContent(detailMovie[0].content),
//                Trailer(),
//                CommentMovie(),
//                Text(detailMovie[0].timeLimit.toString()),
//
//
//              ],
//            ),
//          ),
//        )
//        ,
//        "DETAIL");
//  }
//}
